import Foundation

extension Physical {
	public init(value: Double, units: DimensionDictionary, sigfigs: Int = 0) {
		objectLog("b")
		// vars: [Variable<Value>] = [],
		self.value = value
		self.units = units
		self.sigfigs = sigfigs
		//		self.vars = vars
	}
	
	// add public init(value: Value, unit: (Dimension, Int), ... ?
	
	public init(value: Double, units: [(Dimension, Int)], sigfigs: Int) {
		objectLog("c")
		// vars: [Variable<Value>] = [],
		self.value = value
		self.sigfigs = sigfigs
		//		self.vars = vars
		
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
		objectLog("d")
		// vars: [Variable<Value>] = [],
		self.values = values
		self.units = units
		self.sigfigs = sigfigs
		// self.vars = vars
	}
	
	// add public init(value: Value, unit: (Dimension, Int), ... ?
	
	public init(values: [Double], units: [(Dimension, Int)], sigfigs: Int) {
		objectLog("e")
		// vars: [Variable<Value>] = [],
		self.values = values
		self.sigfigs = sigfigs
		// self.vars = vars
		
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
	
	//	public init(repeating: Double = 0, count: Int, units: Length) {
	//		self.init(values: [Double](repeating: repeating, count: count), units: units.p.units, sigfigs: 16)
	//	}
	
}
