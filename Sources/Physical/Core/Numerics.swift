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

public func * (left: Physical, right: Percentage) -> Physical {
	if let values = left.values {
		return Physical(values: values * right.value / 100, units: left.units, sigfigs: left.sigfigs)
	}
	
	return Physical(value: left.value * right.value / 100, units: left.units, sigfigs: left.sigfigs)
}

public func * (left: Percentage, right: Physical) -> Physical {
	right * left
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

infix operator ∩ : LogicalConjunctionPrecedence

public extension Set {
	static func ∩ (left: Set, right: Set) -> Set {
		left.intersection(right)
	}
}
