import Foundation

public indirect enum KindOfQuantity {
	case ratio(denominator: Physical)
	case decibel(reference: Physical, symbol: String)
	case standardDecibel(reference: DBReference)
	case difference
}

extension Physical {
	public var isDifference: Bool {
		if let kind = kindOfQuantity,
		   case .difference = kind {
			return true
		}
		
		return false
	}
	
	public var difference: Physical {
		var out = self
		out.kindOfQuantity = .difference
		
		return out
	}
}
