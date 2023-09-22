import Foundation
import Accelerate

extension Physical {
	public var startIndex: Index { values!.startIndex }
	public var endIndex: Index { values!.endIndex }
	
	public subscript(position: ValuesType.Index) -> Physical {
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
	
	public func index(after i: ValuesType.Index) -> ValuesType.Index {
		values!.index(after: i)
	}
	
	public var standardDeviation: Physical {
		get {
			if let values = values {
				var mean: Double = 0
				var stdDev: Double = 0
				vDSP_normalizeD(values, 1, nil, 1, &mean, &stdDev, vDSP_Length(values.count))
				
				
				
				return Physical(value: stdDev, units: units, sigfigs: sigfigs)
			}
			else {
				//				if 0 < standardDeviationRaw {
				//					Physical(value: standardDeviationRaw, units: units, sigfigs: 16)
				//				}
				//				else {
				//					return Physical(value: value * pow(10, Double(-sigfigs)), units: units, sigfigs: sigfigs)
				//				}
				
				return Physical(value: standardDeviationRaw, units: units, sigfigs: 16)
			}
		}
		set {
			standardDeviationRaw = newValue.value
		}
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
	
}
