import Foundation
import Accelerate

extension Array where Element == Double {
	static func * (left: Array, right: Double) -> Array {
		var out = left
		cblas_dscal(Int32(out.count), right, &out, 1)
		
		return out
	}
	
	static func * (left: Double, right: Array) -> Array {
		var out = right
		cblas_dscal(Int32(out.count), left, &out, 1)
		
		return out
	}
	
	static func / (left: Array, right: Double) -> Array {
		var out = left
		cblas_dscal(Int32(out.count), 1 / right, &out, 1)
		
		return out
	}
	
	static func + (left: Array, right: Array) -> Array? {
		guard left.count == right.count else { return nil }
		
		var out = right
		cblas_daxpy(Int32(out.count), 1, left, 1, &out, 1)
		
		return out
	}
	
	static func + (left: Array, right: Double) -> Array {
		var out = [Double](repeating: right, count: left.count)
		cblas_daxpy(Int32(out.count), 1, left, 1, &out, 1)
		
		return out
	}
	
	static func + (left: Double, right: Array) -> Array {
		var out = [Double](repeating: left, count: right.count)
		cblas_daxpy(Int32(out.count), 1, right, 1, &out, 1)
		
		return out
	}
	
}

public extension Array where Element == Double {
	var sigfigs: Int {
		self.map { $0.sigfigs }.max()!
	}
}

public extension Physical {
	func mapp(_ transform: (Physical.ValuesType.Element) throws -> Physical) rethrows -> Physical {
		do {
			let values = try map { t in try transform(t).value }
			let value₀ = try transform(self[0])
			let units = value₀.units
			return Physical(values: values, units: units, sigfigs: value₀.sigfigs)
		}
		catch {
			// TODO: add a custom error type for this failure:
			
			throw(error)
		}
	}
}

public extension Array where Element == Double {
	var constant: Physical {
		Physical(values: self, units: [:], sigfigs: 0)
	}
	var feet: Physical {
		Physical(values: self, unit: UnitLength.feet)
	}
	var s: Physical {
		Physical(values: self, unit: UnitDuration.seconds)
	}
	var m: Physical {
		Physical(values: self, unit: UnitLength.meters)
	}
	var mps: Physical {
		Physical(values: self, unit: UnitSpeed.metersPerSecond)
	}
	var metersPerSecondSquared: Physical {
		Physical(values: self, unit: UnitAcceleration.metersPerSecondSquared)
	}
	
	//________________________________________________________/ the old way:
	
	var eV: [Physical] {
		map { Physical(value: $0, unit: UnitEnergy.electronvolts) }
	}
	var miles: [Physical] {
		map { Physical(value: $0, unit: UnitLength.miles) }
	}
	
	//	var m³: [Physical] {
	//		map { Physical(value: $0, unit: UnitVolume.cubicMeters) }
	//	}
	var squareMeters: [Physical] {
		map { Physical(value: $0, unit: UnitArea.squareMeters) }
	}
	
	var Ga: [Physical] {
		map { Physical(value: $0, unit: UnitDuration.gigaannum) }
	}
	var kg: Physical {
		Physical(values: self, unit: UnitMass.kilograms)
	}
}

