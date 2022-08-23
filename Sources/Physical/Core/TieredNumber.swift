import Foundation

/// TieredNumbers work using the idea of graceful degradation from integer values, to fractions, then to floats, as each becomes insufficient.
public enum TieredNumber: Equatable, CustomStringConvertible {
//	case zero
	case integer(Int)
	case fraction(Int, Int)
	case real(Double)
	
	public var isPositive: Bool {
		switch self {
			case let .integer(i): return (0 <= i)
			case let .fraction(a, b): return (0 <= a*b)
			case let .real(d): return (0 <= d)
//			case .zero: return false
		}
	}
	
	// purely for debugging:
	public func kind() -> String {
		switch self {
			case .integer(_): return "Int"
			case let .fraction(a, b): return "Fraction: \(a), \(b)"
			case .real(_): return "Double"
		}
	}
	
	public var isZero: Bool {
		switch self {
			case let .integer(i): return (0 == i)
			case let .real(d): return (0 == d)
			case let .fraction(a, _): return (0 == a)
//			case .zero: return true
		}
	}
	
	public var realValue: Double {
		switch self {
			case let .integer(i): return Double(i)
			case let .fraction(a, b): return Double(a)/Double(b)
			case let .real(d): return d
//			case .zero: return 0
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
				return (a==b)
				
			case (let .fraction(a, b), let .fraction(c, d)):
				return (a == 0 && c == 0) || (a==c && b==d)
				
			case (let .real(a), let .real(b)):
				// doesn't really handle extreme numbers and zero
				return (a==b)
				
//			case (.zero, .zero): return true
			default: return false
		}
	}
	
	public static func + (left: TieredNumber, right: TieredNumber) -> TieredNumber {
		switch (left, right) {
			case (let .integer(c),       let .integer(e)):       return .integer(c + e)
			case (let .fraction(c1, c2), let .integer(e)):       return .fraction(c1 + e * c2, c2)
			case (let .real(c),          let .integer(e)):       return .real(c + Double(e))
			case (let .integer(c),       let .fraction(e1, e2)): return .fraction(c * e2 + e1, e2)
			case (let .fraction(c1, c2), let .fraction(e1, e2)): return .fraction(e2 * c1 + e1 * c2, c2 * e2)
			case (let .real(c),          let .fraction(e1, e2)): return .real(c + (Double(e1) / Double(e2)))
			case (let .integer(c),       let .real(e)):          return .real(e + Double(c))
			case (let .fraction(c1, c2), let .real(e)):          return .real(e + (Double(c1) / Double(c2)))
			case (let .real(c),          let .real(e)):          return .real(c + e)
//			case (.zero, let x): return x
//			case (let x, .zero): return x
		}
		
	}
	
	public static func * (left: TieredNumber, right: TieredNumber) -> TieredNumber {
		switch (left, right) {
			case (let .integer(c), let .integer(e)):
				return .integer(c * e)
				
			case (let .fraction(c1, c2), let .integer(e)):
				return TieredNumber.fraction(c1 * e, c2).fractionCheck()
			case (let .integer(c), let .fraction(e1, e2)):
				return TieredNumber.fraction(c * e1, e2).fractionCheck()
			case (let .fraction(c1, c2), let .fraction(e1, e2)):
				return TieredNumber.fraction(e1 * c1, c2 * e2).fractionCheck()
			
			// no coming back from being rational -- but probably some rules of thumb later could work
			case (let .real(c),          let .integer(e)):       return .real(c * Double(e))
			case (let .real(c),          let .fraction(e1, e2)): return .real((c * Double(e1)) / Double(e2))
			case (let .integer(c),       let .real(e)):          return .real(e * Double(c))
			case (let .fraction(c1, c2), let .real(e)):          return .real((e * Double(c1)) / Double(c2))
			case (let .real(c),          let .real(e)):          return .real(c * e)
		}
		
	}
	
	private func fractionCheck() -> TieredNumber {
		func gcd(_ a: Int, _ b: Int) -> Int {
			let r = a % b
			if r != 0 {
				return gcd(b, r)
			} else {
				return b
			}
		}
		
		func betterRational(_ a: Int, _ b: Int) -> (top: Int, bottom: Int) {
			let g = gcd(a, b)
			if 1 < g {
				return (a/g, b/g)
			}
			
			return (a, b)
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
		case let .integer(i): return pow(x, Double(i))
		case let .fraction(a, b): return pow(x, Double(a)/Double(b))
		case let .real(d): return pow(x, Double(d))
	}
}
