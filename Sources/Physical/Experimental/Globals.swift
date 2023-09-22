import Foundation

public extension Physical {
	
	class Globals {
		static public let shared = Physical.Globals()
		
		var numberFormatter = NumberFormatter()
		
		/// Setting this to true adds radians and steradians as fundamental units in an Extended SI unit system. For compatibility with common usage, this is `false` by default, but will hopefully change to true in the future.
		public var extendedSI = false
		
		/// This setting will override sigfig information universally and should only be used for testing or demonstration purposes. To gain access to the full (but ficticious) value of a quantity, use its `value`, otherwise we encourage you to take the time to set up variables with the appropriate level of experimental accuracy.
		public var sigfigs: Int?
		
		init() {
			numberFormatter.numberStyle = .scientific // ← why does this seem to not be sufficient?
			numberFormatter.exponentSymbol = "e"
		}
	}
}
