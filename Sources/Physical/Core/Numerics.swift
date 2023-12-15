import Foundation
import Accelerate

public let π = Double.pi // should this be Double.pi.constant ?

public struct Percentage {
	var value: Double
}

public func * (left: Int, right: Percentage) -> Double {
	Double(left) * right
}

public func * (left: Double, right: Percentage) -> Double {
	left * right.value / 100
}

public struct DoubleRange {
	var low, high: Double
}

public extension Dimension {
	static func ~ (left: Dimension, right: Dimension) -> Bool {
		(left.superclass == right.superclass) ||
		(left.superclass == type(of: right)) ||
		(type(of: left) == right.superclass)
	}
	
	static func !~ (left: Dimension, right: Dimension) -> Bool {
		!(left ~ right)
	}
}


public extension Double {
	func dignum() -> Double {
		0 < self ? 1 : -1
	}
	
	func toSigfigs(_ sigfigs: Int) -> Double {
		let value = abs(self)
		let scale = pow(10, floor(-log10(value) + Double(sigfigs)))
		
		var out = Foundation.round(scale * value) / scale
		if self < 0 { out *= -1 }
		
		return out
	}
	
	static postfix func % (left: Double) -> Percentage {
		Percentage(value: left)
	}
}

//___________________________/ Standard deviation via ±

public func ± (left: Double, right: Double) -> Physical {
	left ± right.constant
}

public func ± (left: Double, right: Physical) -> Physical {
	var out = Physical(value: left, units: right.units, sigfigs: right.sigfigs)
	out.standardDeviation = right.value.constant
	out.sigfigs = Int(floor(log10(abs(left))) - floor(log10(2 * right.value)) + 1)
	
	return out
}

public func ± (left: Double, right: Percentage) -> Physical {
	let diff = left * right.value / 100
	
	return left ± diff
}

public func ± (left: Int, right: Physical) -> Physical {
	Double(left) ± right
}

public func + (left: Double, right: Percentage) -> Double {
	left * (1 + right.value / 100)
}

public func - (left: Double, right: Percentage) -> Double {
	left * (1 - right.value / 100)
}

public func + (left: Int, right: Percentage) -> Double {
	Double(left) + right
}

public func - (left: Int, right: Percentage) -> Double {
	Double(left) - right
}


public extension Int {
	var pi: Double {
		Double(self) * .pi
	}
	
	var π: Double {
		Double(self) * .pi
	}
	
	var π²: Double {
		Double(self) * .pi * .pi
	}
	
	var e: Double {
		Double(self) * exp(1.0)
	}
	
	var constant: Physical {
		Physical(value: Double(self), units: [:], sigfigs: 16)
	}
	
	static postfix func ° (left: Int) -> Physical {
		Physical(value: Double(left), unit: UnitAngle.degrees)
	}
}

public func ^ (left: Double, right: Double) -> Double {
	pow(left, right)
}

public func ^ (left: Double, right: Int) -> Double {
	pow(left, Double(right))
}

public prefix func √ (right: Double) -> Double {
	sqrt(right)
}

public func √ (left: Int, right: Double) -> Double {
	pow(right, 1 / Double(left))
}

public extension BinaryFloatingPoint {
	var π: any BinaryFloatingPoint {
		self * .pi
	}
	var π²: any BinaryFloatingPoint {
		self * .pi * .pi
	}
	
	var e: any BinaryFloatingPoint {
		Double(self) * exp(1.0)
	}
	
	var constant: Physical {
		Physical(value: Double(self), units: [:], sigfigs: self.sigfigs)
	}

	var sigfigs: Int {
		let b = "\(self)"
			.components(separatedBy: "e").first!
			.trimmingCharacters(in: CharacterSet(charactersIn: "0."))
		return b.count - (b.contains(".") ? 1 : 0)
	}
}

public extension Array where Element == Double {
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
	
	static func +! (left: Array, right: Array) -> Array {
		var out = right
		cblas_daxpy(Int32(out.count), 1, left, 1, &out, 1)
		
		return out
	}
	
	static func - (left: Array, right: Array) -> Array? {
		guard left.count == right.count else { return nil }
		
		var out = left
		cblas_daxpy(Int32(out.count), -1, right, 1, &out, 1)
		
		return out
	}
	
	static func -! (left: Array, right: Array) -> Array {
		var out = left
		cblas_daxpy(Int32(out.count), -1, right, 1, &out, 1)
		
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
	
	static func - (left: Double, right: Array) -> Array {
		var out = right
		var x = [Double](repeating: left, count: out.count)
		catlas_daxpby(Int32(out.count), 1, &x, 1, -1, &out, 1)
		return out
	}
	
	static func - (left: Array, right: Double) -> Array {
		left + (-right)
	}
	
	static func ⨁ (left: Array, right: Array) -> Array? {
		left + right
	}
	
	static func ⨀ (left: Array, right: Array) -> Array {
		//		guard left.count == right.count else { return nil }
		
		var out = [Double](repeating: 0, count: left.count)
		vDSP_vmulD(left, 1, right, 1, &out, 1, vDSP_Length(left.count))
		return out
	}
	
	//	static func ⨀! (left: Array, right: Array) -> Array {
	//		(left ⨀ right)!
	//	}
	
	static func .+ (left: Array, right: Array) -> Array? {
		left ⨁ right
	}
	
	static func .* (left: Array, right: Array) -> Array {
		left ⨀ right
	}
	
	static func ./ (left: Array, right: Array) -> Array {
		var out = [Double](repeating: 0, count: left.count)
		vDSP_vdivD(right, 1, left, 1, &out, 1, vDSP_Length(left.count))
		return out
	}
	
	static func • (left: Array, right: Array) -> Double {
		cblas_ddot(1, left, 1, right, 1)
	}
	
	// the Following COULD be generated, but is small enough to hard-code
	
	func sum() -> Double {
		vDSP.sum(self)
	}
	
	func mean() -> Double {
		vDSP.mean(self)
	}
	
	func minimum() -> Double {
		vDSP.minimum(self)
	}
	
	func maximum() -> Double {
		vDSP.maximum(self)
	}
	
	var allNegative: Bool {
		maximum() < 0
	}
	
	var sigfigs: Int {
		self.map { $0.sigfigs }.max() ?? 0
	}
	
	func sigfigInt32(_ sigfigs: Int) -> [Int32] {
		if 9 < sigfigs { return [] }
		
		var n = Int32(count)
		var prefloor = [Double](repeating: Double(sigfigs), count: count)
		var floory = [Double](repeating: 0, count: count)
		
		let loggy = log10(vDSP.absolute(self))
		cblas_daxpy(n, -1, loggy, 1, &prefloor, 1)
		vvfloor(&floory, prefloor, &n)
		let scavs = pow(10, floory) ⨀ self
		let out = vDSP.floatingPointToInteger(scavs, integerType: Int32.self, rounding: .towardNearestInteger)
		
		return out
	}
	
	func equal(with: [Double], toSigFigs: Int) -> Bool {
		let this = self.sigfigInt32(toSigFigs)
		let that = with.sigfigInt32(toSigFigs)
		
		return !this.isEmpty && !that.isEmpty && this == that
	}
	
}

public extension Double {
	static postfix func / (left: Double) -> Physical {
		var out = left.constant
		out.invertSuffixes = true
		return out
	}
	
	static postfix func ° (left: Double) -> Physical {
		Physical(value: left, unit: UnitAngle.degrees)
	}
}

public extension Float {
	static postfix func ° (left: Float) -> Physical {
		Physical(value: Double(left), unit: UnitAngle.degrees)
	}
}

public extension Physical {
	static postfix func ° (left: Physical) -> Physical {
		if left !~ 1.constant {
			return .notAThing
		}
		
		return left.value.degrees
	}
}

public extension Set {
	static func ∩ (left: Set, right: Set) -> Set {
		left.intersection(right)
	}
}

extension Bool {
	/// Logical XOR function
	/// - Parameters:
	///   - left: Bool
	///   - right: Bool
	/// - Returns: Bool
	static func ^^ (left: Bool, right: Bool) -> Bool {
		(left && !right) || (!left && right)
	}
	
	/// Logical XOR function
	/// - Parameters:
	///   - left: Bool
	///   - right: Bool
	/// - Returns: Bool
	static func ⊻ (left: Bool, right: Bool) -> Bool {
		(left && !right) || (!left && right)
	}
}

// Is there a way to unify (via protocols?) Int and BinaryFloatingPoint?

// What's a decent formula for this?
//public extension BinaryFloatingPoint {
//	static func || (left: any BinaryFloatingPoint, right: any BinaryFloatingPoint) -> any BinaryFloatingPoint {
//		1.0 / (1.0 / left + 1.0 / right)
//	}
//}

// Generated from import Darwin header:

public func cos(_ x: Int) -> Double { cos(Double(x)) }
public func exp(_ x: Int) -> Double { exp(Double(x)) }
public func exp2(_ x: Int) -> Double { exp2(Double(x)) }
public func log(_ x: Int) -> Double { log(Double(x)) }
public func log10(_ x: Int) -> Double { log10(Double(x)) }
public func log2(_ x: Int) -> Double { log2(Double(x)) }
public func nearbyint(_ x: Int) -> Double { nearbyint(Double(x)) }
public func rint(_ x: Int) -> Double { rint(Double(x)) }
public func sin(_ x: Int) -> Double { sin(Double(x)) }

public func acos(_ x: Int) -> Double { Double(acos(Float(x))) }
public func acosh(_ x: Int) -> Double { Double(acosh(Float(x))) }
public func asin(_ x: Int) -> Double { Double(asin(Float(x))) }
public func asinh(_ x: Int) -> Double { Double(asinh(Float(x))) }
public func atan(_ x: Int) -> Double { Double(atan(Float(x))) }
public func atanh(_ x: Int) -> Double { Double(atanh(Float(x))) }
public func cbrt(_ x: Int) -> Double { Double(cbrt(Float(x))) }
public func cosh(_ x: Int) -> Double { Double(cosh(Float(x))) }
public func erf(_ x: Int) -> Double { Double(erf(Float(x))) }
public func erfc(_ x: Int) -> Double { Double(erfc(Float(x))) }
public func expm1(_ x: Int) -> Double { Double(expm1(Float(x))) }
public func log1p(_ x: Int) -> Double { Double(log1p(Float(x))) }
public func logb(_ x: Int) -> Double { Double(logb(Float(x))) }
public func sinh(_ x: Int) -> Double { Double(sinh(Float(x))) }
public func tan(_ x: Int) -> Double { Double(tan(Float(x))) }
public func tanh(_ x: Int) -> Double { Double(tanh(Float(x))) }
public func tgamma(_ x: Int) -> Double { Double(tgamma(Float(x))) }

public func remquo(_ x: Int, _ y: Int) -> (Double, Int) { remquo(Double(x), Double(y)) }

//__________________________________________________________________/ Vectorizations -- move to other file?

private func trigArrayFunction(_ g: VVDoubles, for numbers: [Double]) -> [Double] {
	var values = numbers
	var count = Int32(values.count)
	var out = [Double](repeating: 0, count: values.count)
	
	g(&out, &values, &count)
	
	return out
}

public func inversionTrigArrayFunction(_ g: VVDoubles, for numbers: [Double]) -> [Double] {
	var values = numbers
	var count = Int32(values.count)
	var out = [Double](repeating: 0, count: values.count)
	
	g(&out, &values, &count)
	
	return out
}

public func cos(_ numbers: [Double]) -> [Double] { trigArrayFunction(vvcos, for: numbers) }
public func sin(_ numbers: [Double]) -> [Double] { trigArrayFunction(vvsin, for: numbers) }
public func tan(_ numbers: [Double]) -> [Double] { trigArrayFunction(vvtan, for: numbers) }
public func cospi(_ numbers: [Double]) -> [Double] { trigArrayFunction(vvcospi, for: numbers) }
public func sinpi(_ numbers: [Double]) -> [Double] { trigArrayFunction(vvsinpi, for: numbers) }
public func tanpi(_ numbers: [Double]) -> [Double] { trigArrayFunction(vvtanpi, for: numbers) }
public func cosh(_ numbers: [Double]) -> [Double] { trigArrayFunction(vvcosh, for: numbers) }
public func sinh(_ numbers: [Double]) -> [Double] { trigArrayFunction(vvsinh, for: numbers) }
public func tanh(_ numbers: [Double]) -> [Double] { trigArrayFunction(vvtanh, for: numbers) }
public func acos(_ numbers: [Double]) -> [Double] { inversionTrigArrayFunction(vvacos, for: numbers) }
public func asin(_ numbers: [Double]) -> [Double] { inversionTrigArrayFunction(vvasin, for: numbers) }
public func atan(_ numbers: [Double]) -> [Double] { inversionTrigArrayFunction(vvatan, for: numbers) }
public func acosh(_ numbers: [Double]) -> [Double] { inversionTrigArrayFunction(vvacosh, for: numbers) }
public func asinh(_ numbers: [Double]) -> [Double] { inversionTrigArrayFunction(vvasinh, for: numbers) }
public func atanh(_ numbers: [Double]) -> [Double] { inversionTrigArrayFunction(vvatanh, for: numbers) }

// TODO: cossin, sincos, atan2 ?

private func transcendentalArrayFunction(_ g: VVDoubles, for numbers: [Double]) -> [Double] {
	var values = numbers
	var count = Int32(values.count)
	var out = [Double](repeating: 0, count: values.count)
	
	g(&out, &values, &count)
	
	return out
}

public func exp(_ numbers: [Double]) -> [Double] { transcendentalArrayFunction(vvexp, for: numbers) }
public func exp2(_ numbers: [Double]) -> [Double] { transcendentalArrayFunction(vvexp2, for: numbers) }
public func expm1(_ numbers: [Double]) -> [Double] { transcendentalArrayFunction(vvexpm1, for: numbers) }
public func log(_ numbers: [Double]) -> [Double] { transcendentalArrayFunction(vvlog, for: numbers) }
public func log10(_ numbers: [Double]) -> [Double] { transcendentalArrayFunction(vvlog10, for: numbers) }
public func log2(_ numbers: [Double]) -> [Double] { transcendentalArrayFunction(vvlog2, for: numbers) }
public func log1p(_ numbers: [Double]) -> [Double] { transcendentalArrayFunction(vvlog1p, for: numbers) }
public func logb(_ numbers: [Double]) -> [Double] { transcendentalArrayFunction(vvlogb, for: numbers) }

public func pow(_ base: Double, _ numbers: [Double]) -> [Double] {
	let bases = [Double](repeating: base, count: numbers.count)
	return pow(bases, numbers)!
}

public func pow(_ bases: [Double], _ number: Double) -> [Double] {
	let numbers = [Double](repeating: number, count: bases.count)
	return pow(bases, numbers)!
}

public func pow(_ basesIn: [Double], _ numbers: [Double]) -> [Double]? {
	guard basesIn.count == numbers.count else { return nil }
	
	var exponents = numbers
	var count = Int32(numbers.count)
	var bases = basesIn
	var answer = [Double](repeating: 0, count: numbers.count)
	
	vvpow(&answer, &exponents, &bases, &count)
	
	return answer
}
