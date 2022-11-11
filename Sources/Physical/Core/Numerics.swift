import Foundation
import Accelerate

prefix operator √
prefix operator ∛
prefix operator ∜

infix operator √ : MultiplicationPrecedence

postfix operator %

public let π = Double.pi // should this be Double.pi.constant ?

public struct Percentage {
	var value: Double
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
	func toSigfigs(_ sigfigs: Int) -> Double {
		let scale = pow(10, floor(-log10(self) + Double(sigfigs)))
		
		return Foundation.round(scale * self) / scale
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

public prefix func √ (right: Double) -> Double {
	sqrt(right)
}

public func √ (left: Int, right: Double) -> Double {
	pow(right, 1 / Double(left))
}

//public prefix func ∛<T: Real> (right: T) -> T {
//	.cbrt(right)
//}
//public prefix func ∜<T: Real> (right: T) -> T {
//	T.pow(right, T(0.25))
//}
/*
public extension Real {
	var sigfigs: Int {
		let b = "\(self)"
			.components(separatedBy: "e").first!
			.trimmingCharacters(in: CharacterSet(charactersIn: "0."))
		return b.count - (b.contains(".") ? 1 : 0)
	}
	
	func toInteger() -> Int? {
		if let floaty = self as? Float {
			return Int(floaty)
		}
		else if let doubly = self as? Double {
			return Int(doubly)
		}
//		else if let f80 = self as? Float80 {
//			return Int(f80)
//		}
		
		return nil
	}
	
	func toDouble() -> Double? {
		if let floaty = self as? Float {
			return Double(floaty)
		}
		else if let doubly = self as? Double {
			return doubly
		}
		else if let f80 = self as? Float80 {
			return Double(f80)
		}
		
		return nil
	}
}
*/

public extension Double {
	var π: Double {
		self * .pi
	}
	var π²: Double {
		self * .pi * .pi
	}
	
	var e: Double {
		Double(self) * exp(1.0)
	}
	
	var constant: Physical {
		Physical(value: self, units: [:], sigfigs: self.sigfigs)
	}	

	var sigfigs: Int {
		let b = "\(self)"
			.components(separatedBy: "e").first!
			.trimmingCharacters(in: CharacterSet(charactersIn: "0."))
		return b.count - (b.contains(".") ? 1 : 0)
	}
}

public extension Float {
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
	
	//	var radians: Physical {
	//		if self !~ 1.constant {
	//			return .notAThing
	//		}
	//
	//		return self.value.degrees
	//	}
}
