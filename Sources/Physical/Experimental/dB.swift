import Foundation
import Accelerate

public extension Physical {
	var hasDBValue: Bool {
		switch kindOfQuantity {
			case .decibel(reference: _, symbol: _)?: true
			case .standardDecibel(reference: _)?: true
			default: false
		}
	}
	
	var dereferencedValue: Physical {
		if hasDBValue {
			if let dbRaw = preDBSelf as? Physical {
				return dbRaw
			}
			else {
				return pow(10, value / dBReference.dbScaling) * dBReference
			}
		}
		else {
			return self
		}
	}
	
	var dbScaling: Double {
		// root-power quantities:
		(
			self ~ 1.V ||
			self ~ 1.amperes ||
			self ~ 1.pascals ||
			self ~ 1.metersPerSecond ||
			self ~ 1.coulombs.perCubicMeter
		) ? 20 : 10
	}
	
	func dB(reference: Physical, symbol: String = "") -> Physical {
		guard self ~ reference else { return .notAThing }
		
		var out: Physical
		
		if let values {
			let newValues = (self ~ Power.self) ?
				vDSP.powerToDecibels(values, zeroReference: reference.value) :
				vDSP.amplitudeToDecibels(values, zeroReference: reference.value)
			
			out = Physical(values: newValues, units: units, sigfigs: sigfigs)
		}
		else {
			out = reference.dbScaling * log10(self / reference)
		}
		
		out.preDBSelf = self as AnyObject
		out.kindOfQuantity = .decibel(reference: reference, symbol: symbol)
		
		return out
	}
	
	func dB(reference: DBReference) -> Physical {
		let refValue = reference.value
		guard self ~ refValue else { return .notAThing }
		
		var out: Physical
		
		if let values {
			let newValues = (self ~ Power.self) ?
				vDSP.powerToDecibels(values, zeroReference: refValue.value) :
				vDSP.amplitudeToDecibels(values, zeroReference: refValue.value)
			
			out = Physical(values: newValues, units: units, sigfigs: sigfigs)
		}
		else {
			if 0 < (self / refValue).value {
				out = reference.dbScaling * log10(self / refValue)
			}
			else {
				out = -reference.dbScaling * log10(-self / refValue)
			}
		}
		
		out.kindOfQuantity = .standardDecibel(reference: reference)
		
		return out
	}
	
	var ratio: Double? {
		if case let KindOfQuantity.decibel(reference: ref, symbol: _)? = self.kindOfQuantity {
			pow(10, value / ref.dbScaling)
		}
		else if case let KindOfQuantity.standardDecibel(reference: ref)? = self.kindOfQuantity {
			pow(10, value / ref.value.dbScaling)
		}
		else { nil }
	}
	
	var dBReference: Physical {
		return if case let KindOfQuantity.decibel(reference: ref, symbol: _)? = self.kindOfQuantity {
			ref
		}
		else if case let KindOfQuantity.standardDecibel(reference: ref)? = self.kindOfQuantity {
			ref.value
		}
		else {
			.notAThing
		}
	}
}

// These ↓ values are for references that are not functions
public enum DBReference: String, CaseIterable {
	// Acoustics
	case dBSPL = " SPL"
	case dBSIL = " SIL"
	case dBSWL = " SWL"
	
	// Voltage
	case dBV = "V"
	case dBu = "u"
	case dBuV = "uV"
	case dBμV = "μV"
	case dBm = "m"
	
	// Radio power, energy, field strength
	case dBJ = "J"
	case dBμ = "μ"
	case dBf = "f"
	case dBW = "W"
	case dBk = "k"
	
	// Others
	case dBK = "K"
	
	public var value: Physical {
		return switch self {
			case .dBJ   : 1.joules						//	1
				
			case .dBk   : 1.kilowatts					// 	1
			case .dBW   : 1.watts						// 	1
			case .dBm   : 1.milliwatts					// 	1
			case .dBSIL : 1.picowatts.perSquareMeter	//	1
			case .dBSWL : 1.picowatts					// 	1
			case .dBf   : 1.femtowatts					// 	1
				
			case .dBSPL : 2e-5.pascals					// 		2
			case .dBV   : 1.volts						// 		2
			case .dBu   : 0.775.volts                   //      2
			case .dBuV  : 1.microvolts					// 		2
			case .dBμV  : 1.microvolts					// 		2
			case .dBμ   : 1.microvolts.perMeter			//		2
				
			case .dBK   : 1.kelvin						//	1
		}
	}
	
	public var dbScaling: Double {
		return switch self {
			case .dBSPL : 20
			case .dBSIL : 10
			case .dBSWL : 10
			case .dBV   : 20
			case .dBu   : 20
			case .dBuV  : 20
			case .dBμV  : 20
			case .dBm   : 10
			case .dBJ   : 10
			case .dBμ   : 20
			case .dBf   : 10
			case .dBW   : 10
			case .dBk   : 10
			case .dBK   : 10
		}
	}
	
}

public extension Physical {
	var dBSPL: Physical { dB(reference: .dBSPL) }
	var dBSIL: Physical { dB(reference: .dBSIL) }
	var dBSWL: Physical { dB(reference: .dBSWL) }
	var dBm: Physical { dB(reference: .dBm) }
	var dBV: Physical { dB(reference: .dBV) }
	var dBu: Physical { dB(reference: .dBu) }
	var dBuV: Physical { dB(reference: .dBuV) }
	var dBμV: Physical { dB(reference: .dBμV) }
	var dBJ: Physical { dB(reference: .dBJ) }
	var dBμ: Physical { dB(reference: .dBμ) }
	var dBf: Physical { dB(reference: .dBf) }
	var dBW: Physical { dB(reference: .dBW) }
	var dBk: Physical { dB(reference: .dBk) }
	var dBK: Physical { dB(reference: .dBK) }
	
	static func → (left: Physical, right: DBReference) -> Physical {
		return if left.hasDBValue {
			left.dereferencedValue.dB(reference: right)
		}
		else {
			left.dB(reference: right)
		}
	}
	
	var commonDBReference: DBReference? {
		DBReference.allCases.first(where: { $0.value == dBReference })
	}
	
	var dB: Physical? {
		if case let KindOfQuantity.ratio(denominator: denom)? = self.kindOfQuantity {
			return (denom * self).dB(reference: denom)
		}
		
		return .notAThing(logging: "\(self) is not a ratio that can be made into a dB measure")
	}

}

public func → (left: Physical?, right: DBReference) -> Physical {
	return if let left {
		left → right
	}
	else {
		.notAThing(logging: "dB wasn't a thing, so couldn't be cast")
	}
}

public extension BinaryFloatingPoint {
	
	// dB construction here has no rawValue cached from which it came
	
	func dB(reference: Physical, symbol: String = "") -> Physical {
		var base = Double(self).constant
		base.kindOfQuantity = .decibel(reference: reference, symbol: symbol)
		return base
//		return (10 ^ (Double(self) / reference.dbScaling)) * base
	}
	
	private func dbConstructor(with reference: DBReference) -> Physical {
		var out = self.constant
		out.kindOfQuantity = .standardDecibel(reference: reference)
		
		return out
	}
	
	var dBSPL: Physical { dbConstructor(with: .dBSPL) }
	var dBSIL: Physical { dbConstructor(with: .dBSIL) }
	var dBSWL: Physical { dbConstructor(with: .dBSWL) }
	var dBm: Physical { dbConstructor(with: .dBm) }
	var dBV: Physical { dbConstructor(with: .dBV) }
	var dBu: Physical { dbConstructor(with: .dBu) }
	var dBuV: Physical { dbConstructor(with: .dBuV) }
	var dBμV: Physical { dbConstructor(with: .dBμV) }
	var dBJ: Physical { dbConstructor(with: .dBJ) }
	var dBμ: Physical { dbConstructor(with: .dBμ) }
	var dBf: Physical { dbConstructor(with: .dBf) }
	var dBW: Physical { dbConstructor(with: .dBW) }
	var dBk: Physical { dbConstructor(with: .dBk) }
	var dBK: Physical { dbConstructor(with: .dBK) }
}

public extension Array where Element == Double {
	
	func dB(reference: Physical, symbol: String = "") -> Physical {
		var base = 0.constant
		base.kindOfQuantity = .decibel(reference: reference, symbol: symbol)
		
		return base * (10 ^ (self / reference.dbScaling).constant)
	}
	
	private func dbArrayConstructor(with reference: DBReference) -> Physical {
		var out = self.constant
		out.kindOfQuantity = .standardDecibel(reference: reference)
		
		return out
	}
	
	var dBSPL: Physical { dbArrayConstructor(with: .dBSPL) }
	var dBSIL: Physical { dbArrayConstructor(with: .dBSIL) }
	var dBSWL: Physical { dbArrayConstructor(with: .dBSWL) }
	var dBm: Physical { dbArrayConstructor(with: .dBm) }
	var dBV: Physical { dbArrayConstructor(with: .dBV) }
	var dBuV: Physical { dbArrayConstructor(with: .dBuV) }
	var dBμV: Physical { dbArrayConstructor(with: .dBμV) }
	var dBJ: Physical { dbArrayConstructor(with: .dBJ) }
	var dBμ: Physical { dbArrayConstructor(with: .dBμ) }
	var dBf: Physical { dbArrayConstructor(with: .dBf) }
	var dBW: Physical { dbArrayConstructor(with: .dBW) }
	var dBk: Physical { dbArrayConstructor(with: .dBk) }
	var dBK: Physical { dbArrayConstructor(with: .dBK) }
}
