import Foundation
import Accelerate

public extension Physical {
	
	/// Tests two physical quantities for exactly matching units
	/// - Parameters:
	///   - left: Physical quantity
	///   - right: Physical quantity
	static func ⧖ (left: Physical, right: Physical) -> Bool {
		return equalDimensionDictionaries(left.units, right.units)
	}
	
	/// Tests to see if the units of two physical quantities have any fundamental base units in common
	/// - Parameters:
	///   - left: Physical quantity
	///   - right: Physical quantity
	static func ⨃ (left: Physical, right: Physical) -> Bool {
		if left.isNotAThing || right.isNotAThing {
			return false
		}
		
		// Original implementation not trying to be performant at all:
		
		var leftFundamental = left
		var rightFundamental = right
		
		leftFundamental.decomposeMixedUnits()
		rightFundamental.decomposeMixedUnits()
		
		// TODO: This is too aggressive to go straight to fund units when it might not be necessary
		//   ex: ft^2 going to m^2, need not be broken down more.
		
		leftFundamental.convertToFundamentalUnits()
		rightFundamental.convertToFundamentalUnits()
		
		return !Set(leftFundamental.baseUnits)
			.intersection(rightFundamental.baseUnits)
			.isEmpty
		
	}
	
	/// Tests to see if the units of two physical quantities have any fundamental base units in common on the same side of the numerator or denominator
	/// - Parameters:
	///   - left: Physical quantity
	///   - right: Physical quantity
	static func ⩀ (left: Physical, right: Physical) -> Bool {
		if left.isNotAThing || right.isNotAThing {
			return false
		}
		
		var leftFundamental = left
		var rightFundamental = right
		
		leftFundamental.decomposeMixedUnits()
		rightFundamental.decomposeMixedUnits()
		
		leftFundamental.convertToFundamentalUnits()
		rightFundamental.convertToFundamentalUnits()
		
		for (baseUnitLeft, (_, expLeft)) in leftFundamental.units {
			if let (_, expRight) = rightFundamental.units[baseUnitLeft] {
				if expLeft.matchesSign(of: expRight) {
					return true
				}
			}
		}
		
		return false
	}
	
	/// Tests to see if two physical quantities are of the same kind, i.e., of the same fundamental order of units
	/// - Parameters:
	///   - left: Physical quantity
	///   - right: Physical quantity
	static func ~ (left: Physical, right: Physical) -> Bool {
		if left.isNotAThing || right.isNotAThing {
			return false
		}
		
		let leftUnits = left.units.filter { $0.key != UnitAmount.baseUnit() }
		let rightUnits = right.units.filter { $0.key != UnitAmount.baseUnit() }
		
		if equalDimensionDictionaries(leftUnits, rightUnits) {
			return true
		}
		else {
			var newLeft = left.dereferencedValue
			var newRight = right.dereferencedValue
			
			newLeft.decomposeMixedUnits()
			newRight.decomposeMixedUnits()
			
			newLeft.convertToFundamentalUnits()
			newRight.convertToFundamentalUnits()
			
			let newLeftUnits = newLeft.units.filter { $0.key != UnitAmount.baseUnit() }
			let newRightUnits = newRight.units.filter { $0.key != UnitAmount.baseUnit() }
			
			if !equalDimensionDictionaries(newLeftUnits, newRightUnits) {
//				print("stop")
			}
			
			return equalDimensionDictionaries(newLeftUnits, newRightUnits)
		}
	}
	
	/// Tests to see if two physical quantities are not of the same kind, i.e., not of the same fundamental order of units
	/// - Parameters:
	///   - left: Physical quantity
	///   - right: Physical quantity
	static func !~ (left: Physical, right: Physical) -> Bool {
		return !(left ~ right)
	}
	
	/// Tests two physical quantities to see if either uses a non-zero-offset system of units
	/// - Parameters:
	///   - left: Physical quantity
	///   - right: Physical quantity
	static func ⧦ (left: Physical, right: Physical) -> Bool {
		return !(left.units.containsNonZeroOffsetUnits() || right.units.containsNonZeroOffsetUnits())
	}
	
	/// Tests two physical quantities for matching set non-zero-offset units (or both having none). If this test is used then ~ is unnecessary.
	/// - Parameters:
	///   - left: Physical quantity
	///   - right: Physical quantity
	static func ⧗ (left: Physical, right: Physical) -> Bool {
		if left.units.containsNonZeroOffsetUnits() || right.units.containsNonZeroOffsetUnits() {
			let leftZeroSet = Set(left.units.nonZeroOffsetUnits)
			let rightZeroSet = Set(right.units.nonZeroOffsetUnits)
			
			return leftZeroSet == rightZeroSet
		}
		
		return left ~ right
	}
	
	/// Tests to see if two physical quantities' values (without regard to units) are equal given their sigfigs
	/// - Parameters:
	///   - left: Physical quantity
	///   - right: Physical quantity
	static func ≐ (left: Physical, right: Physical) -> Bool {
		if left.value.isZero || right.value.isZero { return (left.value.isZero && right.value.isZero) }
		
		if left.value.isNaN || right.value.isNaN { return false }
		
		// FIXME: Implement this for vectorized values & make unit tests
		if left.isArray || right.isArray { return false }
		
		let lcs = Physical.Globals.shared.sigfigs ?? Swift.min(left.sigfigs, right.sigfigs)
		
		func valueSignature(_ p: Physical) -> (Int, Int) {
			let a = pow(10, Double(lcs - 1) - floor(log10(abs(p.value))))
			let b = round(Double(abs(p.value)) * a)
			let c = Int(log10(b)) == lcs - 1 ? 1 : 0.1
			let d = Int(b * c) * (p.value < 0 ? -1 : 1)
			
			let ac = a * c
//			print((a, b, c, d, ac <= 1e18 ? Int(ac) : Int(log10(ac))))
			
			// warning: Horrible hack, essentially punting for items that are too big to really check on a * c, but at least checking its exponents should be better than not checking (?)
			
			return (ac <= 1e18 ? Int(ac) : Int(log10(ac)), d)
		}
		
		return valueSignature(left) == valueSignature(right)
	}
	
	/// Multiplies two physical quantities. If either is .notAThing, then the result will be as well. If they contain commensurate but not identical units, the result will in terms of only required fundamental base units.
	/// - Parameters:
	///   - left: Physical quantity
	///   - right: Physical quantity
	static func * (left: Physical, right: Physical) -> Physical {
		preMultiply(left, right)
	}
	
	/// Does an initial check on sense of the multiplication, and will call the `multiply()` function after possibly decomposing and converting the units if required
	/// - Parameters:
	///   - left: Physical quantity
	///   - right: Physical quantity
	///   - elementWise: Bool to indicate element-wise multiplication for objects with an array of values
	/// - Returns: Physical quantity
	static func preMultiply(_ leftIn: Self, _ rightIn: Self, elementWise: Bool = false) -> Physical {
		var left = leftIn
		var right = rightIn
		
		if left.isNotAThing || right.isNotAThing {
			return notAThing(logging: "\(left) || \(right)", elements: [left, right])
		}
		
		if left.hasDBValue ^^ right.hasDBValue {
			if left.hasDBValue {
				left = leftIn.dereferencedValue
			}
			else if right.hasDBValue {
				right = rightIn.dereferencedValue
			}
		}
		
		// Totally disallow pure non-zero-offset units from multiplying
		if let leftUnit = left.units.first,
		   let rightUnit = right.units.first,
		   let unitRight = right.uniqueDimension,
		   let unitLeft = left.uniqueDimension,
		   unitLeft ~ unitRight,
		   (right.units.containsNonZeroOffsetUnits() || // i.e., two temps
			left.units.containsNonZeroOffsetUnits()) {
			
			if (right.value.exponent < 0 && left.kindOfQuantity == nil) ||
				(left.value.exponent < 0 && right.kindOfQuantity == nil) {
				return .notAThing(logging: "Ratio of temperatures must consist of temp differences in numerator: \(left)")
			}
			
			if leftUnit.value.exponent + rightUnit.value.exponent != .integer(0) {
				return .notAThing(logging: "Can't multiply two non-zero-offset values: \(left) * \(right)")
			}
		}
		
		// We can multiply non-zero-offset units, but only if they are the same ones
//		if !(left ⧦ right) && !(left ⧗ right) {
//			return notAThing(logging: "!(left ⧦ right) && !(left ⧗ right) → !\(left ⧦ right) && !\(left ⧗ right)", elements: [left, right])
//		}
		
		let leftHertz = ((Array(left.units.keys) == [UnitFrequency.hertz]) && !right.isUnitless)
		let rightHertz = ((Array(right.units.keys) == [UnitFrequency.hertz]) && !left.isUnitless)
		
		if leftHertz ⊻ rightHertz {
			if leftHertz {
				left = left.using(.seconds) ?? .notAThing(logging: "Unable to convert Hz to perSecond")
			}
			else {
				right = right.using(.seconds) ?? .notAThing(logging: "Unable to convert Hz to perSecond")
			}
		}
		
		let result = multiply(left, right, elementWise: elementWise)
		
		// Only units which have a common set of units will be decomposed,
		// as long as they are not non-zero-offset units
		if !(left ⧖ right) && (left ⨃ right) && (left ⧦ right) {
			var (newLeft, newRight) = (left, right)
			
			newLeft.decomposeMixedUnits()
			newRight.decomposeMixedUnits()
			
			newLeft.convertToFundamentalUnits() // <- note, ⨃ does this calculation also!
			newRight.convertToFundamentalUnits()
			
			// Only use the fundamentalUnits result if it's clearly simpler than our input dimensions
			
			let fundamentalResult = multiply(newLeft, newRight, elementWise: elementWise)
			
			// TODO: should we include (left ⩀ right) ||  below?
			if (fundamentalResult.units.count < result.units.count) {
				return fundamentalResult
			}
		}
		
		// All other cases should be directly multiplied without first converting
		return result
	}
	
	/// Does the main grunt work for Physical quantity multiplication. Internal use only.
	/// - Parameters:
	///   - left: Physical quantity
	///   - right: Physical quantity
	/// - Returns: Physical quantity
	static func multiply(_ lefty: Self, _ righty: Self, elementWise: Bool = false) -> Self {
		if let leftValues = lefty.values,
		   let rightValues = righty.values,
		   leftValues.count != rightValues.count {
			return notAThing(logging: "vector \(lefty) * \(righty), but element count mismatch: \(leftValues.count), \(rightValues.count)")
		}
		
		if lefty.value.isNaN || righty.value.isNaN {
			return notAThing(logging: "\(lefty) * \(righty)")
		}
		
		// FIXME: Check if Hz and s both present, and convert Hz → /s if so
		//        Ideally without triggering a fundamental conversion
		
		var left = lefty
		var right = righty

		let leftDB = left.hasDBValue
		let rightDB = right.hasDBValue
		
		if left.hasDBValue {
			left = left.dereferencedValue
		}
		
		if right.hasDBValue {
			right = right.dereferencedValue
		}
		
		var scaleFactor: Double = 1
		var newUnits = left.units
		
		var usedRightDimensions: [Dimension] = []
		
		for (baseLeft, (unitLeft, expLeft)) in left.units {
			for (baseRight, (unitRight, expRight)) in right.units {
				if (baseLeft == baseRight) { //}&& (unitLeft != unitRight) {
					let a = Measurement<Dimension>(value: 1, unit: unitLeft)
					let b = Measurement<Dimension>(value: 1, unit: unitRight)
					
					// used purely to find the least common unit dimension
					let newMeasure = a + b
					
					let aInNewUnits = a.converted(to: Dimension(symbol: newMeasure.unit.symbol, converter: newMeasure.unit.converter))
					let bInNewUnits = b.converted(to: Dimension(symbol: newMeasure.unit.symbol, converter: newMeasure.unit.converter))
					
					let aNumber = aInNewUnits.value
					let bNumber = bInNewUnits.value
					
					if aNumber != 1 {
						scaleFactor *= aNumber ^ expLeft.realValue
					}
					if bNumber != 1 {
						scaleFactor *= bNumber ^ expRight.realValue
					}
					
					let sum = expLeft + expRight
					if !sum.isZero {
						newUnits[baseLeft] = (newMeasure.unit, sum)
					}
					else if let _ = newUnits[baseLeft] {
						newUnits.removeValue(forKey: baseLeft)
					}
					
					usedRightDimensions.append(baseRight)
				}
			}
		}
		
		let rightUnitsStillToGo = right.units.filter { !usedRightDimensions.contains($0.key) }
		
		for (baseRight, (unit, exponent)) in rightUnitsStillToGo {
			if let (_, current) = newUnits[baseRight] {
				let sum = current + exponent
				if !sum.isZero {
					newUnits[baseRight] = (unit, sum)
				}
				else {
					newUnits.removeValue(forKey: baseRight)
				}
			}
			else {
				// must check there are no commensurate units   <- this still true?
				var commensurate = false
				for (baseLeft, _) in left.units {
					if baseLeft == baseRight {
						commensurate = true
						break
					}
				}
				
				if !commensurate {
					newUnits[baseRight] = (unit, exponent)
				}
			}
		}
		
		let newValue = left.value * right.value * scaleFactor
		
		var out: Physical
		
		if let leftValues = left.values,
		   let rightValues = right.values {
			if elementWise {
				out = Physical(
					values: (leftValues ⨀ rightValues) * scaleFactor,
					units: newUnits,
					sigfigs: Swift.min(left.sigfigs, right.sigfigs)
				)
			}
			else {
				out = notAThing(logging: "vector \(left) * \(right) undefined")
			}
		}
		else if let leftValues = left.values {
			out = Physical(
				values: leftValues * right.value * scaleFactor,
				units: newUnits,
				sigfigs: Swift.min(left.sigfigs, right.sigfigs)
			)
		}
		else if let rightValues = right.values {
			out = Physical(
				values: left.value * rightValues * scaleFactor,
				units: newUnits,
				sigfigs: Swift.min(left.sigfigs, right.sigfigs)
			)
		}
		else {
			out = Physical(
				value: newValue,
				units: newUnits,
				sigfigs: Swift.min(left.sigfigs, right.sigfigs)
			)
			
			let rx = right.value
			let lx = left.value
			let ru = right.standardDeviationRaw
			let lu = left.standardDeviationRaw
			
			out.standardDeviationRaw = √((ru * ru * lx * lx) + (lu * lu * rx * rx))
		}
		
		switch (leftDB, rightDB) {
			case (true, false): out.kindOfQuantity = left.kindOfQuantity
			case (false, true): out.kindOfQuantity = right.kindOfQuantity
			default: break
		}
		
		out.tags = left.tags.merging(right.tags) { (a, b) in a + b }
		
		return out
	}
	
	static func / (left: Physical, right: Physical) -> Self {
		if left.isNotAThing || right.isNotAThing { return notAThing(logging: "\(left) || \(right)", elements: [left, right]) }
		
		var product = left * (right ^ -1)
				
		if product.isUnitless && left ~ right {
			product.kindOfQuantity = .ratio(denominator: right)
		}
		
		return product
	}
	
	static func + (left: Physical, right: Physical) -> Physical {
		if left.isNotAThing || right.isNotAThing {
			return notAThing(logging: "\(left) + \(right)", elements: [left, right])
		}
		
		if left.value.isNaN || right.value.isNaN {
			return notAThing
		}
		
		// TODO: Why am I not testing for ~ and an early escape if that fails?
		
		// TODO: An analysis of the time drag all these extra checks impose
		
		var newLeft = left
		var newRight = right
		
		var imposeFinalType: Dimension?
		var imposeDifference = false
		
		if left ~ Temperature.self && right ~ Temperature.self {
			switch (left.isDifference, right.isDifference) {
				case (true, true):
					if let leftUnit = left.units.first,
					   let rightUnit = right.units.first {
						if leftUnit.value.unit != rightUnit.value.unit {
							newLeft = newLeft → .kelvin
							newRight = newRight → .kelvin
						}
						
						imposeDifference = true
					}
					
				case (false, true):
					if let leftUnit = left.units.first {
						newLeft = newLeft → .kelvin
						newRight.convertToFundamentalUnits()
						imposeFinalType = leftUnit.value.unit
					}
					
				case (true, false):
					if let rightUnit = right.units.first {
						newLeft.convertToFundamentalUnits()
						newRight = newRight → .kelvin
						imposeFinalType = rightUnit.value.unit
					}

				default:
					if !(left ⧖ right) {
						return .notAThing(logging: "Adding mixed temperature scales", elements: [left, right])
					}
					else if let leftValues = left.values,
							let rightValues = right.values,
							(leftValues.allNegative ^^ rightValues.allNegative) {
						imposeDifference = true
					}
					else if (left.value < 0) ^^ (right.value < 0) {
						imposeDifference = true
					}
					else if left.units.containsNonZeroOffsetUnits() || right.units.containsNonZeroOffsetUnits() {
						return .notAThing(logging: "Addition of two non-zero-offset temperature scales is ambiguous", elements: [left, right])
					}
			}
		}
		
		func additionSigfigs(_ a: Double, _ b: Double) -> Int {
			func places(_ x: Double) -> Int {
				let logabsx = log10(abs(x))
				if logabsx.isInfinite {
					return Int.min + 17
				}
				
				return Int(floor(logabsx)) + 1
			}
			
			let mostSignificantPlace = Swift.max(
				places(a) - left.sigfigs,
				places(b) - right.sigfigs
			)
			
			let resultPlaces = places(a + b)
			
			return Swift.max(0, resultPlaces - mostSignificantPlace)
		}
		
		let leftDB = left.hasDBValue
		let rightDB = right.hasDBValue
		
		if leftDB || rightDB {
			let commonReference = left.dBReference
			
			if leftDB && rightDB {
				newLeft = left.dereferencedValue
				newRight = right.dereferencedValue.dB(reference: commonReference)
				
				if let leftRatio = left.ratio,
				   let rightRatio = newRight.ratio {
					if let newRef = left.commonDBReference {
						return leftRatio * rightRatio * commonReference → newRef
					}
					else {
						return (leftRatio * rightRatio * commonReference).dB(reference: commonReference)
					}
				}
				
				return .notAThing(logging: "Something has gone wrong adding \(left) to \(right)")
			}
			
			// ensure we are working with Physical + dBx
			if leftDB {
				newLeft = right
				newRight = left
			}
			
			if let rightRatio = newRight.ratio {
				return newLeft * rightRatio
			}
			
			return .notAThing(logging: "Unable to add incommensurate \(left) and \(right)")
		}
		
		if newLeft ⧗ newRight {
			// Important note: this requires exact unit matching
			// so ~ is not a sufficient condition.
			
			func returnPhysical() -> Physical {
				var out: Physical
				
				if let leftValues = newLeft.values,
				   let rightValues = newRight.values,
				   let sum = leftValues + rightValues {
					out = Physical(
						values: sum,
						units: newLeft.units,
						sigfigs: additionSigfigs(newLeft.value, newRight.value)
					)
				}
				else if let leftValues = newLeft.values {
					out = Physical(
						values: leftValues + newRight.value,
						units: newLeft.units,
						sigfigs: additionSigfigs(newLeft.value, newRight.value)
					)
				}
				else if let rightValues = newRight.values {
					out = Physical(
						values: newLeft.value + rightValues,
						units: newLeft.units,
						sigfigs: additionSigfigs(newLeft.value, newRight.value)
					)
				}
				else {
					out = Physical(
						value: newLeft.value + newRight.value,
						units: newLeft.units,
						sigfigs: additionSigfigs(newLeft.value, newRight.value)
					)
					
					let ls² = (newLeft.standardDeviationRaw ^ 2)
					let rs² = (newRight.standardDeviationRaw ^ 2)
					
					out.standardDeviationRaw = (newRight.value < 0) ? // ← oh this feels bad
					√abs(ls² - rs²) :
					√abs(ls² + rs²)
				}
				
				out.tags = left.tags.merging(right.tags) {
					(a, b) in (a < b) ? b : a
				}
				
				if let typeOut = imposeFinalType {
					out = out.to(typeOut)
				}
				
				if imposeDifference {
					out.kindOfQuantity = .difference
				}
				
				return out
			}
			
			if left ⧖ right {
				return returnPhysical()
			}
			else {
				newLeft.convertToFundamentalUnits()
				newRight.convertToFundamentalUnits()
				
				if newLeft ⧖ newRight {
					return returnPhysical()
				}
				
				newLeft.decomposeMixedUnits()
				newRight.decomposeMixedUnits()
				
				if newLeft ⧖ newRight {
					return returnPhysical()
				}
			}
		}
		
		return notAThing(logging: "\(left) + \(right)", elements: [left, right])
	}
	
	static func ^ (left: Physical, right: Physical) -> Physical {
		if right.isDimensionless && !right.isArray {
			// TODO: this *always* forces the Physical ^ Double path, which robs us of clean exponents, no?
			return left ^ right.value
		}
		
		return notAThing(logging: "\(left) ^ \(right)", elements: [left, right])
	}
	
	static func - (left: Physical, right: Physical) -> Physical {
		var newRight = right
		
		if let values = right.values {
			newRight.values = -1 * values
		}
		else {
			newRight.value = -1 * right.value
		}
		
		return left + newRight
	}
	
	static func += (left: inout Physical, right: Physical) {
		left = left + right
	}
	
	static func -= (left: inout Physical, right: Physical) {
		left = left - right
	}
	
	static func *= (left: inout Physical, right: Physical) {
		left = left * right
	}
	
	// MARK: - Combining with numbers -
	
	static func + (left: Double, right: Physical) -> Physical {
		left.constant + right
	}
	
	static func + (left: Physical, right: Double) -> Physical {
		left + right.constant
	}
	
	static func - (left: Double, right: Physical) -> Physical {
		left.constant - right
	}
	
	static func - (left: Physical, right: Double) -> Physical {
		left - right.constant
	}
	
	static func * (left: Double, right: Physical) -> Physical {
		if left.isNaN || right.value.isNaN {
			return notAThing
		}
		
		if left != -1,
		   right ~ Temperature.self,
		   let unit = right.uniqueDimension,
		   unit.hasNonZeroOffset {
			return .notAThing(logging: "Cannot multiply a constant by a temperature with a non-zero offset", elements: [right])
		}
		
		var out = right
		out.value = left * right.value
		out.kindOfQuantity = right.kindOfQuantity
		out.tags = right.tags
		
		return out
	}
	
	static func * (left: Physical, right: Double) -> Physical {
		right * left
	}
	
	static func * (left: Int, right: Physical) -> Physical {
		Double(left) * right
	}
	
	static func * (left: Physical, right: Int) -> Physical {
		left * Double(right)
	}
	
	static func * (left: [Double], right: Physical) -> Physical {
		if !right.isArray {
			return Physical(values: left * right.value, units: right.units, sigfigs: right.sigfigs)
		}
		
		return .notAThing //(logging: "ambiguous: array of Doubles multiplied by Physical object with an array of values", elements: [right])
	}
	
	static func * (left: Physical, right: [Double]) -> Physical {
		right * left
	}
	
	static func / (left: Physical, right: Double) -> Physical {
		if right.isNaN || right.isZero {
			return notAThing
		}
		
		if abs(right) != 1,
		   let unit = left.uniqueDimension,
		   unit.hasNonZeroOffset {
			return .notAThing(logging: "Can't sensibly divide a non-zero-based measure", elements: [left])
		}
		
		if let leftValues = left.values {
			return Physical(values: leftValues / right, units: left.units, sigfigs: left.sigfigs)
		}
		else {
			return Physical(value: left.value / right, units: left.units, sigfigs: left.sigfigs)
		}
	}
	
	static func / (left: Physical, right: Int) -> Physical {
		left / Double(right)
	}
	
	static func / (left: Int, right: Physical) -> Physical {
		Double(left) / right
	}
	
	static func / (left: Double, right: Physical) -> Physical {
		var out = (left.constant / right)
		out.sigfigs = right.sigfigs
		
		return out
	}
	
	static func ↑ (left: Physical, right: Int) -> Physical {
		left ^ Double(right)
	}
	
	static func ↑ (left: Physical, right: Double) -> Physical {
		left ^ right
	}
	
	static func ^ (left: Physical, right: Int) -> Physical {
		left ^ Double(right)
	}
	
	static func ^ (lefty: Physical, right: Double) -> Physical {
		if right.isNaN {
			return notAThing(logging: "Power \(right) is not a number")
		}
		
		let left = lefty.hasDBValue ? lefty.dereferencedValue : lefty
		
		if abs(right) != 1,
		   left ~ Temperature.self,
		   let unit = left.uniqueDimension,
		   unit.hasNonZeroOffset {
			return notAThing(logging: "Non-zero-offset temperature scales cannot be raised to powers", elements: [left])
		}
		
		var newUnits: DimensionDictionary = [:]
		var power: TieredNumber!
		
		if abs(right.rounded() - right) < Double.ulpOfOne {
			power = .integer(Int(right.rounded()))
		}
		else {
			// TODO: Found results can be cached, allowing low-impact checks out past 9.
			
			var foundRational = false
			
			for x in 2...9 {
				let candidate = right * Double(x)
				if abs(candidate.rounded() - candidate) < Double.ulpOfOne {
					power = .fraction(Int(right * Double(x)), x)
					foundRational = true
					break
				}
			}
			
			if !foundRational {
				power = .real(right)
			}
		}
		
		for (baseUnit, (unit, exponent)) in left.units {
			func newUnitTest(compositeDimensions: Int) {
				let proposedPower = power * exponent
				let intPower = proposedPower * .integer(compositeDimensions)
				
				if case .fraction(_, _) = proposedPower,
				   case .integer(_) = intPower,
				   let newUnit = productDimensionLookup[unit] {
					
					newUnits[newUnit.baseUnitCheck()!] = (newUnit, intPower)
				}
				else {
					newUnits[baseUnit] = (unit, power * exponent)
				}
			}
			
			switch baseUnit {
				case is UnitArea:
					newUnitTest(compositeDimensions: 2)
					
				case is UnitVolume:
					newUnitTest(compositeDimensions: 3)
					
				case is UnitSolidAngle:
					newUnitTest(compositeDimensions: 2)
					
				default:
					newUnits[baseUnit] = (unit, power * exponent)
			}
		}
		
		var out: Physical
		
		if var values = left.values {
			var powers = [Double](repeating: right, count: values.count)
			var newValues = [Double](repeating: 0, count: values.count)
			var count = Int32(left.count)
			
			vvpow(&newValues, &powers, &values, &count)
			
			out = Physical(values: newValues, units: newUnits, sigfigs: left.sigfigs)
		}
		else {
			out = Physical(
				value: pow(left.value, right),
				units: newUnits,
				sigfigs: left.sigfigs
			)
		}
		
		if !lefty.tags.isEmpty {
			var newTags: [String : TieredNumber] = [:]
			
			for tag in lefty.tags {
				newTags[tag.0] = tag.1 * right
			}
			
			out.tags = newTags
		}
		
		return out
	}
	
	static func ^ (left: Double, right: Physical) -> Physical {
		if right.isDimensionless, var exponents = right.values {
			var count = Int32(right.count)
			var base = [Double](repeating: left, count: right.count)
			var answer = [Double](repeating: 0, count: right.count)
			
			vvpow(&answer, &exponents, &base, &count)
			
			return answer.constant
		}
		
		return notAThing(logging: "\(left) ^ \(right)", elements: [right])
	}
	
	static func *= (left: inout Physical, right: Double) {
		left = left * right
	}
	
}
