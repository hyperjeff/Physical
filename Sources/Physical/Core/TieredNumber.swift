import Foundation

/// TieredNumbers work using the idea of graceful degradation from integer values, to fractions, then to floats, as each becomes insufficient.
public enum TieredNumber: Equatable, Comparable, CustomStringConvertible {
//	case zero
	case integer(Int)
	case fraction(Int, Int)
	case real(Double)
	
	public init(_ x: Double) {
		self = .integer(0) // ← purely here to shut up the static analyzer
		
		if x == Double(Int(x)) {
			self = .integer(Int(x))
		}
		else {
			var fractionFound = false
			
			for denom in 1...31 {
				let y = x * Double(denom)
				
				if y == Double(Int(y)) {
					self = .fraction(Int(y), denom).fractionCheck()
					fractionFound = true
				}
			}
			
			if !fractionFound {
				self = .real(x)
			}
		}
	}
	
	public var isPositive: Bool {
		switch self {
			case let .integer(i): (0 <= i)
			case let .fraction(a, b): (0 <= a*b)
			case let .real(d): (0 <= d)
//			case .zero: false
		}
	}
	
	public func matchesSign(of other: TieredNumber) -> Bool {
		return
			(isZero && other.isZero) ||
			(isPositive && other.isPositive) ||
			(isNegative && other.isNegative)
	}
	
	// purely for debugging:
	public func kind() -> String {
		switch self {
			case .integer(_): "Int"
			case let .fraction(a, b): "Fraction: \(a), \(b)"
			case .real(_): "Double"
		}
	}
	
	public var isZero: Bool {
		switch self {
			case let .integer(i): (0 == i)
			case let .real(d): (0 == d)
			case let .fraction(a, _): (0 == a)
//			case .zero: true
		}
	}
	
	public var isNegative: Bool {
		!isZero && !isPositive
	}
	
	public var realValue: Double {
		switch self {
			case let .integer(i): Double(i)
			case let .fraction(a, b): Double(a)/Double(b)
			case let .real(d): d
//			case .zero: 0
		}
	}
	
	public var description: String {
		switch self {
			case let .integer(i): return "\(i)"
			case let .fraction(a, b): return "\(a)/\(b)"
			case let .real(d):
				if d.rounded() == d {
					return "\(d.rounded())" // ← want an Int cast here
				}
				
				return "\(d)"
//			case .zero: return "0"
		}
	}
	
	public static func == (left: TieredNumber, right: TieredNumber) -> Bool {
		switch (left, right) {
			case (let .integer(a), let .integer(b)):
				(a==b)
				
			case (let .fraction(a, b), let .fraction(c, d)):
				(a == 0 && c == 0) || (a==c && b==d)
				
			case (let .real(a), let .real(b)):
				// doesn't really handle extreme numbers and zero
				(a==b)
				
//			case (.zero, .zero): return true
			default: false
		}
	}
	
	public static func + (left: TieredNumber, right: TieredNumber) -> TieredNumber {
		switch (left, right) {
			case (let .integer(c), let .integer(e)):
				.integer(c + e)
			case (let .fraction(c1, c2), let .integer(e)):
				.fraction(c1 + e * c2, c2).fractionCheck()
			case (let .real(c), let .integer(e)):
				.real(c + Double(e))
			case (let .integer(c), let .fraction(e1, e2)):
				.fraction(c * e2 + e1, e2).fractionCheck()
			case (let .fraction(c1, c2), let .fraction(e1, e2)):
				.fraction(e2 * c1 + e1 * c2, c2 * e2).fractionCheck()
			case (let .real(c), let .fraction(e1, e2)):
				.real(c + (Double(e1) / Double(e2)))
			case (let .integer(c), let .real(e)):
				.real(e + Double(c))
			case (let .fraction(c1, c2), let .real(e)):
				.real(e + (Double(c1) / Double(c2)))
			case (let .real(c), let .real(e)):
				.real(c + e)
//			case (.zero, let x): x
//			case (let x, .zero): x
		}
		
	}
	
	public static func * (left: TieredNumber, right: TieredNumber) -> TieredNumber {
		switch (left, right) {
			case let (.integer(c), .integer(e)): .integer(c * e)
			case let (.fraction(c1, c2), .integer(e)):
				TieredNumber.fraction(c1 * e, c2).fractionCheck()
			case let (.integer(c), .fraction(e1, e2)):
				TieredNumber.fraction(c * e1, e2).fractionCheck()
			case let (.fraction(c1, c2), .fraction(e1, e2)):
				TieredNumber.fraction(e1 * c1, c2 * e2).fractionCheck()
			
			// no coming back from being rational -- but probably some rules of thumb later could work
			case let (.real(c),          .integer(e)):       .real(c * Double(e))
			case let (.real(c),          .fraction(e1, e2)): .real((c * Double(e1)) / Double(e2))
			case let (.integer(c),       .real(e)):          .real(e * Double(c))
			case let (.fraction(c1, c2), .real(e)):          .real((e * Double(c1)) / Double(c2))
			case let (.real(c),          .real(e)):          .real(c * e)
		}
		
	}
	
	public static func / (left: TieredNumber, right: Int) -> TieredNumber {
		switch left {
			case let .integer(i):
				if i % right == 0 {
					return .integer(i / right)
				}
				else {
					return .fraction(i, right)
				}
			case let .fraction(a, b): return .fraction(a, b * right)
			case let .real(r): return .real(r/Double(right))
		}
	}
	
	public static func ^ (left: TieredNumber, right: Double) -> TieredNumber {
		let exponent = TieredNumber(right)
		
		switch (left, exponent) {
			case let (.integer(i), .integer(j)):
				return .integer(Int(pow(Double(i), Double(j))))
				
			case let (.integer(i), .fraction(a, b)):
				if i == 1 { return .integer(1) }
				
				return TieredNumber(pow(Double(i), Double(a) / Double(b)))
			
			case let (.integer(i), .real(r)):
				return TieredNumber(pow(Double(i), r))
				
			case let (.fraction(a, b), .integer(j)):
				return .fraction(Int(pow(Double(a), Double(j))), Int(pow(Double(b), Double(j)))).fractionCheck()
				
			case let (.fraction(a, b), .fraction(c, d)):
				return TieredNumber(pow(Double(a) / Double(b), Double(c) / Double(d)))
				
			case let (.fraction(a, b), .real(r)):
				return .real(pow(Double(a) / Double(b), r))
				
			case let (.real(r), _):
				return .real(pow(r, right))
		}
	}
	
	public static prefix func - (right: TieredNumber) -> TieredNumber {
		switch right {
			case let .integer(i): .integer(-i)
			case let .fraction(a, b): .fraction(-a, b)
			case let .real(r): .real(-r)
		}
	}
	
	public static func * (left: TieredNumber, right: Double) -> TieredNumber {
		switch left {
			case let .integer(i): TieredNumber(Double(i) * right)
			case let .fraction(a, b): TieredNumber(Double(a) * right / Double(b))
			case let .real(r): .real(r * right)
		}
	}
	
	public static func < (left: TieredNumber, right: TieredNumber) -> Bool {
		switch (left, right) {
			case let (.integer(i), .integer(j)): i < j
			case let (.real(r), .real(s)): r < s
			case let (.integer(i), .real(s)): Double(i) < s
			case let (.real(r), .integer(j)): r < Double(j)
			case let (.fraction(a, b), .fraction(c, d)): a * d < b * c
			case let (.fraction(a, b), .integer(j)): a < b * j
			case let (.fraction(a, b), .real(s)): Double(a) < Double(b) * s
			case let (.integer(i), .fraction(c, d)): i * d < c
			case let (.real(r), .fraction(c, d)): r * Double(d) < Double(c)
		}
	}
	
	public func fractionCheck() -> TieredNumber {
		func gcd(_ a: Int, _ b: Int) -> Int {
			let r = a % b
			
			if r == 0 {
				return b
			}
			
			return gcd(b, r)
		}
		
		func betterRational(_ a: Int, _ b: Int) -> (top: Int, bottom: Int) {
			let g = gcd(abs(a), abs(b))
			let sign = (a * b < 0) ? -1 : 1
			
			if 1 < abs(g) {
				return (sign * abs(a)/g, abs(b)/g)
			}
			
			return (sign * abs(a), abs(b))
		}
		
		switch self {
			case let .fraction(a, b):
				let better = betterRational(a, b)
				
				if better.bottom == 1 {
					return .integer(better.top)
				}
				
				return .fraction(better.top, better.bottom)
				
			default: return self
		}
	}
}

public func pow(_ x: Double, exponent: TieredNumber) -> Double {
	switch exponent {
		case let .integer(i): pow(x, Double(i))
		case let .fraction(a, b): pow(x, Double(a)/Double(b))
		case let .real(d): pow(x, Double(d))
	}
}

public func abs(_ t: TieredNumber) -> TieredNumber {
	switch t {
		case let .integer(i): .integer(abs(i))
		case let .fraction(a, b): .fraction(abs(a), abs(b))
		case let .real(r): .real(abs(r))
	}
}

public func max(_ a: TieredNumber, _ b: TieredNumber) -> TieredNumber {
	(a < b) ? b : a
}
