import Foundation
import Accelerate

postfix operator °
prefix operator √
prefix operator ∛
prefix operator ∜
prefix operator -
infix operator ∓
infix operator ±
infix operator → : CastingPrecedence


public typealias DoubleToDouble = (Double) -> (Double)
public typealias VVDoubles = (UnsafeMutablePointer<Double>, UnsafePointer<Double>, UnsafePointer<Int32>) -> Void

// additional custom operators
public func sqrt(_ p: Physical) -> Physical {
	p ^ (1.0/2)
}
public func pow(_ p: Physical, _ power: Double) -> Physical {
	p ^ power
}

public extension Physical {
	static func sqrt(right: Physical) -> Physical {
		right ^ (1.0/2)
	}
	static func cbrt(right: Physical) -> Physical {
		right ^ (1.0/3)
	}
	static prefix func √(right: Physical) -> Physical {
		right ^ (1.0/2)
	}
	static prefix func ∛(right: Physical) -> Physical {
		right ^ (1.0/3)
	}
	static prefix func ∜(right: Physical) -> Physical {
		right ^ (1.0/4)
	}
	static func √ (left: Int, right: Physical) -> Physical {
		right ^ (1 / Double(left))
	}
	
	static prefix func - (left: Physical) -> Physical {
		-1 * left
	}
	
//	static func ∓ (left: Physical, right: Physical) -> (Physical, Physical) {
//		(left - right, left + right)
//	}
//
//	static func ± (left: Physical, right: Physical) -> (Physical, Physical) {
//		(left + right, left - right)
//	}
	
	static func * (left: (Physical, Physical), right: Physical) -> (Physical, Physical) {
		(left.0 * right, left.1 * right)
	}
	
	static func / (left: (Physical, Physical), right: Physical) -> (Physical, Physical) {
		(left.0 / right, left.1 / right)
	}
}

public func abs(_ number: Physical) -> Physical {
	if let values = number.values {
		var out = [Double](repeating: 0, count: values.count)
		vDSP_vabsD(values, 1, &out, 1, vDSP_Length(values.count))
		
		return Physical(values: out, units: number.units, sigfigs: number.sigfigs)
	}
	
	return Physical(value: abs(number.value), units: number.units, sigfigs: number.sigfigs)
}

private func trigFunction(_ f: DoubleToDouble, _ g: VVDoubles, for number: Physical) -> Physical {
	if number ~ 1.0.radians {
		if var values = number.values {
			var count = Int32(values.count)
			var out = [Double](repeating: 0, count: values.count)
			g(&out, &values, &count)
			
			return Physical(values: out, units: [:], sigfigs: number.sigfigs)
		}
		
		return f(number.to(.radians).value).constant.sigfigs(number.sigfigs)
	}
	
	return .notAThing
}
public func inversionTrigFunction(_ f: DoubleToDouble, _ g: VVDoubles, for number: Physical) -> Physical {
	if number.units.count == 0 {
		if var values = number.values {
			var count = Int32(values.count)
			var out = [Double](repeating: 0, count: values.count)
			g(&out, &values, &count)
			
			return out.radians.sigfigs(number.sigfigs)
		}
		
		let inverseValue = f(number.value)
		
		if !inverseValue.isNaN {
			return inverseValue.radians.sigfigs(number.sigfigs)
		}
	}
	
	return .notAThing
}

public func cos(_ number: Physical) -> Physical {
	trigFunction(cos, vvcos, for: number)
}
public func sin(_ number: Physical) -> Physical {
	trigFunction(sin, vvsin, for: number)
}
public func tan(_ number: Physical) -> Physical {
	trigFunction(tan, vvtan, for: number)
}
public func cosh(_ number: Physical) -> Physical {
	trigFunction(cosh, vvcosh, for: number)
}
public func sinh(_ number: Physical) -> Physical {
	trigFunction(sinh, vvsinh, for: number)
}
public func tanh(_ number: Physical) -> Physical {
	trigFunction(tanh, vvtanh, for: number)
}
public func acos(_ number: Physical) -> Physical {
	inversionTrigFunction(acos, vvacos, for: number)
}
public func asin(_ number: Physical) -> Physical {
	inversionTrigFunction(asin, vvasin, for: number)
}
public func atan(_ number: Physical) -> Physical {
	inversionTrigFunction(atan, vvatan, for: number)
}
public func acosh(_ number: Physical) -> Physical {
	inversionTrigFunction(acosh, vvacosh, for: number)
}
public func asinh(_ number: Physical) -> Physical {
	inversionTrigFunction(asinh, vvasinh, for: number)
}
public func atanh(_ number: Physical) -> Physical {
	inversionTrigFunction(atanh, vvatanh, for: number)
}

// transcendental functions

// TODO: we need support for arrays also

// math.h functions that take just a double argument:

// manually removing: trig functions, sqrt, cbrt, fabs, ceil, floor, nearbyint, rint, round, __*, trunc, significand, gamma

public func exp(_ number: Physical) -> Physical {
	number.isDimensionless ? exp(number.value).constant : .notAThing
}
public func exp2(_ number: Physical) -> Physical {
	number.isDimensionless ? exp2(number.value).constant : .notAThing
}
public func expm1(_ number: Physical) -> Physical {
	number.isDimensionless ? expm1(number.value).constant : .notAThing
}
public func log(_ number: Physical) -> Physical {
	number.isDimensionless ? log(number.value).constant : .notAThing
}
public func log10(_ number: Physical) -> Physical {
	number.isDimensionless ? log10(number.value).constant : .notAThing
}
public func log2(_ number: Physical) -> Physical {
	number.isDimensionless ? log2(number.value).constant : .notAThing
}
public func log1p(_ number: Physical) -> Physical {
	number.isDimensionless ? log1p(number.value).constant : .notAThing
}
public func logb(_ number: Physical) -> Physical {
	number.isDimensionless ? logb(number.value).constant : .notAThing
}
public func erf(_ number: Physical) -> Physical {
	number.isDimensionless ? erf(number.value).constant : .notAThing
}
public func erfc(_ number: Physical) -> Physical {
	number.isDimensionless ? erfc(number.value).constant : .notAThing
}
public func lgamma(_ number: Physical) -> Physical {
	number.isDimensionless ? lgamma(number.value).constant : .notAThing
}
public func tgamma(_ number: Physical) -> Physical {
	number.isDimensionless ? tgamma(number.value).constant : .notAThing
}
public func j0(_ number: Physical) -> Physical {
	number.isDimensionless ? j0(number.value).constant : .notAThing
}
public func j1(_ number: Physical) -> Physical {
	number.isDimensionless ? j1(number.value).constant : .notAThing
}
public func y0(_ number: Physical) -> Physical {
	number.isDimensionless ? y0(number.value).constant : .notAThing
}
public func y1(_ number: Physical) -> Physical {
	number.isDimensionless ? y1(number.value).constant : .notAThing
}

// experiment:

// The downside of providing such a function is that the coder is then forced to declare the return type, if only by inference, to use either version of the call. It is (currently) seen as better to keep the types Physical, which is what they starte from, and have the developer grab the appropriate value when converting back to Double.

//public func exp(_ number: Physical) -> Double {
//	number.isDimensionless ? exp(number.value) : .nan
//}
