extension Physical {
	public static postfix func / (left: Physical) -> Physical {
		var out = left
		out.invertSuffixes = true
		return out
	}
	
	var per: Physical {
		var out = self
		out.invertSuffixes = true
		return out
	}
}
