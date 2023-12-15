import Foundation
import Accelerate

prefix operator ∑

public func Σ(_ range: Range<Int>, _ f: (Double) -> Double) -> Double {
	range
		.map { Double($0) }
		.map { f($0) }
		.reduce(0, +)
}

public func Σi(_ range: Range<Int>, _ f: (Int) -> Double) -> Double {
	range.map { f($0) }.reduce(0, +)
}

public func Σ(_ rangeA: ClosedRange<Int>, _ rangeB: ClosedRange<Int>, _ rangeC: ClosedRange<Int>, _ type: RangeType = .standard, _ f: (Double, Double, Double) -> Double) -> Double {
	Σ(rangeC, type) { k in
		Σ(rangeB, rangeA, type) { i, j in
			f(i, j, k)
		}
	}
}

public func Σ(_ rangeA: ClosedRange<Int>, _ rangeB: ClosedRange<Int>, _ type: RangeType = .standard, _ f: (Double, Double) -> Double) -> Double {
	Σ(rangeB, type) { j in
		Σ(rangeA, type) { i in
			f(i, j)
		}
	}
}

public func Σ(_ range: ClosedRange<Int>, _ type: RangeType = .standard, _ f: (Double) -> Double) -> Double {
	let customRange: [ClosedRange<Int>.Element]
	
	switch type {
		case .even:
			customRange = range.filter { $0 % 2 == 0 }
		case .odd:
			customRange = range.filter { $0 % 2 == 1 }
		case .nonzero:
			customRange = range.filter { $0 != 0 }
		default:
			customRange = range.filter { _ in true }
	}
	
	return customRange
		.map { Double($0) }
		.map { f($0) }
		.reduce(0, +)
}

public func Σi(_ range: ClosedRange<Int>, _ type: RangeType = .standard, _ f: (Int) -> Double) -> Double {
	let customRange: [ClosedRange<Int>.Element]
	
	switch type {
		case .even:
			customRange = range.filter { $0 % 2 == 0 }
		case .odd:
			customRange = range.filter { $0 % 2 == 1 }
		case .nonzero:
			customRange = range.filter { $0 != 0 }
		default:
			customRange = range.filter { _ in true }
	}
	
	return customRange.map { f($0) }.reduce(0, +)
}

public func simpson(from start: Double, to end: Double, N: Int, f: (Double) -> Double) -> Double {
	let h = (end - start) / Double(N)
	
	return (h / 3) * (
		f(start) + f(end) +
			4 * Σ(1...(N-1), .odd ) { f(start + ($0 * h)) } +
			2 * Σ(2...(N-1), .even) { f(start + ($0 * h)) }
	)
}

// MARK: - Ranges -

public enum RangeType {
	case standard, even, odd, nonzero
}

public extension ClosedRange where Bound == Int {
	func by(_ stepSize: Double) -> [Double] {
		let doubleLower = Double(lowerBound)
		let doubleUpper = Double(upperBound)
		return (doubleLower ... doubleUpper).by(stepSize)
	}
	
	func by(_ stepSize: Physical) -> Physical {
		let doubleLower = Double(lowerBound)
		let doubleUpper = Double(upperBound)
		return (doubleLower ... doubleUpper).by(stepSize)
	}
	
	func count(_ n: Int) -> [Double] {
		ramp(in: self, count: n)
	}
}

public extension ClosedRange where Bound == Double {
	func by(_ stepSize: Double) -> [Double] {
		Array(stride(from: lowerBound, through: upperBound, by: stepSize))
	}
	
	func by(_ stepSize: Physical, sigfigs: Int = 16) -> Physical {
		Physical(values: Array(stride(from: lowerBound, through: upperBound, by: stepSize.value)), units: stepSize.units, sigfigs: sigfigs)
	}
}

public extension ClosedRange where Bound == Physical {
	func by(_ stepSize: Physical) -> Physical? {
		if (lowerBound ~ upperBound) && (lowerBound ~ stepSize),
		   !lowerBound.isArray && !upperBound.isArray {
			if let low = equalDimensionDictionaries(lowerBound.units, stepSize.units) ? lowerBound : lowerBound.to(units: stepSize.units),
			   let high = equalDimensionDictionaries(upperBound.units, stepSize.units) ? upperBound : upperBound.to(units: stepSize.units) {
				return (low.value ... high.value).by(stepSize, sigfigs: Swift.max(stepSize.sigfigs, Swift.max(low.sigfigs, high.sigfigs)))
			}
			
		}
		
		return nil
	}
	
	func count(_ steps: Int) -> Physical {
		if (lowerBound ~ upperBound) && 0 < steps {
			return self.by((upperBound - lowerBound)/steps)!
		}
		
		return .notAThing
	}
}

public func ramp(in range: Range<Int>, count: Int) -> [Double] {
	ramp(in: Double(range.lowerBound)...Double(range.upperBound - 1), count: count)
}
public func ramp(in range: Range<Int>, by: Double) -> [Double] {
	ramp(in: Double(range.lowerBound)...Double(range.upperBound - 1), by: by)
}
public func ramp(in range: Range<Int>) -> [Double] {
	ramp(in: Double(range.lowerBound)...Double(range.upperBound - 1), by: 1)
}

public func ramp(in range: ClosedRange<Int>, count: Int) -> [Double] {
	ramp(in: Double(range.lowerBound)...Double(range.upperBound), count: count)
}
public func ramp(in range: ClosedRange<Int>, by: Double) -> [Double] {
	ramp(in: Double(range.lowerBound)...Double(range.upperBound), by: by)
}
public func ramp(in range: ClosedRange<Int>) -> [Double] {
	ramp(in: Double(range.lowerBound)...Double(range.upperBound), by: 1)
}

public func ramp(in range: ClosedRange<Double>, count: Int) -> [Double] {
	vDSP.ramp(in: range, count: count)
}

public func ramp(in range: ClosedRange<Double>, by: Double) -> [Double] {
	vDSP.ramp(withInitialValue: range.lowerBound, increment: by, count: Int((range.upperBound - range.lowerBound)/by) + 1)
}

public func * (left: Int, right: Range<Int>) -> [Int] {
	right.map { $0 * left }
}

public func * (left: Int, right: ClosedRange<Int>) -> [Int] {
	right.map { $0 * left }
}

// MARK: - Miscellaneous -

public func sleep(_ δt: Physical) {
	if δt ~ 1.s {
		usleep(useconds_t((δt → .microseconds).value))
	}
}

public func distance(_ a: Physical, _ b: Physical) -> Physical {
	if let av = a.values, av.count == 2,
	   let bv = b.values, bv.count == 2,
	   a ~ b {
		return √(((a[0] - b[0])^2) + ((a[1] - b[1])^2))
	}
	
	return .notAThing
}

public func repeating(count: Int, _ block: () -> Void) {
	for _ in 1...count { block() }
}

public enum TimePrecision: CFTimeInterval {
	case microSeconds = 1
	case milliSeconds = 1_000
	case seconds = 1_000_000
	
	var description: String {
		switch self {
			case .microSeconds: "μs"
			case .milliSeconds: "ms"
			case .seconds: "seconds"
		}
	}
}

public func time(_ label: String, precision: TimePrecision = .microSeconds, ƒ: () -> Void) {
	print("start [\(label)] ⏱")
	let t0 = CFAbsoluteTimeGetCurrent()
	ƒ()
	let t1 = CFAbsoluteTimeGetCurrent()
	
	let Δt = round(1_000_000 * (t1-t0)) / precision.rawValue
	
	print("⏱ \(label): \(Δt) \(precision.description)")
}
