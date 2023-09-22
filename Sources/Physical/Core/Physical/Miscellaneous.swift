public var objectCount = 0

extension Physical {
	public var tag: String {
		get {
			tags.map { "\($0)" }.joined(separator: ", ")
		}
		
		set {
			tags[newValue] = .integer(1)
		}
	}
	
	public var significantValue: Double {
		value.toSigfigs(sigfigs)
	}
	
	public func objectLog(_ x: String = "") {
		objectCount += 1
//		print("object count (\(x)): \(objectCount)")
	}
	
}
