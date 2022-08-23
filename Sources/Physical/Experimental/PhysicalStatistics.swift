import Accelerate

prefix operator ∑

extension Physical {
	
	public var mean: Physical {
		if let values = values {
			var meanValue: Double = 0
			vDSP_meanvD(values, 1, &meanValue, vDSP_Length(values.count))
			
			return Physical(value: meanValue, units: units, sigfigs: sigfigs)
		}
		
		return self
	}
	
//	public var x_____: Physical {
//		// purely for testing
//	}
	
	public func differentials() -> Physical {
		guard let vals = values else { return .notAThing }
		
		let a = vals.dropLast()
		let b = vals.dropFirst()
		
		return Physical(values: vDSP.subtract(b, a), units: self.units, sigfigs: self.sigfigs)
	}
	
}

/*
prefix operator ∫

//public enum

public struct Integrable {
	var thing: Physical
	var unit: PhysicalUnit
}

public struct OpenPhysicalIntegral {
	var integrable: Integrable
}

public prefix func ∫(_ inty: Integrable) -> OpenPhysicalIntegral {
	OpenPhysicalIntegral(integrable: inty)
}

extension Physical {
//	public func d(_ unit: PhysicalUnit) -> Integrable {
//		Integrable(thing: self, unit: unit)
//	}
}


*/
