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
	
	// more experimental stuff here:
	
	public var tags: [String : TieredNumber] = [:]
	public var metadata = Metadata()
	public var kindOfQuantity: KindOfQuantity?
	
	// for Collection
	
	public typealias ValuesType = [Physical]
	public typealias Index = ValuesType.Index
	public typealias Element = ValuesType.Element
}
