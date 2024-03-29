import Foundation

extension Physical: CustomStringConvertible, CustomDebugStringConvertible {
	public var description: String {
		if isNotAThing {
			return "Not a Thing"
		}
		
		Physical.Globals.shared.numberFormatter.maximumSignificantDigits = Physical.Globals.shared.sigfigs ?? sigfigs
		Physical.Globals.shared.numberFormatter.numberStyle = .scientific
		
		func numberString(_ x: Double) -> String {
			var numericalPart = Physical.Globals.shared.numberFormatter.string(from: NSNumber(value: x))!
			
			if let expString = numericalPart.components(separatedBy: "e").last,
			   let e = Physical.Globals.shared.numberFormatter.number(from: expString)?.intValue {
				if -4 < e && e < 6 {
					Physical.Globals.shared.numberFormatter.numberStyle = .decimal
					numericalPart = Physical.Globals.shared.numberFormatter.string(from: NSNumber(value: x))!
				}
			}
			
			return numericalPart.trimmingCharacters(in: .whitespaces)
		}
		
		var unitPart = ""
		var firstTerm = true
		
		let sortedUnits = units.sorted(by: { a, b in a.key.symbol < b.key.symbol })
		let numeratorUnits = sortedUnits.filter { (_, v) in v.1.isPositive }
		
		func symbol(from unit: Dimension) -> (String, String) {
			var unitSymbol = unit.symbol
			
			if unit.isKind(of: UnitTemperature.self),
			   case KindOfQuantity.difference? = kindOfQuantity {
				unitSymbol = "∆" + unitSymbol
			}
			
			let symbol = unitSymbol.contains("/") ? "(\(unitSymbol))" : "\(unitSymbol)"
			
			return (unitSymbol, symbol)
		}
		
		for (_, (unit, exponent)) in numeratorUnits {
			if !firstTerm {
				unitPart += " "
			}
			else {
				firstTerm = false
			}
			
			let (unitSymbol, symbol) = symbol(from: unit)
			
			switch exponent {
				case let .integer(e):
					switch e {
						case 0: break
						case 1: unitPart += "\(unitSymbol)"
						default: unitPart += symbol + e.drawnExponent
					}
					
				case .fraction(_, _):
					unitPart += symbol + "^(\(exponent))"
					
				case .real(_):
					let expString = "\(exponent)"
					
					if expString != "1" {
						unitPart += symbol + "^\(exponent)"
					}
					else {
						unitPart += symbol
					}
			}
		}
		
		var alreadyDrawnDivisor = false
		firstTerm = true
		
		for (_, (unit, exponent)) in sortedUnits where !exponent.isPositive {
//			if unit.isKind(of: UnitAngle.self) {
//				continue
//			}
//			else if unit.isKind(of: UnitAngularSpeed.self) {
//				// There may be a scale change needed -- so perhaps this has to be handled elsewhere?
//			}
			
			if !alreadyDrawnDivisor {
				unitPart += " / "
				alreadyDrawnDivisor = true
			}
			
			if !firstTerm {
				unitPart += " "
			}
			else {
				firstTerm = false
			}
			
			let (unitSymbol, symbol) = symbol(from: unit)
			
			switch exponent {
				case let .integer(e):
					switch e {
						case -1: unitPart += "\(unitSymbol)"
						default: unitPart += symbol + abs(e).drawnExponent
					}
					
				case .fraction(_, _):
					unitPart += symbol + "^(\(abs(exponent)))"
					
				case .real(_):
					let expString = "\(abs(exponent))"
					
					if expString == "1" {
						unitPart += symbol
					}
					else {
						unitPart += symbol + "^\(expString)"
					}
			}
		}
		
		// FIXME: This ↓ only activates for pure dB constants, but should really mix with other units
		
		if hasDBValue {
			if case let KindOfQuantity.standardDecibel(reference: ref)? = kindOfQuantity {
				unitPart = "dB\(ref.rawValue)"
			}
			else if case let KindOfQuantity.decibel(reference: ref, symbol: symbol)? = kindOfQuantity {
				unitPart = "dB \(symbol.isEmpty ? "(\(ref))" : symbol)"
			}
		}
		
		if let values = values {
			let numbersString = "[\(values.map({ numberString($0) }).joined(separator: ", "))]"
			return "\(numbersString) \(unitPart)".trimmingCharacters(in: .whitespaces)
		}
		else {
			return "\(numberString(value)) \(unitPart)".trimmingCharacters(in: .whitespaces)
		}
	}
	
	public var debugDescription: String { description }
	
	public var dimensionalDescription: String {
		var out: [String] = []
		
		let basicUnits = withBasicUnits.units
		
		for δ in fundamentalSIDimensions {
			let λ = basicUnits.keys.filter({ $0.isKind(of: δ.self) })
			
			if λ.count == 1,
			   let φ = λ.first,
			   let ε = basicUnits[φ]?.exponent {
				switch ε {
					case let .integer(i):
						out.append("\(φ.dimensionSymbol)\(i.drawnExponentGeneral)")
						
					case let .real(r):
						out.append("\(φ.dimensionSymbol)^\(r)")
						
					case let .fraction(a, b):
						out.append("\(φ.dimensionSymbol)^(\(a)/\(b))")
				}
			}
		}
		
		return out.joined(separator: " ")
	}
	
	public var errorStackDescription: String {
		var out: [String] = []
		
		for (line, error) in errorStack.enumerated() {
			out.append("\(line + 1): \(error)")
		}
		
		return out.joined(separator: "\n")
	}
	
	public var unitDescription: String {
		func snippingFirstItem(separatedBy s: String) -> String {
			description.components(separatedBy: s)[1...].joined(separator: s).trimmingCharacters(in: .whitespaces)
		}
		
		return snippingFirstItem(separatedBy: isArray ? "]" : " ")
	}
	
	public var tagDescription: String {
		var unitPart = ""
		var firstTerm = true
		
		let numeratorUnits = tags.filter { (_, v) in v.isPositive }
		
		for (tag, exponent) in numeratorUnits {
			if !firstTerm {
				unitPart += " "
			}
			else {
				firstTerm = false
			}
			
			switch exponent {
				case let .integer(e):
					switch e {
						case 0: break
						case 1: unitPart += tag
						default: unitPart += tag + e.drawnExponent
					}
				case .fraction(_, _):
					unitPart += tag + "^(\(exponent))"
					
				case .real(_):
					let expString = "\(exponent)"
					if expString != "1" {
						unitPart += tag + "^\(exponent)"
					}
					else {
						unitPart += tag
					}
			}
		}
		
		var alreadyDrawnDivisor = false
		firstTerm = true
		
		for (tag, exponent) in tags where !exponent.isPositive {
			if !alreadyDrawnDivisor {
				unitPart += " / "
				alreadyDrawnDivisor = true
			}
			
			if !firstTerm {
				unitPart += " "
			}
			else {
				firstTerm = false
			}
			
			switch exponent {
				case let .integer(e):
					switch e {
						case -1: unitPart += tag
						default: unitPart += tag + abs(e).drawnExponent
					}
					
				case .fraction(_, _):
					unitPart += tag + "^(\(abs(exponent)))"
					
				case .real(_):
					let expString = "\(abs(exponent))"
					
					if expString == "1" {
						unitPart += tag
					}
					else {
						unitPart += tag + "^\(expString)"
					}
			}
		}
		
		let description = unitPart.trimmingCharacters(in: .whitespaces)
		
		return description.isEmpty ? "" : "~ " + description
	}
}
