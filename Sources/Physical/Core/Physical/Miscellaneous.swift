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
	
}
