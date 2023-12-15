public extension Physical {
	var isAThing: Bool {
		!isNotAThing
	}
	
	static var notAThing: Physical {
		var nothing = Physical()
		nothing.value = .nan
		nothing.sigfigs = 0
		nothing.isNotAThing = true
		
		return nothing
	}
	
	static func notAThing(logging: String, elements: [Physical] = []) -> Physical {
		var out: Physical = .notAThing
		
		out.errorStack.append(logging)
		
		for element in elements {
			for error in element.errorStack {
				if !out.errorStack.contains(error) {
					out.errorStack.insert(error, at: 0)
				}
			}
		}
		
		return out
	}

}
