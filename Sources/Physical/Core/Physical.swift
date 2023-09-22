import Foundation
import Accelerate

infix operator *** // quantity multiplication
infix operator ≐   // values equal within the limits of their given significant figures
infix operator ~   //     of the same fundamental order of units
infix operator !~  // not of the same fundamental order of units
infix operator ⨃   // have any fundamental base units in common
infix operator ⩀   // have base units in common on same side of units ratio
infix operator ⧦   // uses a non-zero-offset system of units
infix operator ⧗   // matching non-zero-offset units
infix operator ⧖   // exactly matching units
postfix operator /

/* Hierarchy from Apple's framework:

	Unit -- symbol
	  ↑
	Dimension
	  ↑
	Unit* -- { specific units }
	
	ex: UnitArea -- { squareInches, hectares, acres, ... }
*/

/*
	Possible improvements:

	• Are we constantly creating decomposed / elementalized versions of each object? Cache this info? Generate at init time?
	• Cache the above for not just _this_ object, but for all objects created with a given unit set? (Singleton cache)
*/

public typealias CoreValueType = Double // ← just an idea

public struct Physical: Equatable, Comparable, Hashable, Collection, CustomStringConvertible, CustomDebugStringConvertible {
	public typealias ValuesType = [Physical]
	public typealias Index = ValuesType.Index
	public typealias Element = ValuesType.Element
	
	public var startIndex: Index { values!.startIndex }
	public var endIndex: Index { values!.endIndex }
	
	public subscript(position: ValuesType.Index) -> Physical {
		get { Physical(value: values![position], units: units, sigfigs: sigfigs) }
		set {
			if newValue ~ self {
				if newValue ⧖ self {
					values![position] = newValue.value
				}
				else {
					values![position] = (newValue.value * Physical(value: 1, units: newValue.units) / Physical(value: 1, units: units)).value
				}
			}
		}
	}

	public func index(after i: ValuesType.Index) -> ValuesType.Index {
		values!.index(after: i)
	}
	
	public var value: Double = 0
	public var values: [Double]?
	public var sigfigs: Int = 16
	public var invertSuffixes = false
	public var units: DimensionDictionary = [:]
	public var isNotAThing = false
	
	//______________________________/ EXPERIMENTAL:
	
	public var range: (low: Double, high: Double)?
	public var uncertainty: Double?
	public var metadata = Metadata()
	public var kindOfQuantity: KindOfQuantity?
	public var errorStack: [String] = []
	
	private var standardDeviationRaw: Double = 0
	
	public var standardDeviation: Physical {
		get {
			if let values = values {
				var mean: Double = 0
				var stdDev: Double = 0
				vDSP_normalizeD(values, 1, nil, 1, &mean, &stdDev, vDSP_Length(values.count))
				
				return Physical(value: stdDev, units: units, sigfigs: sigfigs)
			}
			else {
				return Physical(value: standardDeviationRaw, units: units, sigfigs: 16)
			}
		}
		set {
			standardDeviationRaw = newValue.value
		}
	}
	
	public var significantValue: Double {
		value.toSigfigs(sigfigs)
	}
	
	public var isAThing: Bool { !isNotAThing }
	
	public var isUnitless: Bool {
		units.isEmpty
	}
	
	public var isDimensionless: Bool {
		units
			.filter { $0.value.unit !~ 1°.units.first!.value.unit }
			.filter { $0.value.unit !~ 1.steradians.units.first!.value.unit }
			.isEmpty
	}
	
	private let formatter = NumberFormatter()
	
	public var description: String {
		if isNotAThing {
			return "Not a Thing"
		}
		
		formatter.maximumSignificantDigits = Physical.Globals.shared.sigfigs ?? sigfigs
		formatter.numberStyle = .scientific
		formatter.locale = Locale.current
		formatter.exponentSymbol = "e"
		
		func numberString(_ x: Double) -> String {
			var numericalPart = formatter.string(from: NSNumber(value: x))!
			
	//		let variablePart = vars.map { $0.description }.joined(separator: " ")
			
			// Refactor top + bottom code!
			
			if let expString = numericalPart.components(separatedBy: "e").last,
				let e = formatter.number(from: expString)?.intValue {
				if -4 < e && e < 6 {
					formatter.numberStyle = .decimal
					numericalPart = formatter.string(from: NSNumber(value: x))!
				}
			}
			
			return numericalPart.trimmingCharacters(in: .whitespaces)
		}
		
		var unitPart = ""
		var firstTerm = true
		let sortedUnits = units.sorted(by: { a, b in a.key.symbol < b.key.symbol })
		let numeratorUnits = sortedUnits.filter { (_, v) in v.1.isPositive }
		
		for (_, (unit, exponent)) in numeratorUnits {
			if !firstTerm {
				unitPart += " "
			}
			else {
				firstTerm = false
			}
			
			let symbol = unit.symbol.contains("/") ? "(\(unit.symbol))" : "\(unit.symbol)"
			
			switch exponent {
				case let .integer(e):
					switch e {
						case 0: break
						case 1: unitPart += "\(unit.symbol)"
						default: unitPart += symbol + e.drawnExponent
					}
				case .fraction(_, _):
					unitPart += symbol + "^(\(exponent))"
				case .real(_):
					let expString = "\(exponent)"
					if expString != "1" {
						unitPart += symbol + "^\(exponent)"
					}
					else {
						unitPart += symbol
					}
			}
		}
		
		var alreadyDrawnDivisor = false
		firstTerm = true
		
		for (_, (unit, exponent)) in sortedUnits where !exponent.isPositive {
			if unit.isKind(of: UnitAngle.self) {
				continue
			}
			
			if !alreadyDrawnDivisor {
				unitPart += " / "
				alreadyDrawnDivisor = true
			}
			
			if !firstTerm {
				unitPart += " "
			}
			else {
				firstTerm = false
			}
			
			let symbol = unit.symbol.contains("/") ? "(\(unit.symbol))" : "\(unit.symbol)"
			
			switch exponent {
				case let .integer(e):
					switch e {
						case -1: unitPart += "\(unit.symbol)"
						default: unitPart += symbol + abs(e).drawnExponent
					}
				case .fraction(_, _):
					unitPart += symbol + "^(\(exponent))"
				case .real(_):
					let expString = "\(exponent)"
					if expString != "1" {
						unitPart += symbol + "^\(expString)"
					}
					else {
						unitPart += symbol
					}
			}
		}
		
		if let values = values {
			let numbersString = "[\(values.map({ numberString($0) }).joined(separator: ", "))]"
			return "\(numbersString) \(unitPart)".trimmingCharacters(in: .whitespaces)
		}
		else {
			return "\(numberString(value)) \(unitPart)".trimmingCharacters(in: .whitespaces)
		}
	}
	
	public var debugDescription: String { description }
	
	public var dimensionalDescription: String {
		var out: [String] = []
		
		let basicUnits = withBasicUnits.units
		
		for δ in fundamentalSIDimensions {
			let λ = basicUnits.keys.filter({ $0.isKind(of: δ.self) })
			
			if λ.count == 1,
			   let φ = λ.first,
			   let ε = basicUnits[φ]?.exponent,
			   case let .integer(e) = ε  {
				out.append("\(φ.dimensionSymbol)\(e.drawnExponentGeneral)")
			}
		}
		
		return out.joined(separator: " ")
	}
	
	public var errorStackDescription: String {
		var out: [String] = []
		
		for (line, error) in errorStack.enumerated() {
			out.append("\(line + 1): \(error)")
		}
		
		return out.joined(separator: "\n")
	}
	
	// TODO: fix this terrible hack:
	
	public var unitDescription: String {
		description.components(separatedBy: "]").last!.trimmingCharacters(in: .whitespaces)
	}

	
	// Init methods:
	
	public init() {
		// stub
	}
	
	public init(value: Double, units: DimensionDictionary, sigfigs: Int = 0) {
		self.value = value
		self.units = units
		self.sigfigs = sigfigs
	}
	
	public init(value: Double, units: [(Dimension, Int)], sigfigs: Int) {
		self.value = value
		self.sigfigs = sigfigs
		
		var newUnits: DimensionDictionary = [:]
		
		units.forEach { (unit, exponent) in
			if let baseUnit = unit.baseUnitCheck() {
				newUnits[baseUnit] = (unit, .integer(exponent))
			}
			else if let baseUnit = unit.superclass?.baseUnit() as? Dimension {
				newUnits[baseUnit] = (unit, .integer(exponent))
			}
		}
		
		self.units = newUnits
	}
	
	public init(value: Double, unit: Dimension, sigfigs: Int) {
		self.init(value: value, units: [type(of: unit).baseUnit() : (unit, .integer(1))], sigfigs: sigfigs)
	}
	
	public init(value: Double, unit: Dimension) {
		self.init(value: value, unit: unit, sigfigs: value.sigfigs)
	}
	
	public init(values: [Double], units: DimensionDictionary, sigfigs: Int) {
		self.values = values
		self.units = units
		self.sigfigs = sigfigs
	}
	
	public init(values: [Double], units: [(Dimension, Int)], sigfigs: Int) {
		self.values = values
		self.sigfigs = sigfigs
		
		var newUnits: DimensionDictionary = [:]
		
		units.forEach { (unit, exponent) in
			if let baseUnit = unit.superclass?.baseUnit() as? Dimension {
				newUnits[baseUnit] = (unit, .integer(exponent))
			}
		}
		
		self.units = newUnits
	}
	
	public init(values: [Double], unit: Dimension, sigfigs: Int) {
		self.init(values: values, units: [type(of: unit).baseUnit() : (unit, .integer(1))], sigfigs: sigfigs)
	}
	
	public init(values: [Double], unit: Dimension) {
		self.init(values: values, unit: unit, sigfigs: values.sigfigs)
	}
	
	public init(repeating: Double = 0, count: Int, unit: Dimension) {
		self.init(values: [Double](repeating: repeating, count: count), unit: unit)
	}
	
	public static var notAThing: Physical {
		var nothing = Physical()
		nothing.value = .nan
		nothing.sigfigs = 0
		nothing.isNotAThing = true
		
		return nothing
	}
	
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
	
	public func sigfigs(_ siggy: Int) -> Physical {
		if let vals = values {
			return Physical(values: vals, units: units, sigfigs: siggy)
		}
		else {
			return Physical(value: value, units: units, sigfigs: siggy)
		}
	}
	
	public var maximumError: Physical {
		Physical(value: abs(value) * 5 * pow(10, -Double(sigfigs)), units: units, sigfigs: 16) // what would sigfigs be here?
	}
	
	/*
		[base : [unit:exp]]   Has the feature that the various base units may dimensionally overlap.
							  From here we may want to perhaps various transformations.
	    
	    a) Composite base dimensions → Simple base dimensions   ex:     [m/s] → [m] [s]^-1    ←      decompose units
	    b) Transform non-base units → Base units                ex: miles lbs → m kg          ← fundamentalize units
	    
	    Do we always want (a)?
	
		[base : [unit:exp]]      ex: ft lbs mph / acre			← should NOT be possible, since * will force unit unmixing
			  ↓
		[base : [base:exp]]      ex: N m / A min                ← this possible? NO!
			  ↓
		[fund : [fund:exp]]      ex: kg m^2 / A s^2             ← ✔︎ tres bien
			  ↓
		[base : [base:exp]]      ex: J / kg                     ← allowable? units are overlapping. NO!
			  ↓
		[base : [unit:exp]]      ex: erg / lb                   ← ✔︎ yes, that's fine
	
	
	scenarios:
	
		mph * hours   → miles *   hours / hours                             → miles        --- is this automatable ?
	
		mph * seconds → miles * seconds / hours → miles * seconds / seconds → miles
	
		N * miles → kg m^2 / s^2
	
	*/
	
	/// Reduces compound dimensions to a collection of base dimensions
	/// without switching to fundamental units unless necessary.
	
	public mutating func decomposeMixedUnits() {
		if !(units.containsCompositeDimensions() ||
			(1 < units.count && units.containsNonZeroOffsetUnits())) {
			return
		}
		
		let multiplyUsedVector = units
			.compactMap { fundamentalBaseVector[$0.key] }
			.map { $0.nonZeroElements() }
			.reduce(FundamentalBaseVector()) { a, b in a ∔ b }
		
		var newValue = value
		var newUnits: DimensionDictionary = [:]
		
		for (base, (unit, exponent)) in units {
			
			func set(baseUnit: Dimension, toExponent: TieredNumber) {
				if toExponent == .integer(0) { return }
				
				if let (_, exponentSoFar) = newUnits[baseUnit] {
					let newExponent = (exponent * toExponent) + exponentSoFar
					
					if newExponent.isZero {
						newUnits.removeValue(forKey: baseUnit)
					}
					else {
						newUnits[baseUnit] = (baseUnit, newExponent)
					}
				}
				else {
					newUnits[baseUnit] = (baseUnit, exponent * toExponent)
				}
			}
			
			if let baseVector = fundamentalBaseVector[base],
			   (base.isCompositeDimension() ||
				baseVector.projectsInto(multiplyUsedBaseVector: multiplyUsedVector)) {
				
				set(baseUnit: UnitLength.baseUnit(),            toExponent: .integer(baseVector.m))
				set(baseUnit: UnitDuration.baseUnit(),          toExponent: .integer(baseVector.s))
				set(baseUnit: UnitMass.baseUnit(),              toExponent: .integer(baseVector.kg))
				set(baseUnit: UnitElectricCurrent.baseUnit(),   toExponent: .integer(baseVector.A))
				set(baseUnit: UnitAmount.baseUnit(),            toExponent: .integer(baseVector.mol))
				set(baseUnit: UnitTemperature.baseUnit(),       toExponent: .integer(baseVector.K))
				set(baseUnit: UnitLuminousIntensity.baseUnit(), toExponent: .integer(baseVector.cdl))
				set(baseUnit: UnitAngle.baseUnit(),             toExponent: .integer(baseVector.rad))
				set(baseUnit: UnitSolidAngle.baseUnit(),        toExponent: .integer(baseVector.st))
				
				switch base {
					case UnitVolume.baseUnit():
						newValue *= pow(Measurement(value: 1, unit: unit).converted(to: UnitVolume.cubicMeters).value, exponent: exponent)
						
					default:
						if base != unit {
							newValue *= pow(Measurement(value: 1, unit: unit).converted(to: base).value, exponent: exponent)
						}
				}
			}
			else {
				newUnits[base] = (unit, exponent)
			}
		}
		
		units = newUnits
		value = newValue
	}
	
	/// Converts units to fundamental dimensions and their base units
	/// - Parameter unitsToConvert: Specific unit dimensions to convert. If none are specified, then all are converted.
	
	public mutating func convertToFundamentalUnits(unitsToConvert: [Dimension] = []) {
		var newValue = value
		var newValues = values
		var newUnits: DimensionDictionary = [:]
		
		let hasNonZeroOffsets = units.containsNonZeroOffsetUnits()
		
		if hasNonZeroOffsets {
			if units.count != 1 {
				errorStack.append("Convert to fundamental units using non-zero offset with multiple units for \(self)")
				self = .notAThing
				
				return
			}
		}
		
		for (base, (var unit, exponent)) in units {
			
			if base == unit {
				newUnits[base] = (base, exponent)
			}
			else {
				if hasNonZeroOffsets {
					// FIXME: add array version
					
					newValue = Measurement(value: value, unit: unit).converted(to: base).value
				}
				else {
					var unitValue: Double = 1
					
					if unit == UnitLength.feet {
						unit = UnitLength.inches
						unitValue = 12
					}
					
					let scaling = pow(Measurement(value: unitValue, unit: unit).converted(to: base).value, Double(exponent.realValue))
					
					if let values = values {
						var result = [Double](repeating: 0, count: values.count)
						cblas_daxpy(Int32(values.count), scaling, values, 1, &result, 1)
						
						newValues = result
					}
					
					newValue *= scaling
				}
				
				if newUnits.keys.contains(base),
				   let currentUnit = newUnits[base] {
					newUnits[base] = (base, currentUnit.exponent + exponent)
				}
				else {
					newUnits[base] = (base, exponent)
				}
			}
		}
		
		if !newUnits.isEmpty {
			units = newUnits
			value = newValue
			values = newValues
		}
	}
	
	public var withBasicUnits: Physical {
		var mutatedSelf = self
		mutatedSelf.decomposeMixedUnits()
		return mutatedSelf
	}
	
	public var withFundamentalUnits: Physical {
		var mutatedSelf = self
		mutatedSelf.decomposeMixedUnits()
		mutatedSelf.convertToFundamentalUnits()
		
		return mutatedSelf
	}
	
	public var baseUnits: Set<Dimension> {
		units.baseUnits()
	}
	
	public func to<T: Dimension>(_ dimension: T) -> Physical {
		if units.keys.count == 1,
		   let (base, unit) = units.first,
		   base ~ dimension,
		   unit.exponent == .integer(1) {
			
			if let values = values {
				if let converter = dimension.converter as? UnitConverterLinear {
					// FIXME: fix for non-zero-offset converters
					
					var out = [Double](repeating: 0, count: values.count)
					
					cblas_daxpy(Int32(values.count), 1 / converter.coefficient, values, 1, &out, 1)
					
					return Physical(values: out, unit: dimension, sigfigs: sigfigs)
				}
			}
			
			let v = Measurement(value: value, unit: unit.unit).converted(to: dimension)
			
			return Physical(value: v.value, unit: dimension, sigfigs: sigfigs)
		}
		
		return convertUp(to: Physical(value: 1, unit: dimension))
	}
	
	public func to(units otherUnits: DimensionDictionary) -> Physical? {
		let oneOfOtherUnits = Physical(value: 1, units: otherUnits)
		
		if self ~ oneOfOtherUnits {
			return self.convertUp(to: oneOfOtherUnits)
		}
		
		return nil
	}
	
	public func convertUp(to newPhysicalType: Physical) -> Physical {
		if self ~ newPhysicalType {
			return Physical(
				value: (self / newPhysicalType).value,
				units: newPhysicalType.units,
				sigfigs: sigfigs
			)
		}
		
		return Physical.notAThing(logging: "\(self) → \(newPhysicalType)")
	}
	
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
		if left.isNotAThing || right.isNotAThing {
			return notAThing(logging: "\(left) || \(right)", elements: [left, right])
		}
		
		// probably should be refactored:
		
		// We can multiply non-zero-offset units, but only if they are the same ones
		if !(left ⧦ right) && !(left ⧗ right) {
			return notAThing(logging: "!(left ⧦ right) && !(left ⧗ right) → !\(left ⧦ right) && !\(left ⧗ right)", elements: [left, right])
		}
		
		let result = left *** right
		
		// Only units which have a common set of units will be decomposed,
		// as long as they are not non-zero-offset units
		if !(left ⧖ right) && (left ⨃ right) && (left ⧦ right) {
			var (newLeft, newRight) = (left, right)
			
			newLeft.decomposeMixedUnits()
			newRight.decomposeMixedUnits()
			
			newLeft.convertToFundamentalUnits() // <- note, ⨃ does this calculation also!
			newRight.convertToFundamentalUnits()
			
			// Only use the fundamentalUnits result if it's clearly simpler than our input dimensions
			
			let fundamentalResult = newLeft *** newRight
			
			if (left ⩀ right) || (fundamentalResult.units.count < result.units.count) {
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
	fileprivate static func *** (left: Self, right: Self) -> Self {
		
		if let leftValues = left.values,
		   let rightValues = right.values,
		   leftValues.count != rightValues.count {
			return notAThing
		}
		
		if left.value.isNaN || right.value.isNaN {
			return notAThing
		}
		
		var scaleFactor: Double = 1
		var newUnits = left.units
		
		var usedRightDimensions: [Dimension] = []
		
		for (baseLeft, (unitLeft, expLeft)) in left.units {
			for (baseRight, (unitRight, expRight)) in right.units {
				
				if (baseLeft == baseRight) {
					
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
				// must check there are no commensurate units
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
		
		if let _ = left.values,
		   let _ = right.values {
			return notAThing
		}
		else if let leftValues = left.values {
			return Physical(
				values: leftValues * right.value,
				units: newUnits,
				sigfigs: Swift.min(left.sigfigs, right.sigfigs)
			)
		}
		else if let rightValues = right.values {
			return Physical(
				values: left.value * rightValues,
				units: newUnits,
				sigfigs: Swift.min(left.sigfigs, right.sigfigs)
			)
		}
		else {
			var out = Physical(
				value: newValue,
				units: newUnits,
				sigfigs: Swift.min(left.sigfigs, right.sigfigs)
			)
			
			let rx = right.value
			let lx = left.value
			let ru = right.standardDeviationRaw
			let lu = left.standardDeviationRaw
			
			out.standardDeviationRaw = √((ru * ru * lx * lx) + (lu * lu * rx * rx))
			
			return out
		}
	}
	
	public static func / (left: Physical, right: Physical) -> Self {
		if left.isNotAThing || right.isNotAThing { return notAThing(logging: "\(left) || \(right)", elements: [left, right]) }
		
		// FIXME: This is not correct if right doesn't transform via a simple rescaling
		//        right must be transformed first into the base unit which is purely scalar (has 0 crossing)
		//        This stuff about altRight is the temporary fix.
		//        Ideally we have a flag set to detect units which are not purely scalar somehow.
		//        Perhaps the Measurement API has a way to know this?
		
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
				if let leftValues = newLeft.values,
				   let rightValues = newRight.values,
				   let sum = leftValues + rightValues {
					return Physical(
						values: sum,
						units: newLeft.units,
						sigfigs: additionSigfigs(newLeft.value, newRight.value)
					)
				}
				else if let leftValues = newLeft.values {
					return Physical(
						values: leftValues + newRight.value,
						units: newLeft.units,
						sigfigs: additionSigfigs(newLeft.value, newRight.value)
					)
				}
				else if let rightValues = newRight.values {
					return Physical(
						values: newLeft.value + rightValues,
						units: newLeft.units,
						sigfigs: additionSigfigs(newLeft.value, newRight.value)
					)
				}
				else {
					var out = Physical(
						value: newLeft.value + newRight.value,
						units: newLeft.units,
						sigfigs: additionSigfigs(newLeft.value, newRight.value)
					)
					
					let ls² = (newLeft.standardDeviationRaw ^ 2)
					let rs² = (newRight.standardDeviationRaw ^ 2)
					
					out.standardDeviationRaw = (newRight.value < 0) ? // ← oh this feels bad
						√abs(ls² - rs²) :
						√abs(ls² + rs²)
					
					return out
				}
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
	
	public static func - (left: Physical, right: Physical) -> Physical {
		left + (-1 * right)
	}
	
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
	
	public static func ^ (left: Physical, right: Double) -> Physical {
		if right.isNaN {
			return notAThing
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
			newUnits[baseUnit] = (unit, power * exponent)
		}
		
		if var values = left.values {
			var powers = [Double](repeating: right, count: values.count)
			var newValues = [Double](repeating: 0, count: values.count)
			var count = Int32(left.count)
			
			vvpow(&newValues, &powers, &values, &count)
			
			return Physical(values: newValues, units: newUnits, sigfigs: left.sigfigs)
		}
		
		return Physical(
			value: pow(left.value, right),
			units: newUnits,
			sigfigs: left.sigfigs
		)
	}
	
	public static func ^ (left: Physical, right: Physical) -> Physical {
		if right.isDimensionless && right.values == nil {
			return left ^ right.value
		}
		
		return notAThing(logging: "\(left) ^ \(right)", elements: [left, right])
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
	
	public static func /= (left: inout Physical, right: Physical) {
		left = left / right
	}
	
	public static func *= (left: inout Physical, right: Double) {
		left = left * right
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

	public static postfix func / (left: Physical) -> Physical {
		var out = left
		out.invertSuffixes = true
		return out
	}
	
	var per: Physical {
		var out = self
		out.invertSuffixes = true
		return out
	}
	
	private static func notAThing(logging: String, elements: [Physical] = []) -> Physical {
		var out: Physical = .notAThing
		
		out.errorStack.append(logging)
		
		for element in elements {
			for error in element.errorStack {
				if !out.errorStack.contains(error) {
					out.errorStack.insert(error, at: 0)
				}
			}
		}
		
		return out
	}
}
