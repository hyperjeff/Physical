public extension Physical {
	/*var globalPrecision: Int? {
		get {
			Physical.GlobalPrecision.shared.sigfigs
		}
		
		set(newSigFigs) {
			Physical.GlobalPrecision.shared.sigfigs = newSigFigs
		}
	}*/
	
	struct Globals {
		static public var shared = Physical.Globals()
		
		public var sigfigs: Int?
	}
}
