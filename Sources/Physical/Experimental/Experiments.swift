import Accelerate

prefix operator ∑

public enum RangeType {
	case standard, even, odd
}

public func Σ(_ range: Range<Int>, _ f: (Double) -> Double) -> Double {
	range
		.map { Double($0) }
		.map { f($0) }
		.reduce(0, +)
}

public func Σ(_ range: ClosedRange<Int>, _ type: RangeType = .standard, _ f: (Double) -> Double) -> Double {
	let customRange: [ClosedRange<Int>.Element]
	
	switch type {
		case .even:
			customRange = range.filter { $0 % 2 == 0 }
		case .odd:
			customRange = range.filter { $0 % 2 == 1 }
		default:
			customRange = range.filter { _ in true }
	}
	
	return customRange
		.map { Double($0) }
		.map { f($0) }
		.reduce(0, +)
}

public func simpson(from start: Double, to end: Double, N: Int, f: (Double) -> Double) -> Double {
	let h = (end - start) / Double(N)
	
	return (h / 3) * (
		f(start) + f(end) +
			4 * Σ(1...(N-1), .odd ) { f(start + ($0 * h)) } +
			2 * Σ(2...(N-1), .even) { f(start + ($0 * h)) }
	)
}

extension ClosedRange where Bound == Int {
	public func by(_ stepSize: Double) -> [Double] {
		let doubleLower = Double(lowerBound)
		let doubleUpper = Double(upperBound)
		return (doubleLower ... doubleUpper).by(stepSize)
	}
	
	public func by(_ stepSize: Physical) -> Physical {
		let doubleLower = Double(lowerBound)
		let doubleUpper = Double(upperBound)
		return (doubleLower ... doubleUpper).by(stepSize)
	}
}

extension ClosedRange where Bound == Double {
	public func by(_ stepSize: Double) -> [Double] {
		Array(stride(from: lowerBound, through: upperBound, by: stepSize))
	}
	
	public func by(_ stepSize: Physical, sigfigs: Int = 16) -> Physical {
		Physical(values: Array(stride(from: lowerBound, through: upperBound, by: stepSize.value)), units: stepSize.units, sigfigs: sigfigs)
	}
}

extension ClosedRange where Bound == Physical {
	public func by(_ stepSize: Physical) -> Physical? {
		if (lowerBound ~ upperBound) && (lowerBound ~ stepSize),
		   lowerBound.values == nil && upperBound.values == nil {
			if let low = equalDimensionDictionaries(lowerBound.units, stepSize.units) ? lowerBound : lowerBound.to(units: stepSize.units),
			   let high = equalDimensionDictionaries(upperBound.units, stepSize.units) ? upperBound : upperBound.to(units: stepSize.units) {
				return (low.value ... high.value).by(stepSize, sigfigs: Swift.max(stepSize.sigfigs, Swift.max(low.sigfigs, high.sigfigs)))
			}
			
		}
		
		return nil
	}
	
	public func count(_ steps: Int) -> Physical? {
		if (lowerBound ~ upperBound) && 0 < steps {
			return self.by((upperBound - lowerBound)/steps)
		}
		
		return nil
	}
}

public func ramp(in range: Range<Int>, count: Int) -> [Double] {
	ramp(in: Double(range.lowerBound)...Double(range.upperBound - 1), count: count)
}
public func ramp(in range: ClosedRange<Int>, count: Int) -> [Double] {
	ramp(in: Double(range.lowerBound)...Double(range.upperBound), count: count)
}
public func ramp(in range: Range<Int>, by: Double) -> [Double] {
	ramp(in: Double(range.lowerBound)...Double(range.upperBound - 1), by: by)
}
public func ramp(in range: ClosedRange<Int>, by: Double) -> [Double] {
	ramp(in: Double(range.lowerBound)...Double(range.upperBound), by: by)
}

public func ramp(in range: ClosedRange<Double>, count: Int) -> [Double] {
	vDSP.ramp(in: range, count: count)
}

public func ramp(in range: ClosedRange<Double>, by: Double) -> [Double] {
	vDSP.ramp(withInitialValue: range.lowerBound, increment: by, count: Int((range.upperBound - range.lowerBound)/by) + 1)
}

func sleep(_ δt: Physical) {
	if δt ~ 1.s {
		usleep(useconds_t((δt → .microseconds).value))
	}
}
