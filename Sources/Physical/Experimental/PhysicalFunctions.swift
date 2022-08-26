import Foundation

postfix operator °
prefix operator √
prefix operator ∛
prefix operator ∜
prefix operator -
infix operator ∓
infix operator ±
infix operator → : CastingPrecedence


// additional custom operators
public func sqrt(_ p: Physical) -> Physical {
	p ^ (1.0/2)
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

// trig functions

public func cos(_ number: Physical) -> Physical {
	if number ~ 1.0.radians {
		return cos(number.to(.radians).value).constant.sigfigs(number.sigfigs)
	}
	
	return .notAThing
}

public func sin(_ number: Physical) -> Physical {
	if number ~ 1.radians {
		return sin(number.to(.radians).value).constant.sigfigs(number.sigfigs)
	}
	
	return .notAThing
}

public func tan(_ number: Physical) -> Physical {
	if number ~ 1.radians {
		return tan(number.to(.radians).value).constant.sigfigs(number.sigfigs)
	}
	
	return .notAThing
}

public func cosh(_ number: Physical) -> Physical {
	if number ~ 1.radians {
		return cosh(number.to(.radians).value).constant.sigfigs(number.sigfigs)
	}
	
	return .notAThing
}

public func sinh(_ number: Physical) -> Physical {
	if number ~ 1.radians {
		return sinh(number.to(.radians).value).constant.sigfigs(number.sigfigs)
	}
	
	return .notAThing
}

public func tanh(_ number: Physical) -> Physical {
	if number ~ 1.radians {
		return tanh(number.to(.radians).value).constant.sigfigs(number.sigfigs)
	}
	
	return .notAThing
}

// inverse trig

public typealias InverseTrigFunction = (Double) -> Double

public func inversionTrigFunction(_ f: InverseTrigFunction, for number: Physical) -> Physical {
	if number.units.count == 0 {
		let inverseValue = f(number.value)
		
		if !inverseValue.isNaN {
			return inverseValue.radians.sigfigs(number.sigfigs)
		}
	}
	
	return .notAThing
}

public func acos(_ number: Physical) -> Physical {
	inversionTrigFunction(acos, for: number)
}

public func asin(_ number: Physical) -> Physical {
	inversionTrigFunction(asin, for: number)
}

public func atan(_ number: Physical) -> Physical {
	inversionTrigFunction(atan, for: number)
}

public func acosh(_ number: Physical) -> Physical {
	inversionTrigFunction(acosh, for: number)
}

public func asinh(_ number: Physical) -> Physical {
	inversionTrigFunction(asinh, for: number)
}

public func atanh(_ number: Physical) -> Physical {
	inversionTrigFunction(atanh, for: number)
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
