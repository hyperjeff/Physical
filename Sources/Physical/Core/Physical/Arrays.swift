import Foundation
import Accelerate

public extension Physical {
	var isArray: Bool {
		values != nil
	}
	
	var startIndex: Index { values!.startIndex }
	var endIndex: Index { values!.endIndex }
	
	subscript(position: ValuesType.Index) -> Physical {
		get { Physical(value: values![position], units: units, sigfigs: sigfigs) }
		set {
			// policy decision: silently fail? throw?
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
	
	func index(after i: ValuesType.Index) -> ValuesType.Index {
		values!.index(after: i)
	}
	
	var standardDeviation: Physical {
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
	
	func sigfigs(_ siggy: Int) -> Physical {
		if let vals = values {
			return Physical(values: vals, units: units, sigfigs: siggy)
		}
		else {
			return Physical(value: value, units: units, sigfigs: siggy)
		}
	}
	
	var maximumError: Physical {
		Physical(value: abs(value) * 5 * pow(10, -Double(sigfigs)), units: units, sigfigs: 16) // what would sigfigs be here?
	}
	
}

public extension Array where Element == Physical {
	func average() -> Physical {
		if let itemZero = first {
			let test = self[1...].reduce(true) { a, b in a && (b ~ itemZero) }
			if !test { return .notAThing }
			
			if itemZero ~ Temperature.self {
				return map { $0 → .kelvin }.reduce(0.kelvin, +) / count
			}
			
			return reduce(0 * itemZero, +) / count
		}
		
		return .notAThing
	}
}
