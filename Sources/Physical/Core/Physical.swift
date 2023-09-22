import Foundation

public struct Physical: Collection {
	public var isNotAThing = false
	
	public var value: Double = 0
	public var values: [Double]?
	public var sigfigs: Int = 16 // ← 0, infinity or an optional?
	internal var standardDeviationRaw: Double = 0
	
	internal var invertSuffixes = false
	public var units: DimensionDictionary = [:]
	
	public var errorStack: [String] = []
	
	// EVERYTHING BELOW THIS LINE IS (MORE) EXPERIMENTAL:
	
	//  if uncertainty, std dev, variance, sigfigs set by hand then this should be considered authoritative and marked by as such somehow
	
	public var tags: [String : TieredNumber] = [:]
	
	public var range: (low: Double, high: Double)?
	public var uncertainty: Double?
	public var metadata = Metadata()
	public var kindOfQuantity: KindOfQuantity?
//	public var vars: [Variable<Value>] = []
	
	public typealias ValuesType = [Physical]
	public typealias Index = ValuesType.Index
	public typealias Element = ValuesType.Element
	
	public var TEST_value: ValueType = .real(0)
	public var closedRange: ClosedRange<Double> = 0...0
}

public typealias CoreValueType = Double // ← just an idea

public enum LogarithmicType {
	case base2, base10, natural
}

public enum ValueType {
	case real(Double)
	case complex(Double, Double)
}

