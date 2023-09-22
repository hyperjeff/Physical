import Accelerate

extension Physical {
	
	public func differentials() -> Physical {
		guard let vals = values else { return .notAThing }
		
		let a = vals.dropLast()
		let b = vals.dropFirst()
		
		return Physical(values: vDSP.subtract(b, a), units: self.units, sigfigs: self.sigfigs)
	}
	
}
