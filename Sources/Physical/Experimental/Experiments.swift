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

extension ClosedRange where Bound == Double {
	public func by(_ stepSize: Double) -> [Double] {
		Array(stride(from: lowerBound, through: upperBound, by: stepSize))
	}
	
//	public func by(_ stepThing: Physical) -> Physical {
//		Physical(values: self.by(stepThing.value), units: stepThing.units, sigfigs: stepThing.sigfigs)
//	}
}

public func ramp(in range: ClosedRange<Double>, count: Int) -> [Double] {
	vDSP.ramp(in: range, count: count)
}

public func ramp(in range: ClosedRange<Double>, by: Double) -> [Double] {
	vDSP.ramp(withInitialValue: range.lowerBound, increment: by, count: Int((range.upperBound - range.lowerBound)/by) + 1)
}

/*
extension Physical {
	public func by(_ stepThing: Physical) -> Physical {
		guard let vals = values else { return .notAThing }
		
		let
		
		Physical(values: , units: <#T##DimensionDictionary#>, sigfigs: <#T##Int#>)
	}
}
*/
