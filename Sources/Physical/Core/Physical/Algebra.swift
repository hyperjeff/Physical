import Foundation
import Accelerate

extension Physical {
	// Quadratic operations:
	
	/// Tests two physical quantities for exactly matching units
	/// - Parameters:
	///   - left: Physical quantity
	///   - right: Physical quantity
	public static func ⧖ (left: Physical, right: Physical) -> Bool {
		return equalDimensionDictionaries(left.units, right.units)
	}
	
	/// Tests to see if the units of two physical quantities have any fundamental base units in common
	/// - Parameters:
	///   - left: Physical quantity
	///   - right: Physical quantity
	public static func ⨃ (left: Physical, right: Physical) -> Bool {
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
	public static func ⩀ (left: Physical, right: Physical) -> Bool {
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
	public static func ~ (left: Physical, right: Physical) -> Bool {
		if left.isNotAThing || right.isNotAThing {
			return false
		}
		
		let leftUnits = left.units.filter { $0.key != UnitAmount.baseUnit() }
		let rightUnits = right.units.filter { $0.key != UnitAmount.baseUnit() }
		
		if equalDimensionDictionaries(leftUnits, rightUnits) {
			return true
		}
		else {
			var newLeft = left
			var newRight = right
			
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
	public static func !~ (left: Physical, right: Physical) -> Bool {
		return !(left ~ right)
	}
	
	/// Tests two physical quantities to see if either uses a non-zero-offset system of units
	/// - Parameters:
	///   - left: Physical quantity
	///   - right: Physical quantity
	public static func ⧦ (left: Physical, right: Physical) -> Bool {
		return !(left.units.containsNonZeroOffsetUnits() || right.units.containsNonZeroOffsetUnits())
	}
	
	/// Tests two physical quantities for matching set non-zero-offset units (or both having none). If this test is used then ~ is unnecessary.
	/// - Parameters:
	///   - left: Physical quantity
	///   - right: Physical quantity
	public static func ⧗ (left: Physical, right: Physical) -> Bool {
		if left.units.containsNonZeroOffsetUnits() || right.units.containsNonZeroOffsetUnits() {
			
			let leftZeroSet = Set(left.units.map { $0.value.unit }.filter { nonZeroOffsetUnits.contains($0) })
			let rightZeroSet = Set(right.units.map { $0.value.unit }.filter { nonZeroOffsetUnits.contains($0) })
			
			return leftZeroSet == rightZeroSet
		}
		
		return true
	}
	
	/// Tests to see if two physical quantities' values (without regard to units) are equal given their sigfigs
	/// - Parameters:
	///   - left: Physical quantity
	///   - right: Physical quantity
	public static func ≐ (left: Physical, right: Physical) -> Bool {
		if left.value.isZero || right.value.isZero { return (left.value.isZero && right.value.isZero) }
		
		if left.value.isNaN || right.value.isNaN { return false }
		
		// FIXME: Implement this for vectorized values & make unit tests
		if left.values != nil || right.values != nil { return false }
		
		let lcs = Physical.Globals.shared.sigfigs ?? Swift.min(left.sigfigs, right.sigfigs)
		
		func valueSignature(_ p: Physical) -> Int {
			let a = pow(10, Double(lcs - 1) - floor(log10(abs(p.value))))
			return Int(round(Double(abs(p.value)) * a)) * Int(p.value < 0 ? -1 : 1)
		}
		
		/* Core problem with this technique:
		 
		 Converting to fundamental units, which is necessary, can *cause* a spurious discrepancy in the last digit.
		 
		 But we can't give leaway here, because the last digit might be the whole point of the comparison, and it may also be exaggerated since the signature chops off all trailing zeros.
		 */
		
		return valueSignature(left) == valueSignature(right)
	}
	
	/// Multiplies two physical quantities. If either is .notAThing, then the result will be as well. If they contain commensurate but not identical units, the result will in terms of only required fundamental base units.
	/// - Parameters:
	///   - left: Physical quantity
	///   - right: Physical quantity
	public static func * (left: Physical, right: Physical) -> Physical {
		preMultiply(left, right)
	}
	
	public static func preMultiply(_ left: Self, _ right: Self, elementWise: Bool = false) -> Physical {
		if left.isNotAThing || right.isNotAThing {
			return notAThing(logging: "\(left) || \(right)", elements: [left, right])
		}
		
		// probably should be refactored:
		
		// We can multiply non-zero-offset units, but only if they are the same ones
		if !(left ⧦ right) && !(left ⧗ right) {
			return notAThing(logging: "!(left ⧦ right) && !(left ⧗ right) → !\(left ⧦ right) && !\(left ⧗ right)", elements: [left, right])
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
	public static func multiply(_ left: Self, _ right: Self, elementWise: Bool = false) -> Self {
		if let leftValues = left.values,
		   let rightValues = right.values,
		   leftValues.count != rightValues.count {
			return notAThing(logging: "vector \(left) * \(right), but element count mismatch: \(leftValues.count), \(rightValues.count)")
		}
		
		if left.value.isNaN || right.value.isNaN {
			return notAThing(logging: "\(left) * \(right)")
		}
		
		var scaleFactor: Double = 1
		var newUnits = left.units
		
		// let allKeys = Set<Dimension>(left.units.keys).union(Set<Dimension>(right.units.keys)) ...
		
		var usedRightDimensions: [Dimension] = []
		
		/* LLDB helpers
		 
		 let c = 1.kg/.m³ * 0.001.m
		 let d = 1.kg/.m³ * 1.mm
		 
		 po "\(left.description) *** \(right.description)"
		 po "\(baseLeft.symbol) == \(baseRight.symbol)"
		 po "\(unitLeft.symbol)(\(expLeft)) == \(unitRight.symbol)(\(expRight))"
		 po usedRightDimensions.map { "\($0.symbol)" }.joined(separator: ", ")
		 po right.units.map { "\($0.value.unit.symbol)" }.joined(separator: ", ")
		 po newUnits.map { "\($0.value.unit.symbol)(\($0.value.exponent))" }.joined(separator: ", ")
		 */
		
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
					values: (leftValues ⨀ rightValues),
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
				values: leftValues * right.value,
				units: newUnits,
				sigfigs: Swift.min(left.sigfigs, right.sigfigs)
			)
		}
		else if let rightValues = right.values {
			out = Physical(
				values: left.value * rightValues,
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
		
		out.tags = left.tags.merging(right.tags) { (a, b) in a + b }
		
		return out
	}
	
	public static func / (left: Physical, right: Physical) -> Self {
		if left.isNotAThing || right.isNotAThing { return notAThing(logging: "\(left) || \(right)", elements: [left, right]) }
		
		return left * (right ^ -1)
	}
	
	public static func + (left: Physical, right: Physical) -> Physical {
		if left.isNotAThing || right.isNotAThing {
			return notAThing(logging: "\(left) + \(right)", elements: [left, right])
		}
		
		if left.value.isNaN || right.value.isNaN {
			return notAThing
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
		
		if left ⧗ right {
			// Important note: this requires exact unit matching
			// so ~ is not a sufficient condition.
			
			var newLeft = left
			var newRight = right
			
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
	
	public static func ^ (left: Physical, right: Physical) -> Physical {
		if right.isDimensionless && right.values == nil {
			// TODO: this *always* forces the Physical ^ Double path, which robs us of clean exponents, no?
			return left ^ right.value
		}
		
		return notAThing(logging: "\(left) ^ \(right)", elements: [left, right])
	}
	
	public static func - (left: Physical, right: Physical) -> Physical {
		left + (-1 * right)
	}
	
	public static func += (left: inout Physical, right: Physical) {
		left = left + right
	}
	
	public static func -= (left: inout Physical, right: Physical) {
		left = left - right
	}
	
	public static func *= (left: inout Physical, right: Physical) {
		left = left * right
	}
	
	// combining with Numbers:
	
	public static func + (left: Double, right: Physical) -> Physical {
		left.constant + right
	}
	
	public static func + (left: Physical, right: Double) -> Physical {
		left + right.constant
	}
	
	public static func - (left: Double, right: Physical) -> Physical {
		left.constant - right
	}
	
	public static func - (left: Physical, right: Double) -> Physical {
		left - right.constant
	}
	
	public static func * (left: Double, right: Physical) -> Physical {
		if let rightValues = right.values {
			return Physical(values: left * rightValues, units: right.units, sigfigs: right.sigfigs)
		}
		else {
			if left.isNaN || right.value.isNaN {
				return notAThing
			}
			
			// TODO: we need a better init taking care of uncertainties etc
			
			var out = Physical(value: left * right.value, units: right.units, sigfigs: right.sigfigs)
			out.standardDeviationRaw = right.standardDeviationRaw
			
			return out
		}
	}
	
	public static func * (left: Physical, right: Double) -> Physical {
		right * left
	}
	
	public static func * (left: Int, right: Physical) -> Physical {
		Double(left) * right
	}
	
	public static func * (left: Physical, right: Int) -> Physical {
		left * Double(right)
	}
	
	public static func * (left: [Double], right: Physical) -> Physical? {
		if right.values == nil {
			return Physical(values: left * right.value, units: right.units, sigfigs: right.sigfigs)
		}
		
		return nil
	}
	
	public static func * (left: Physical, right: [Double]) -> Physical? {
		right * left
	}
	
	public static func / (left: Physical, right: Double) -> Physical {
		if right.isNaN || right.isZero {
			return notAThing
		}
		
		if let leftValues = left.values {
			return Physical(values: leftValues / right, units: left.units, sigfigs: left.sigfigs)
		}
		else {
			return Physical(value: left.value / right, units: left.units, sigfigs: left.sigfigs)
		}
	}
	
	public static func / (left: Physical, right: Int) -> Physical {
		left / Double(right)
	}
	
	public static func / (left: Int, right: Physical) -> Physical {
		Double(left) / right
	}
	
	public static func / (left: Double, right: Physical) -> Physical {
		left.constant / right
	}
	
	public static func ^ (left: Physical, right: Int) -> Physical {
		left ^ Double(right)
	}
	
	public static func ^ (lefty: Physical, right: Double) -> Physical {
		if right.isNaN {
			return notAThing
		}
		
		let left = lefty
		
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
			/*
			 Ideally we want to be able to say that 1 ft² ^ 0.5 = 1 ft
			 
			 BUT the Dimension system has no understanding that ft² is
			 in any way related to feet.
			 
			 The user can explicitly request the result in feet, and that works.
			 
			 And the system could solve this riddle but it would only
			 be able to land the user in fundamental units (i.e., in meters),
			 but the end user would not expect or desire this.
			 
			 A possible (but awful) work-around would be to create explicit
			 maps between all such items to their un-exponentiated relatives.
			 
			 One could limit this to only dimensions to their explicit relatives.
			 I.e., J² ↔︎ J, but not in terms of any other units.
			 
			 Generation script:
			 Maps: UnitArea → UnitLength, UnitVolume → UnitLength, etc
			 Find all Unit(.*).square(.*) → Unit(1-d-map).$1
			 UnitArea.cubicFeet → UnitLength.feet
			 
			 How many are there? JUST 3: area, volume and steradians
			 Going to only address area and volume for now.
			 
			 We could use the stubbed-out dictionary productDimensionLookup,
			 but we lose speed by trying to generalize when the special cases are so small.
			 
			 (We will only consider those with single-dimension composition,
			 the only possible case is UnitIonizingRadiation, but doesn't seem
			 to make good sense to consider this as a composite of velocity.)
			 
			 Side note: For reasons I can't divine, steradians fail to work.
			 */
			
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
	
	public static func *= (left: inout Physical, right: Double) {
		left = left * right
	}
	
}
