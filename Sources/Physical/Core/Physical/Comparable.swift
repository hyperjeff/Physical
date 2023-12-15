import Foundation

extension Physical: Comparable {
	
	public static func < (lefty: Physical, righty: Physical) -> Bool {
		if lefty.isNotAThing || righty.isNotAThing {
			return false
		}
		
		var left = lefty
		var right = righty
		
		if left.isDifference ⊻ right.isDifference {
			func diffCheck(_ a: Physical, _ b: inout Physical) {
				if a.isDifference,
				   let unit = b.uniqueDimension,
				   unit.hasNonZeroOffset {
					b.kindOfQuantity = .difference
				}
			}
			
			diffCheck(left, &right)
			diffCheck(right, &left)
		}
		
		if left.hasDBValue {
			left = left.dereferencedValue
		}
		
		if right.hasDBValue {
			right = right.dereferencedValue
		}
		
		if left ~ right {
			if left ⧖ right {
				return left.value < right.value
			}
			else {
				var (lnew, rnew) = (left, right)
				lnew.convertToFundamentalUnits()
				rnew.convertToFundamentalUnits()
				
				return lnew.value < rnew.value
			}
		}
		
		return false
	}
	
	public static func <= (left: Physical, right: Physical) -> Bool {
		if left.isNotAThing || right.isNotAThing {
			return false
		}
		
		if left ~ right {
			if left ⧖ right {
				return left.value <= right.value
			}
			else {
				var (lnew, rnew) = (left, right)
				lnew.convertToFundamentalUnits()
				rnew.convertToFundamentalUnits()
				
				return lnew.value <= rnew.value
			}
		}
		
		return false
	}
	
	public static func > (left: Physical, right: Physical) -> Bool {
		right < left
	}
}
