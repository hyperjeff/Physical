import Foundation

extension Physical: Equatable, Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(value)
		hasher.combine(values)
		hasher.combine(sigfigs)
		hasher.combine(isNotAThing)
		hasher.combine(units as NSDictionary)
	}
	
	/// Equality of a Physical object and a tuple pair of Physical objects with the same units, which is defined as being between the high and low values of the tuple. Does not make use of sigfigs.
	/// - Parameters:
	///   - left: Physical object
	///   - right: Array of exactly two Physical objects
	/// - Returns: Boolean
	public static func == (left: Physical, right: [Physical]) -> Bool {
		if right.count != 2 { return false }
		
		guard let rightA = right.first,
			  let rightB = right.last else { return false }
		
		if (left !~ rightA) || (left !~ rightB) { return false }
		
		return
			(rightA < left && left < rightB) ||
			(rightB < left && left < rightA)
	}
	
	/// Test for equality
	/// - Parameters:
	///   - left: Physical
	///   - right: Physical
	/// - Returns: Checks for "physical" equality, within the tolerance of their known significant digits.
	public static func == (left: Physical, right: Physical) -> Bool {
		
		// Policy: Should not-things be equal to other not-things? note: NaN == NaN in Swift
		//		if left.isNotAThing && right.isNotAThing {
		//			return true
		//		} else
		if left.isNotAThing || right.isNotAThing {
			return false
		}
		
		if left.hasDBValue || right.hasDBValue {
			return (left.hasDBValue ? left.dereferencedValue : left) == (right.hasDBValue ? right.dereferencedValue : right)
		}
		
		switch (left.kindOfQuantity, right.kindOfQuantity) {
			case (nil, nil): break
			case let (leftKind, nil):
				switch leftKind {
					case .ratio(denominator: _): break
					default: return false
				}
				
			case let (nil, rightKind):
				switch rightKind {
					case .ratio(denominator: _): break
					default: return false
				}
			
			case let (leftKind, rightKind):
				switch (leftKind, rightKind) {
					case (.difference, .difference): break
//					case let (.decibel(leftRef, _), .decibel(rightRef, _)):
//						if leftRef != rightRef { return false }
//					case let (.standardDecibel(leftDB), .standardDecibel(rightDB)):
//						if leftDB != rightDB { return false }
					default: return false
				}
		}
		
		if let lvs = left.values {
			if let rvs = right.values {
				if lvs.count != rvs.count { return false }
				
				// TODO: the following only works when sigfigs are less than 10 currently
				return lvs.equal(with: rvs, toSigFigs: Swift.min(lvs.sigfigs, rvs.sigfigs))
			}
			else {
				return false
			}
		}
		else {
			if let _ = right.values {
				return false
			}
		}
		
		if left ⧖ right {
			if left.hasDBValue && right.hasDBValue {
				return left.dereferencedValue ≐ right.dereferencedValue
			}
			
			return left ≐ right
		}
		
		var l = left
		var r = right
		
		var recheck = false
		
		if left.units.count == 1, let baseDimension = left.units.first?.key as? Dimension {
			let baseTransfer = left.to(baseDimension)
			if baseTransfer.isAThing {
				l = baseTransfer
				recheck = true
			}
		}
		
		if right.units.count == 1, let baseDimension = right.units.first?.key as? Dimension {
			let baseTransfer = right.to(baseDimension)
			if baseTransfer.isAThing {
				r = baseTransfer
				recheck = true
			}
		}
		
		if recheck && l ⧖ r {
			return l ≐ r
		}
		
		l.decomposeMixedUnits()
		r.decomposeMixedUnits()
		
		l.convertToFundamentalUnits()
		r.convertToFundamentalUnits()
		
		if !(l ≐ r) || l.units.count != r.units.count { return false }
		
		let leftUnits = l.units.map { $0.value }
		let rightUnits = r.units.map { $0.value }
		
		for unit in leftUnits {
			if rightUnits.first(where: { $0 == unit }) == nil {
				return false
			}
		}
		
		return true
	}
	
	public static func == (left: Physical, right: Double) -> Bool {
		left == right.constant
	}
	
	public static func == (left: Double, right: Physical) -> Bool {
		left.constant == right
	}

	public static func /= (left: inout Physical, right: Physical) {
		left = left / right
	}
	
	public static func /= (left: inout Physical, right: Double) {
		left = left / right
	}
	
}
