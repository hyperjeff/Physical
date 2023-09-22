import Foundation

extension Physical: Equatable, Comparable, Hashable {
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
		
		return (rightA < left && left < rightB) ||
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
		
		
		// FIXME: vector arrays don't seem to actually compare values at all!
		
		if let lvs = left.values {
			if let rvs = right.values {
				if lvs.count != rvs.count { return false }
				
				// next line needs to be fixed, using ≐ equivalent
				
				if lvs != rvs { return false }
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
			return left ≐ right
		}
		
		var l = left
		var r = right
		
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
		/*
		 let lesserSigfigs = (l.sigfigs < r.sigfigs ? l.sigfigs : r.sigfigs)
		 
		 return (l.value.toSigfigs(lesserSigfigs) == r.value.toSigfigs(lesserSigfigs))
		 */
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
	
	public static func < (left: Physical, right: Physical) -> Bool {
		if left.isNotAThing || right.isNotAThing {
			return false
		}
		
		if left ~ right {
			if left ⧖ right {
				return left.value < right.value
			}
			else {
				var (lnew, rnew) = (left, right)
				lnew.convertToFundamentalUnits()
				rnew.convertToFundamentalUnits()
				
				return lnew.value < rnew.value
			}
		}
		
		return false
	}
	
	public static func <= (left: Physical, right: Physical) -> Bool {
		if left.isNotAThing || right.isNotAThing {
			return false
		}
		
		if left ~ right {
			if left ⧖ right {
				return left.value <= right.value
			}
			else {
				var (lnew, rnew) = (left, right)
				lnew.convertToFundamentalUnits()
				rnew.convertToFundamentalUnits()
				
				return lnew.value <= rnew.value
			}
		}
		
		return false
	}
	
	public static func > (left: Physical, right: Physical) -> Bool {
		right < left
	}
}
