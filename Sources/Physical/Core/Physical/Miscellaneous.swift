import Foundation

public var objectCount = 0

public extension Physical {
	var tag: String {
		get {
			tags.map { "\($0)" }.joined(separator: ", ")
		}
		
		set {
			tags[newValue] = .integer(1)
		}
	}
	
	var significantValue: Double {
		value.toSigfigs(sigfigs)
	}
	
	var uniqueDimension: Dimension? {
		if units.count == 1, let first = units.first {
			return first.value.unit
		}
		
		return nil
	}
	
}
