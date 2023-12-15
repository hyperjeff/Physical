public extension Physical {
	enum SpecialPhysicalSymbols {
		/// fineStructure
		case α
		/// fineStructure
		case alpha
		/// lightSpeed
		case c
		/// elementaryCharge
		case e
		/// vacuumElectricPermittivity
		case ε
		/// vacuumElectricPermittivity
		case epsilon
		/// gravitation
		case G
		/// surfaceGravity
		case g
		/// planck
		case h
		/// reducedPlanck
		case hbar
		/// boltzmann
		case kB
		/// mass
		case me
		/// mass
		case mp
		/// vacuumMagneticPermeability
		case mu
		/// vacuumMagneticPermeability
		case μ
		/// avogadro
		case N
		/// rydberg
		case R
		/// stefanBoltzmann
		case sigma
		/// stefanBoltzmann
		case σ
		/// vacuumImpedance
		case Z
	}
	
	static func standardSymbol(_ symbol: SpecialPhysicalSymbols) -> Physical {
		switch symbol {
			case .α, .alpha: Physical.Constants.fineStructure
			case .c: Physical.Constants.lightSpeed
			case .e: Physical.Constants.elementaryCharge
			case .ε, .epsilon: Physical.Constants.vacuumElectricPermittivity
			case .G: Physical.Constants.gravitation
			case .g: Physical.Constants.Earth.surfaceGravity
			case .h: Physical.Constants.planck
			case .hbar: Physical.Constants.reducedPlanck
			case .kB: Physical.Constants.boltzmann
			case .me: Physical.Constants.Particle.Electron.mass
			case .mp: Physical.Constants.Particle.Proton.mass
			case .mu, .μ: Physical.Constants.vacuumMagneticPermeability
			case .N: Physical.Constants.avogadro
			case .R: Physical.Constants.rydberg
			case .sigma, .σ: Physical.Constants.stefanBoltzmann
			case .Z: Physical.Constants.vacuumImpedance
//			case "ke": Constants.coulomb ← add!
		}
	}
	
	static func standardSymbols(_ symbols: (SpecialPhysicalSymbols, SpecialPhysicalSymbols)) -> (Physical, Physical) {
		(standardSymbol(symbols.0), standardSymbol(symbols.1))
	}
	static func standardSymbols(_ symbols: (SpecialPhysicalSymbols, SpecialPhysicalSymbols, SpecialPhysicalSymbols)) -> (Physical, Physical, Physical) {
		(standardSymbol(symbols.0), standardSymbol(symbols.1), standardSymbol(symbols.2))
	}
	static func standardSymbols(_ symbols: (SpecialPhysicalSymbols, SpecialPhysicalSymbols, SpecialPhysicalSymbols, SpecialPhysicalSymbols)) -> (Physical, Physical, Physical, Physical) {
		(standardSymbol(symbols.0), standardSymbol(symbols.1), standardSymbol(symbols.2), standardSymbol(symbols.3))
	}
	static func standardSymbols(_ symbols: (SpecialPhysicalSymbols, SpecialPhysicalSymbols, SpecialPhysicalSymbols, SpecialPhysicalSymbols, SpecialPhysicalSymbols)) -> (Physical, Physical, Physical, Physical, Physical) {
		(standardSymbol(symbols.0), standardSymbol(symbols.1), standardSymbol(symbols.2), standardSymbol(symbols.3), standardSymbol(symbols.4))
	}
	static func standardSymbols(_ symbols: (SpecialPhysicalSymbols, SpecialPhysicalSymbols, SpecialPhysicalSymbols, SpecialPhysicalSymbols, SpecialPhysicalSymbols, SpecialPhysicalSymbols)) -> (Physical, Physical, Physical, Physical, Physical, Physical) {
		(standardSymbol(symbols.0), standardSymbol(symbols.1), standardSymbol(symbols.2), standardSymbol(symbols.3), standardSymbol(symbols.4), standardSymbol(symbols.5))
	}
	
	struct Constants {
		public struct Particle {
			public struct Electron {
				public static let mass = 9.109_383_7015e-31.kg
				public static let charge = -1.602_176_634e-19.coulombs
				public static let classicalRadius = 2.817_940_3262e-15.m
			}
			
			public struct Positron {
				public static let mass = 9.109_383_7015e-31.kg
				public static let charge = 1.602_176_634e-19.coulombs
			}
			
			public struct Proton {
				public static let mass = 1.672_621_923_69e-27.kg
				public static let charge = 1.602_176_634e-19.coulombs
				public static let chargeRadius = 0.8414e-15.m
				public static let meanLifetimeLowerLimit = 2.1e29.years
			}
			
			public struct Neutron {
				public static let mass = 1.674_927_498_04e-27.kg
				public static let charge = 0.coulombs
			}
			
			public struct Charge {
				public static let elementary = 1.602_176_634e-19.coulombs
			}
		}
		
		public struct Atom {
			public struct hydrogen {
				public static let mass = 1.008.g/.moles
			}
			public struct helium {
				public static let mass = 4.0026.g/.moles
			}
			public struct lithium {
				public static let mass = 6.94.g/.moles
			}
			public struct beryllium {
				public static let mass = 9.0122.g/.moles
			}
			public struct boron {
				public static let mass = 10.81.g/.moles
			}
			public struct carbon {
				public static let mass = 12.011.g/.moles
			}
			public struct nitrogen {
				public static let mass = 14.007.g/.moles
			}
			public struct oxygen {
				public static let mass = 15.999.g/.moles
			}
			public struct fluorine {
				public static let mass = 18.998.g/.moles
			}
			public struct neon {
				public static let mass = 20.180.g/.moles
			}
			public struct sodium {
				public static let mass = 22.990.g/.moles
			}
			public struct magnesium {
				public static let mass = 24.305.g/.moles
			}
			public struct aluminium {
				public static let mass = 26.982.g/.moles
			}
			public struct silicon {
				public static let mass = 28.085.g/.moles
			}
			public struct phosphorus {
				public static let mass = 30.974.g/.moles
			}
			public struct sulfur {
				public static let mass = 32.06.g/.moles
			}
			public struct chlorine {
				public static let mass = 35.45.g/.moles
			}
			public struct argon {
				public static let mass = 39.95.g/.moles
			}
			public struct potassium {
				public static let mass = 39.098.g/.moles
			}
			public struct calcium {
				public static let mass = 40.078.g/.moles
			}
			public struct scandium {
				public static let mass = 44.956.g/.moles
			}
			public struct titanium {
				public static let mass = 47.867.g/.moles
			}
			public struct vanadium {
				public static let mass = 50.942.g/.moles
			}
			public struct chromium {
				public static let mass = 51.996.g/.moles
			}
			public struct manganese {
				public static let mass = 54.938.g/.moles
			}
			public struct iron {
				public static let mass = 55.845.g/.moles
			}
			public struct cobalt {
				public static let mass = 58.933.g/.moles
			}
			public struct nickel {
				public static let mass = 58.693.g/.moles
			}
			public struct copper {
				public static let mass = 63.546.g/.moles
			}
			public struct zinc {
				public static let mass = 65.38.g/.moles
			}
			public struct gallium {
				public static let mass = 69.723.g/.moles
			}
			public struct germanium {
				public static let mass = 72.630.g/.moles
			}
			public struct arsenic {
				public static let mass = 74.922.g/.moles
			}
			public struct selenium {
				public static let mass = 78.971.g/.moles
			}
			public struct bromine {
				public static let mass = 79.904.g/.moles
			}
			public struct krypton {
				public static let mass = 83.798.g/.moles
			}
			public struct rubidium {
				public static let mass = 85.468.g/.moles
			}
			public struct strontium {
				public static let mass = 87.62.g/.moles
			}
			public struct yttrium {
				public static let mass = 88.906.g/.moles
			}
			public struct zirconium {
				public static let mass = 91.224.g/.moles
			}
			public struct niobium {
				public static let mass = 92.906.g/.moles
			}
			public struct molybdenum {
				public static let mass = 95.95.g/.moles
			}
			public struct ruthenium {
				public static let mass = 101.07.g/.moles
			}
			public struct rhodium {
				public static let mass = 102.91.g/.moles
			}
			public struct palladium {
				public static let mass = 106.42.g/.moles
			}
			public struct silver {
				public static let mass = 107.87.g/.moles
			}
			public struct cadmium {
				public static let mass = 112.41.g/.moles
			}
			public struct indium {
				public static let mass = 114.82.g/.moles
			}
			public struct tin {
				public static let mass = 118.71.g/.moles
			}
			public struct antimony {
				public static let mass = 121.76.g/.moles
			}
			public struct tellurium {
				public static let mass = 127.60.g/.moles
			}
			public struct iodine {
				public static let mass = 126.90.g/.moles
			}
			public struct xenon {
				public static let mass = 131.29.g/.moles
			}
			public struct caesium {
				public static let mass = 132.91.g/.moles
			}
			public struct barium {
				public static let mass = 137.33.g/.moles
			}
			public struct lanthanum {
				public static let mass = 138.91.g/.moles
			}
			public struct cerium {
				public static let mass = 140.12.g/.moles
			}
			public struct praseodymium {
				public static let mass = 140.91.g/.moles
			}
			public struct neodymium {
				public static let mass = 144.24.g/.moles
			}
			public struct samarium {
				public static let mass = 150.36.g/.moles
			}
			public struct europium {
				public static let mass = 151.96.g/.moles
			}
			public struct gadolinium {
				public static let mass = 157.25.g/.moles
			}
			public struct terbium {
				public static let mass = 158.93.g/.moles
			}
			public struct dysprosium {
				public static let mass = 162.50.g/.moles
			}
			public struct holmium {
				public static let mass = 164.93.g/.moles
			}
			public struct erbium {
				public static let mass = 167.26.g/.moles
			}
			public struct thulium {
				public static let mass = 168.93.g/.moles
			}
			public struct ytterbium {
				public static let mass = 173.05.g/.moles
			}
			public struct lutetium {
				public static let mass = 174.97.g/.moles
			}
			public struct hafnium {
				public static let mass = 178.49.g/.moles
			}
			public struct tantalum {
				public static let mass = 180.95.g/.moles
			}
			public struct tungsten {
				public static let mass = 183.84.g/.moles
			}
			public struct rhenium {
				public static let mass = 186.21.g/.moles
			}
			public struct osmium {
				public static let mass = 190.23.g/.moles
			}
			public struct iridium {
				public static let mass = 192.22.g/.moles
			}
			public struct platinum {
				public static let mass = 195.08.g/.moles
			}
			public struct gold {
				public static let mass = 196.97.g/.moles
			}
			public struct mercury {
				public static let mass = 200.59.g/.moles
			}
			public struct thallium {
				public static let mass = 204.38.g/.moles
			}
			public struct lead {
				public static let mass = 207.2.g/.moles
			}
			public struct bismuth {
				public static let mass = 208.98.g/.moles
			}
			public struct thorium {
				public static let mass = 232.04.g/.moles
			}
			public struct protactinium {
				public static let mass = 231.04.g/.moles
			}
			public struct uranium {
				public static let mass = 238.03.g/.moles
			}
		}
		
		public struct Earth {
			public struct aphelion {
				public static let distance = 152_100_000.km
				public static let speed = 29.29e3.mps
			}
			
			public struct perihelion {
				public static let distance = 147_095_000.km
				public static let speed = 30.29e3.mps
				public static let longitude = 102.94719°
			}
			
			public static let semimajorAxis = 149_598_023.km
			public static let eccentricity = 0.016_7086.constant
			public static let orbitalPeriod = 31_558_149.7635.s
			public static let averageOrbitalSpeed = 29.78.km.s(-1)
			public static let meanAnomaly = 358.617°
			public static let inclinationToSunsEquator = 7.155°
			public static let inclinationToInvariablePlane = 1.578_69°
			public static let inclinationToJ2000Ecliptic = 0.000_05°
			public static let longitudeOfAscendingNodeToJ2000Ecliptic = -11.260_64°
			//				public static let timeOfPerihelion =
			public static let argumentOfPerihelion = 114.207_83°
			public static let meanRadius = 6371.0.km
			public static let equitorialRadius = 6_378.1366.km
			public static let polarRadius = 6_356.8.km
			public static let flatteningFactor = 0.003_352_8197.constant
			public static let equatorialCircumference = 40_075.017.km
			public static let meridonalCircumference = 40_007.86.km
			public static let volume = 1.083_21e12.cubicKilometers
			public static let mass = 5.97237e24.kg
			public static let meanDensity = 5.514.g.cm(-3)
			public static let surfaceGravity = 9.806_65.m.s(-2)
			public static let momentOfInertiaFactor = 0.3307.constant
			public static let escapeVelocity = 11.186.km.s(-1)
			public static let siderealRotationSpeed = 86_164.1.s
			public static let equatorialRotationVelocity = 0.4651.km.s(-1)
			public static let axialTilt = 23.439_2811°
			public static let albedoGeometric = 0.367.constant
			public static let albedoBond = 0.306.constant
			public static let generalPrecession = 5028.796_195.arcMinutes // in longitude per julian century at standard epoch 2000
			//				public static let obliquityOfEliptic = // 23° 26' 21.406" at standard epoch 2000
			public static let constantOfNutation = 9.205_2331.arcMinutes // at standard epoch 2000
			
			// atmosphere:
			public static let standardAtmosphere = 101_325.pascals
			public static let surfacePressure = 101.325.kilopascals
			public static let molecularWeightDryAir = 28.946.g.moles(-1)
			
			public struct SurfaceArea {
				public static let total = 510_072_000.squareKilometers
				public static let land = 148_940_000.squareKilometers
				public static let water = 361_132_000.squareKilometers
			}
			
			public struct SurfaceTemperature {
				public static let min = 184.K
				public static let mean = 287.16.K
				public static let max = 330.K
			}
		}
		
		public struct Astronomic {
//			public static let hubbleConstant = 70.1e-6.km.s(-1).parsecs(-1)
//			public static let solarLuminosity = 3.939e26.webers // specific to earth?
			public static let hubbleConstant = (70.1e-6 ± 0.019e-6).kilometers.s(-1).parsecs(-1)
			public static let solarLuminosity = (3.939e26 ± 0.1%).webers // specific to earth?
			
			public struct Sun {
				public static let mass = 1.98855e30.kg
				public static let heliocentricGravitationalConstant = 1.327_2440e20.m(3).s(-2)
			}
			
			public struct Moon {
				public static let mass = 7.342e22.kg
				public static let surfaceGravity = 1.62.metersPerSecondSquared // (0.1654 g)[4]
				public static let meanRadius = 1737.4.km
				public static let equatorialRadius = 1736.0.km.sigfigs(5)
				public static let polarRadius = 1736.0.km.sigfigs(5)
				public static let perigee = 362600.km // (356400–370400 km)
				public static let apogee = 405400.km // 404000–406700 km)
				/*
				public static let Semi-major axis	384399 km  (1.28 ls, 0.00257 AU)[1]
				public static let Eccentricity = 0.0549[1]
				public static let Orbital period = 27.321661 d
				public static let Synodic period = 29.530589 d
				public static let Average orbital speed = 1.022 km/s
				public static let Inclination = 5.145° to the ecliptic[2][a]
				public static let Flattening = 0.0012[4]
				public static let Circumference = 10921 km  (equatorial)
				public static let Surface area = 3.793×107 km2
				public static let Volume = 2.1958×1010 km3
				public static let Mean density = 3.344 g/cm3[1][4]
				public static let Moment of inertia factor	0.3929±0.0009[7]
				public static let Escape velocity	2.38 km/s (8600 km/h; 5300 mph)
				public static let Sidereal rotation period	27.321661 d  (synchronous)
				public static let Equatorial rotation velocity	4.627 m/s
				public static let Axial tilt 1.5424° to ecliptic.  6.687° to orbit plane[2].  24° to Earth's equator [8]
				North pole right ascension 17h 47m 26s. 266.86°[9]
				North pole declination	65.64°[9]
				Albedo	0.136[10]
				Surface temp.	min	mean	max
				Equator	100 K	250 K	390 K. 85°N 		150 K	230 K[11]
				Apparent magnitude −2.5 to −12.9[c]. −12.74  (mean full moon)[4]
				Angular diameter	29.3 to 34.1 arcminutes[4][d]
				Atmosphere[12]
				Surface pressure
				10−7 Pa (1 picobar)  (day)
				10−10 Pa (1 femtobar) */
			}
			
			public struct Planets { // these need to be generated
				public struct Mercury {
					
				}
				public struct Venus {
					
				}
				public struct Earth {
					// how to handle this?
				}
				public struct Mars {
					
				}
				public struct Jupiter {
					public static let symbol = "♃"
					public static let mass = 1.8982e27.kg
					public static let meanRadius = 69_911.km
					public static let equatorialRadius = 71_492.km
					public static let polarRadius = 66_854.km
				}
				public struct Saturn {
					
				}
				public struct Uranus {
					
				}
				public struct Neptune {
					
				}
			}
		}
		
		public static let avogadro = 6.022_140_76e23/.moles
		public static let boltzmann = 1.380_649e-23.J/.kelvin
		public static let faraday = 96_485.332_12.coulombs/.moles
		public static let molarGas = 8.314_462_618.J/.moles.kelvin
		public static let molarMass = 0.999_999_999_65e-3.kg/.moles
		public static let carbon12MolarMass = 11.999_999_9958e-3.kg/.moles
		public static let molarPlanck = 3.990_312_712e-10.J/.hertz.moles
		
		public static let lightSpeed = 299_792_458.m/.s
		public static let gravitation = 6.674_30e-11.m(3)/.kg.s(2)
		
		public static let planck = 6.626_070_15e-34.J.s
		public static let reducedPlanck = 1.054_571_817e-34.J.s.perRadian
		public static let fineStructure = 7.297_352_5693e-3.constant // 0.007_297_352_562_781_278 ish
		public static let inverseFineStructure = 137.035_999_084.constant
		public static let rydberg = 10_973_731.568_160/.m
		public static let hyperfineTransitionFrequency = 9_192_631_770.Hz
		public static let bohrMagneton = 9.276_010_0783e-24.J/.teslas
		public static let nuclearMagneton = 5.050_783_7461e-27.J/.teslas
		public static let bohrRadius = 6.291_772_109_03e-11.m
		public static let bjerrumWaterLength = 7.1.angstroms
		public static let elementaryCharge = 1.602_176_634e-19.coulombs
		
		public static let vacuumElectricPermittivity = 8.854_187_8128e-12.F/.m
//		public static let vacuumMagneticPermeability = 1.256_637_062_12e-6.N/.amperes(2).radians
		public static let vacuumMagneticPermeability = 1.256_637_062_12e-6.henries/.m
		public static let vacuumImpedance = 376.730_313_668.ohms
		public static let josephson = 483_597.848_4e9.Hz/.volts
		public static let vonKlitzing = 25_812.807_45.ohms
		public static let quantumConductance = 7.748_091_729e-5.siemens
		public static let inverseQuantumConductance = 12_906.403_72.ohms
		public static let magneticFluxQuantum = 2.067_833_848e-15.webers
		
		public static let electronGFactor = -2.002_319_304_362_56.constant
	//	public static let fermiCoupling = 1.166_3787e-5.
		public static let hartreeEnergy = 4.359_744_722_2071e-18.J
		public static let circulationQuantum = 3.636_947_5516e-4.m(2)/.s
		public static let thomsonCrossSection = 6.652_458_7321e-29.m(2)
		public static let wZMassRatio = 0.881_53.constant
		public static let weakMixingAngle = 0.222_90.constant
		public static let atomicMass = 1.660_539_066_60e-27.kg
		public static let stefanBoltzmann = 5.670_374_419e-8.W/.m(2).kelvin(4)
		public static let firstRadiation = 3.741_771_852e-16.W.m(2)
		public static let secondRadiation = 1.438_776_877e-2.m.kelvin
		public static let firstRadiationSpectralRadiance = 1.191_042_972e-16.W.m(2).steradians
		public static let wienDisplacement = 2.897_771_955e-3.m.kelvin
		public static let wienFrequency = 5.878_925_757e10.Hz/.kelvin
		public static let wienEntropy = 3.002_916_077e-3.m.kelvin
	}
}


/*
https://physics.nist.gov/cuu/Constants/Table/allascii.txt

Fundamental Physical Constants --- Complete Listing
2018 CODATA adjustment


From:  http://physics.nist.gov/constants



Quantity                                                       Value                 Uncertainty           Unit
-----------------------------------------------------------------------------------------------------------------------------
alpha particle-electron mass ratio                          7294.299 541 42          0.000 000 24
alpha particle mass                                         6.644 657 3357 e-27      0.000 000 0020 e-27      kg
alpha particle mass energy equivalent                       5.971 920 1914 e-10      0.000 000 0018 e-10      J
alpha particle mass energy equivalent in MeV                3727.379 4066            0.000 0011               MeV
alpha particle mass in u                                    4.001 506 179 127        0.000 000 000 063        u
alpha particle molar mass                                   4.001 506 1777 e-3       0.000 000 0012 e-3       kg mol^-1
alpha particle-proton mass ratio                            3.972 599 690 09         0.000 000 000 22
alpha particle relative atomic mass                         4.001 506 179 127        0.000 000 000 063
Angstrom star                                               1.000 014 95 e-10        0.000 000 90 e-10        m
atomic mass constant                                        1.660 539 066 60 e-27    0.000 000 000 50 e-27    kg
atomic mass constant energy equivalent                      1.492 418 085 60 e-10    0.000 000 000 45 e-10    J
atomic mass constant energy equivalent in MeV               931.494 102 42           0.000 000 28             MeV
atomic mass unit-electron volt relationship                 9.314 941 0242 e8        0.000 000 0028 e8        eV
atomic mass unit-hartree relationship                       3.423 177 6874 e7        0.000 000 0010 e7        E_h
atomic mass unit-hertz relationship                         2.252 342 718 71 e23     0.000 000 000 68 e23     Hz
atomic mass unit-inverse meter relationship                 7.513 006 6104 e14       0.000 000 0023 e14       m^-1
atomic mass unit-joule relationship                         1.492 418 085 60 e-10    0.000 000 000 45 e-10    J
atomic mass unit-kelvin relationship                        1.080 954 019 16 e13     0.000 000 000 33 e13     K
atomic mass unit-kilogram relationship                      1.660 539 066 60 e-27    0.000 000 000 50 e-27    kg
atomic unit of 1st hyperpolarizability                      3.206 361 3061 e-53      0.000 000 0015 e-53      C^3 m^3 J^-2
atomic unit of 2nd hyperpolarizability                      6.235 379 9905 e-65      0.000 000 0038 e-65      C^4 m^4 J^-3
atomic unit of action                                       1.054 571 817... e-34    (exact)                  J s
atomic unit of charge                                       1.602 176 634 e-19       (exact)                  C
atomic unit of charge density                               1.081 202 384 57 e12     0.000 000 000 49 e12     C m^-3
atomic unit of current                                      6.623 618 237 510 e-3    0.000 000 000 013 e-3    A
atomic unit of electric dipole mom.                         8.478 353 6255 e-30      0.000 000 0013 e-30      C m
atomic unit of electric field                               5.142 206 747 63 e11     0.000 000 000 78 e11     V m^-1
atomic unit of electric field gradient                      9.717 362 4292 e21       0.000 000 0029 e21       V m^-2
atomic unit of electric polarizability                      1.648 777 274 36 e-41    0.000 000 000 50 e-41    C^2 m^2 J^-1
atomic unit of electric potential                           27.211 386 245 988       0.000 000 000 053        V
atomic unit of electric quadrupole mom.                     4.486 551 5246 e-40      0.000 000 0014 e-40      C m^2
atomic unit of energy                                       4.359 744 722 2071 e-18  0.000 000 000 0085 e-18  J
atomic unit of force                                        8.238 723 4983 e-8       0.000 000 0012 e-8       N
atomic unit of length                                       5.291 772 109 03 e-11    0.000 000 000 80 e-11    m
atomic unit of mag. dipole mom.                             1.854 802 015 66 e-23    0.000 000 000 56 e-23    J T^-1
atomic unit of mag. flux density                            2.350 517 567 58 e5      0.000 000 000 71 e5      T
atomic unit of magnetizability                              7.891 036 6008 e-29      0.000 000 0048 e-29      J T^-2
atomic unit of mass                                         9.109 383 7015 e-31      0.000 000 0028 e-31      kg
atomic unit of momentum                                     1.992 851 914 10 e-24    0.000 000 000 30 e-24    kg m s^-1
atomic unit of permittivity                                 1.112 650 055 45 e-10    0.000 000 000 17 e-10    F m^-1
atomic unit of time                                         2.418 884 326 5857 e-17  0.000 000 000 0047 e-17  s
atomic unit of velocity                                     2.187 691 263 64 e6      0.000 000 000 33 e6      m s^-1
Avogadro constant                                           6.022 140 76 e23         (exact)                  mol^-1
Bohr magneton                                               9.274 010 0783 e-24      0.000 000 0028 e-24      J T^-1
Bohr magneton in eV/T                                       5.788 381 8060 e-5       0.000 000 0017 e-5       eV T^-1
Bohr magneton in Hz/T                                       1.399 624 493 61 e10     0.000 000 000 42 e10     Hz T^-1
Bohr magneton in inverse meter per tesla                    46.686 447 783           0.000 000 014            m^-1 T^-1
Bohr magneton in K/T                                        0.671 713 815 63         0.000 000 000 20         K T^-1
Bohr radius                                                 5.291 772 109 03 e-11    0.000 000 000 80 e-11    m
Boltzmann constant                                          1.380 649 e-23           (exact)                  J K^-1
Boltzmann constant in eV/K                                  8.617 333 262... e-5     (exact)                  eV K^-1
Boltzmann constant in Hz/K                                  2.083 661 912... e10     (exact)                  Hz K^-1
Boltzmann constant in inverse meter per kelvin              69.503 480 04...         (exact)                  m^-1 K^-1
characteristic impedance of vacuum                          376.730 313 668          0.000 000 057            ohm
classical electron radius                                   2.817 940 3262 e-15      0.000 000 0013 e-15      m
Compton wavelength                                          2.426 310 238 67 e-12    0.000 000 000 73 e-12    m
conductance quantum                                         7.748 091 729... e-5     (exact)                  S
conventional value of ampere-90                             1.000 000 088 87...      (exact)                  A
conventional value of coulomb-90                            1.000 000 088 87...      (exact)                  C
conventional value of farad-90                              0.999 999 982 20...      (exact)                  F
conventional value of henry-90                              1.000 000 017 79...      (exact)                  H
conventional value of Josephson constant                    483 597.9 e9             (exact)                  Hz V^-1
conventional value of ohm-90                                1.000 000 017 79...      (exact)                  ohm
conventional value of volt-90                               1.000 000 106 66...      (exact)                  V
conventional value of von Klitzing constant                 25 812.807               (exact)                  ohm
conventional value of watt-90                               1.000 000 195 53...      (exact)                  W
Copper x unit                                               1.002 076 97 e-13        0.000 000 28 e-13        m
deuteron-electron mag. mom. ratio                           -4.664 345 551 e-4       0.000 000 012 e-4
deuteron-electron mass ratio                                3670.482 967 88          0.000 000 13
deuteron g factor                                           0.857 438 2338           0.000 000 0022
deuteron mag. mom.                                          4.330 735 094 e-27       0.000 000 011 e-27       J T^-1
deuteron mag. mom. to Bohr magneton ratio                   4.669 754 570 e-4        0.000 000 012 e-4
deuteron mag. mom. to nuclear magneton ratio                0.857 438 2338           0.000 000 0022
deuteron mass                                               3.343 583 7724 e-27      0.000 000 0010 e-27      kg
deuteron mass energy equivalent                             3.005 063 231 02 e-10    0.000 000 000 91 e-10    J
deuteron mass energy equivalent in MeV                      1875.612 942 57          0.000 000 57             MeV
deuteron mass in u                                          2.013 553 212 745        0.000 000 000 040        u
deuteron molar mass                                         2.013 553 212 05 e-3     0.000 000 000 61 e-3     kg mol^-1
deuteron-neutron mag. mom. ratio                            -0.448 206 53            0.000 000 11
deuteron-proton mag. mom. ratio                             0.307 012 209 39         0.000 000 000 79
deuteron-proton mass ratio                                  1.999 007 501 39         0.000 000 000 11
deuteron relative atomic mass                               2.013 553 212 745        0.000 000 000 040
deuteron rms charge radius                                  2.127 99 e-15            0.000 74 e-15            m
electron charge to mass quotient                            -1.758 820 010 76 e11    0.000 000 000 53 e11     C kg^-1
electron-deuteron mag. mom. ratio                           -2143.923 4915           0.000 0056
electron-deuteron mass ratio                                2.724 437 107 462 e-4    0.000 000 000 096 e-4
electron g factor                                           -2.002 319 304 362 56    0.000 000 000 000 35
electron gyromag. ratio                                     1.760 859 630 23 e11     0.000 000 000 53 e11     s^-1 T^-1
electron gyromag. ratio in MHz/T                            28 024.951 4242          0.000 0085               MHz T^-1
electron-helion mass ratio                                  1.819 543 074 573 e-4    0.000 000 000 079 e-4
electron mag. mom.                                          -9.284 764 7043 e-24     0.000 000 0028 e-24      J T^-1
electron mag. mom. anomaly                                  1.159 652 181 28 e-3     0.000 000 000 18 e-3
electron mag. mom. to Bohr magneton ratio                   -1.001 159 652 181 28    0.000 000 000 000 18
electron mag. mom. to nuclear magneton ratio                -1838.281 971 88         0.000 000 11
electron mass                                               9.109 383 7015 e-31      0.000 000 0028 e-31      kg
electron mass energy equivalent                             8.187 105 7769 e-14      0.000 000 0025 e-14      J
electron mass energy equivalent in MeV                      0.510 998 950 00         0.000 000 000 15         MeV
electron mass in u                                          5.485 799 090 65 e-4     0.000 000 000 16 e-4     u
electron molar mass                                         5.485 799 0888 e-7       0.000 000 0017 e-7       kg mol^-1
electron-muon mag. mom. ratio                               206.766 9883             0.000 0046
electron-muon mass ratio                                    4.836 331 69 e-3         0.000 000 11 e-3
electron-neutron mag. mom. ratio                            960.920 50               0.000 23
electron-neutron mass ratio                                 5.438 673 4424 e-4       0.000 000 0026 e-4
electron-proton mag. mom. ratio                             -658.210 687 89          0.000 000 20
electron-proton mass ratio                                  5.446 170 214 87 e-4     0.000 000 000 33 e-4
electron relative atomic mass                               5.485 799 090 65 e-4     0.000 000 000 16 e-4
electron-tau mass ratio                                     2.875 85 e-4             0.000 19 e-4
electron to alpha particle mass ratio                       1.370 933 554 787 e-4    0.000 000 000 045 e-4
electron to shielded helion mag. mom. ratio                 864.058 257              0.000 010
electron to shielded proton mag. mom. ratio                 -658.227 5971            0.000 0072
electron-triton mass ratio                                  1.819 200 062 251 e-4    0.000 000 000 090 e-4
electron volt                                               1.602 176 634 e-19       (exact)                  J
electron volt-atomic mass unit relationship                 1.073 544 102 33 e-9     0.000 000 000 32 e-9     u
electron volt-hartree relationship                          3.674 932 217 5655 e-2   0.000 000 000 0071 e-2   E_h
electron volt-hertz relationship                            2.417 989 242... e14     (exact)                  Hz
electron volt-inverse meter relationship                    8.065 543 937... e5      (exact)                  m^-1
electron volt-joule relationship                            1.602 176 634 e-19       (exact)                  J
electron volt-kelvin relationship                           1.160 451 812... e4      (exact)                  K
electron volt-kilogram relationship                         1.782 661 921... e-36    (exact)                  kg
elementary charge                                           1.602 176 634 e-19       (exact)                  C
elementary charge over h-bar                                1.519 267 447... e15     (exact)                  A J^-1
Faraday constant                                            96 485.332 12...         (exact)                  C mol^-1
Fermi coupling constant                                     1.166 3787 e-5           0.000 0006 e-5           GeV^-2
fine-structure constant                                     7.297 352 5693 e-3       0.000 000 0011 e-3
first radiation constant                                    3.741 771 852... e-16    (exact)                  W m^2
first radiation constant for spectral radiance              1.191 042 972... e-16    (exact)                  W m^2 sr^-1
hartree-atomic mass unit relationship                       2.921 262 322 05 e-8     0.000 000 000 88 e-8     u
hartree-electron volt relationship                          27.211 386 245 988       0.000 000 000 053        eV
Hartree energy                                              4.359 744 722 2071 e-18  0.000 000 000 0085 e-18  J
Hartree energy in eV                                        27.211 386 245 988       0.000 000 000 053        eV
hartree-hertz relationship                                  6.579 683 920 502 e15    0.000 000 000 013 e15    Hz
hartree-inverse meter relationship                          2.194 746 313 6320 e7    0.000 000 000 0043 e7    m^-1
hartree-joule relationship                                  4.359 744 722 2071 e-18  0.000 000 000 0085 e-18  J
hartree-kelvin relationship                                 3.157 750 248 0407 e5    0.000 000 000 0061 e5    K
hartree-kilogram relationship                               4.850 870 209 5432 e-35  0.000 000 000 0094 e-35  kg
helion-electron mass ratio                                  5495.885 280 07          0.000 000 24
helion g factor                                             -4.255 250 615           0.000 000 050
helion mag. mom.                                            -1.074 617 532 e-26      0.000 000 013 e-26       J T^-1
helion mag. mom. to Bohr magneton ratio                     -1.158 740 958 e-3       0.000 000 014 e-3
helion mag. mom. to nuclear magneton ratio                  -2.127 625 307           0.000 000 025
helion mass                                                 5.006 412 7796 e-27      0.000 000 0015 e-27      kg
helion mass energy equivalent                               4.499 539 4125 e-10      0.000 000 0014 e-10      J
helion mass energy equivalent in MeV                        2808.391 607 43          0.000 000 85             MeV
helion mass in u                                            3.014 932 247 175        0.000 000 000 097        u
helion molar mass                                           3.014 932 246 13 e-3     0.000 000 000 91 e-3     kg mol^-1
helion-proton mass ratio                                    2.993 152 671 67         0.000 000 000 13
helion relative atomic mass                                 3.014 932 247 175        0.000 000 000 097
helion shielding shift                                      5.996 743 e-5            0.000 010 e-5
hertz-atomic mass unit relationship                         4.439 821 6652 e-24      0.000 000 0013 e-24      u
hertz-electron volt relationship                            4.135 667 696... e-15    (exact)                  eV
hertz-hartree relationship                                  1.519 829 846 0570 e-16  0.000 000 000 0029 e-16  E_h
hertz-inverse meter relationship                            3.335 640 951... e-9     (exact)                  m^-1
hertz-joule relationship                                    6.626 070 15 e-34        (exact)                  J
hertz-kelvin relationship                                   4.799 243 073... e-11    (exact)                  K
hertz-kilogram relationship                                 7.372 497 323... e-51    (exact)                  kg
hyperfine transition frequency of Cs-133                    9 192 631 770            (exact)                  Hz
inverse fine-structure constant                             137.035 999 084          0.000 000 021
inverse meter-atomic mass unit relationship                 1.331 025 050 10 e-15    0.000 000 000 40 e-15    u
inverse meter-electron volt relationship                    1.239 841 984... e-6     (exact)                  eV
inverse meter-hartree relationship                          4.556 335 252 9120 e-8   0.000 000 000 0088 e-8   E_h
inverse meter-hertz relationship                            299 792 458              (exact)                  Hz
inverse meter-joule relationship                            1.986 445 857... e-25    (exact)                  J
inverse meter-kelvin relationship                           1.438 776 877... e-2     (exact)                  K
inverse meter-kilogram relationship                         2.210 219 094... e-42    (exact)                  kg
inverse of conductance quantum                              12 906.403 72...         (exact)                  ohm
Josephson constant                                          483 597.848 4... e9      (exact)                  Hz V^-1
joule-atomic mass unit relationship                         6.700 535 2565 e9        0.000 000 0020 e9        u
joule-electron volt relationship                            6.241 509 074... e18     (exact)                  eV
joule-hartree relationship                                  2.293 712 278 3963 e17   0.000 000 000 0045 e17   E_h
joule-hertz relationship                                    1.509 190 179... e33     (exact)                  Hz
joule-inverse meter relationship                            5.034 116 567... e24     (exact)                  m^-1
joule-kelvin relationship                                   7.242 970 516... e22     (exact)                  K
joule-kilogram relationship                                 1.112 650 056... e-17    (exact)                  kg
kelvin-atomic mass unit relationship                        9.251 087 3014 e-14      0.000 000 0028 e-14      u
kelvin-electron volt relationship                           8.617 333 262... e-5     (exact)                  eV
kelvin-hartree relationship                                 3.166 811 563 4556 e-6   0.000 000 000 0061 e-6   E_h
kelvin-hertz relationship                                   2.083 661 912... e10     (exact)                  Hz
kelvin-inverse meter relationship                           69.503 480 04...         (exact)                  m^-1
kelvin-joule relationship                                   1.380 649 e-23           (exact)                  J
kelvin-kilogram relationship                                1.536 179 187... e-40    (exact)                  kg
kilogram-atomic mass unit relationship                      6.022 140 7621 e26       0.000 000 0018 e26       u
kilogram-electron volt relationship                         5.609 588 603... e35     (exact)                  eV
kilogram-hartree relationship                               2.061 485 788 7409 e34   0.000 000 000 0040 e34   E_h
kilogram-hertz relationship                                 1.356 392 489... e50     (exact)                  Hz
kilogram-inverse meter relationship                         4.524 438 335... e41     (exact)                  m^-1
kilogram-joule relationship                                 8.987 551 787... e16     (exact)                  J
kilogram-kelvin relationship                                6.509 657 260... e39     (exact)                  K
lattice parameter of silicon                                5.431 020 511 e-10       0.000 000 089 e-10       m
lattice spacing of ideal Si (220)                           1.920 155 716 e-10       0.000 000 032 e-10       m
Loschmidt constant (273.15 K, 100 kPa)                      2.651 645 804... e25     (exact)                  m^-3
Loschmidt constant (273.15 K, 101.325 kPa)                  2.686 780 111... e25     (exact)                  m^-3
luminous efficacy                                           683                      (exact)                  lm W^-1
mag. flux quantum                                           2.067 833 848... e-15    (exact)                  Wb
molar gas constant                                          8.314 462 618...         (exact)                  J mol^-1 K^-1
molar mass constant                                         0.999 999 999 65 e-3     0.000 000 000 30 e-3     kg mol^-1
molar mass of carbon-12                                     11.999 999 9958 e-3      0.000 000 0036 e-3       kg mol^-1
molar Planck constant                                       3.990 312 712... e-10    (exact)                  J Hz^-1 mol^-1
molar volume of ideal gas (273.15 K, 100 kPa)               22.710 954 64... e-3     (exact)                  m^3 mol^-1
molar volume of ideal gas (273.15 K, 101.325 kPa)           22.413 969 54... e-3     (exact)                  m^3 mol^-1
molar volume of silicon                                     1.205 883 199 e-5        0.000 000 060 e-5        m^3 mol^-1
Molybdenum x unit                                           1.002 099 52 e-13        0.000 000 53 e-13        m
muon Compton wavelength                                     1.173 444 110 e-14       0.000 000 026 e-14       m
muon-electron mass ratio                                    206.768 2830             0.000 0046
muon g factor                                               -2.002 331 8418          0.000 000 0013
muon mag. mom.                                              -4.490 448 30 e-26       0.000 000 10 e-26        J T^-1
muon mag. mom. anomaly                                      1.165 920 89 e-3         0.000 000 63 e-3
muon mag. mom. to Bohr magneton ratio                       -4.841 970 47 e-3        0.000 000 11 e-3
muon mag. mom. to nuclear magneton ratio                    -8.890 597 03            0.000 000 20
muon mass                                                   1.883 531 627 e-28       0.000 000 042 e-28       kg
muon mass energy equivalent                                 1.692 833 804 e-11       0.000 000 038 e-11       J
muon mass energy equivalent in MeV                          105.658 3755             0.000 0023               MeV
muon mass in u                                              0.113 428 9259           0.000 000 0025           u
muon molar mass                                             1.134 289 259 e-4        0.000 000 025 e-4        kg mol^-1
muon-neutron mass ratio                                     0.112 454 5170           0.000 000 0025
muon-proton mag. mom. ratio                                 -3.183 345 142           0.000 000 071
muon-proton mass ratio                                      0.112 609 5264           0.000 000 0025
muon-tau mass ratio                                         5.946 35 e-2             0.000 40 e-2
natural unit of action                                      1.054 571 817... e-34    (exact)                  J s
natural unit of action in eV s                              6.582 119 569... e-16    (exact)                  eV s
natural unit of energy                                      8.187 105 7769 e-14      0.000 000 0025 e-14      J
natural unit of energy in MeV                               0.510 998 950 00         0.000 000 000 15         MeV
natural unit of length                                      3.861 592 6796 e-13      0.000 000 0012 e-13      m
natural unit of mass                                        9.109 383 7015 e-31      0.000 000 0028 e-31      kg
natural unit of momentum                                    2.730 924 530 75 e-22    0.000 000 000 82 e-22    kg m s^-1
natural unit of momentum in MeV/c                           0.510 998 950 00         0.000 000 000 15         MeV/c
natural unit of time                                        1.288 088 668 19 e-21    0.000 000 000 39 e-21    s
natural unit of velocity                                    299 792 458              (exact)                  m s^-1
neutron Compton wavelength                                  1.319 590 905 81 e-15    0.000 000 000 75 e-15    m
neutron-electron mag. mom. ratio                            1.040 668 82 e-3         0.000 000 25 e-3
neutron-electron mass ratio                                 1838.683 661 73          0.000 000 89
neutron g factor                                            -3.826 085 45            0.000 000 90
neutron gyromag. ratio                                      1.832 471 71 e8          0.000 000 43 e8          s^-1 T^-1
neutron gyromag. ratio in MHz/T                             29.164 6931              0.000 0069               MHz T^-1
neutron mag. mom.                                           -9.662 3651 e-27         0.000 0023 e-27          J T^-1
neutron mag. mom. to Bohr magneton ratio                    -1.041 875 63 e-3        0.000 000 25 e-3
neutron mag. mom. to nuclear magneton ratio                 -1.913 042 73            0.000 000 45
neutron mass                                                1.674 927 498 04 e-27    0.000 000 000 95 e-27    kg
neutron mass energy equivalent                              1.505 349 762 87 e-10    0.000 000 000 86 e-10    J
neutron mass energy equivalent in MeV                       939.565 420 52           0.000 000 54             MeV
neutron mass in u                                           1.008 664 915 95         0.000 000 000 49         u
neutron molar mass                                          1.008 664 915 60 e-3     0.000 000 000 57 e-3     kg mol^-1
neutron-muon mass ratio                                     8.892 484 06             0.000 000 20
neutron-proton mag. mom. ratio                              -0.684 979 34            0.000 000 16
neutron-proton mass difference                              2.305 574 35 e-30        0.000 000 82 e-30        kg
neutron-proton mass difference energy equivalent            2.072 146 89 e-13        0.000 000 74 e-13        J
neutron-proton mass difference energy equivalent in MeV     1.293 332 36             0.000 000 46             MeV
neutron-proton mass difference in u                         1.388 449 33 e-3         0.000 000 49 e-3         u
neutron-proton mass ratio                                   1.001 378 419 31         0.000 000 000 49
neutron relative atomic mass                                1.008 664 915 95         0.000 000 000 49
neutron-tau mass ratio                                      0.528 779                0.000 036
neutron to shielded proton mag. mom. ratio                  -0.684 996 94            0.000 000 16
Newtonian constant of gravitation                           6.674 30 e-11            0.000 15 e-11            m^3 kg^-1 s^-2
Newtonian constant of gravitation over h-bar c              6.708 83 e-39            0.000 15 e-39            (GeV/c^2)^-2
nuclear magneton                                            5.050 783 7461 e-27      0.000 000 0015 e-27      J T^-1
nuclear magneton in eV/T                                    3.152 451 258 44 e-8     0.000 000 000 96 e-8     eV T^-1
nuclear magneton in inverse meter per tesla                 2.542 623 413 53 e-2     0.000 000 000 78 e-2     m^-1 T^-1
nuclear magneton in K/T                                     3.658 267 7756 e-4       0.000 000 0011 e-4       K T^-1
nuclear magneton in MHz/T                                   7.622 593 2291           0.000 000 0023           MHz T^-1
Planck constant                                             6.626 070 15 e-34        (exact)                  J Hz^-1
Planck constant in eV/Hz                                    4.135 667 696... e-15    (exact)                  eV Hz^-1
Planck length                                               1.616 255 e-35           0.000 018 e-35           m
Planck mass                                                 2.176 434 e-8            0.000 024 e-8            kg
Planck mass energy equivalent in GeV                        1.220 890 e19            0.000 014 e19            GeV
Planck temperature                                          1.416 784 e32            0.000 016 e32            K
Planck time                                                 5.391 247 e-44           0.000 060 e-44           s
proton charge to mass quotient                              9.578 833 1560 e7        0.000 000 0029 e7        C kg^-1
proton Compton wavelength                                   1.321 409 855 39 e-15    0.000 000 000 40 e-15    m
proton-electron mass ratio                                  1836.152 673 43          0.000 000 11
proton g factor                                             5.585 694 6893           0.000 000 0016
proton gyromag. ratio                                       2.675 221 8744 e8        0.000 000 0011 e8        s^-1 T^-1
proton gyromag. ratio in MHz/T                              42.577 478 518           0.000 000 018            MHz T^-1
proton mag. mom.                                            1.410 606 797 36 e-26    0.000 000 000 60 e-26    J T^-1
proton mag. mom. to Bohr magneton ratio                     1.521 032 202 30 e-3     0.000 000 000 46 e-3
proton mag. mom. to nuclear magneton ratio                  2.792 847 344 63         0.000 000 000 82
proton mag. shielding correction                            2.5689 e-5               0.0011 e-5
proton mass                                                 1.672 621 923 69 e-27    0.000 000 000 51 e-27    kg
proton mass energy equivalent                               1.503 277 615 98 e-10    0.000 000 000 46 e-10    J
proton mass energy equivalent in MeV                        938.272 088 16           0.000 000 29             MeV
proton mass in u                                            1.007 276 466 621        0.000 000 000 053        u
proton molar mass                                           1.007 276 466 27 e-3     0.000 000 000 31 e-3     kg mol^-1
proton-muon mass ratio                                      8.880 243 37             0.000 000 20
proton-neutron mag. mom. ratio                              -1.459 898 05            0.000 000 34
proton-neutron mass ratio                                   0.998 623 478 12         0.000 000 000 49
proton relative atomic mass                                 1.007 276 466 621        0.000 000 000 053
proton rms charge radius                                    8.414 e-16               0.019 e-16               m
proton-tau mass ratio                                       0.528 051                0.000 036
quantum of circulation                                      3.636 947 5516 e-4       0.000 000 0011 e-4       m^2 s^-1
quantum of circulation times 2                              7.273 895 1032 e-4       0.000 000 0022 e-4       m^2 s^-1
reduced Compton wavelength                                  3.861 592 6796 e-13      0.000 000 0012 e-13      m
reduced muon Compton wavelength                             1.867 594 306 e-15       0.000 000 042 e-15       m
reduced neutron Compton wavelength                          2.100 194 1552 e-16      0.000 000 0012 e-16      m
reduced Planck constant                                     1.054 571 817... e-34    (exact)                  J s
reduced Planck constant in eV s                             6.582 119 569... e-16    (exact)                  eV s
reduced Planck constant times c in MeV fm                   197.326 980 4...         (exact)                  MeV fm
reduced proton Compton wavelength                           2.103 089 103 36 e-16    0.000 000 000 64 e-16    m
reduced tau Compton wavelength                              1.110 538 e-16           0.000 075 e-16           m
Rydberg constant                                            10 973 731.568 160       0.000 021                m^-1
Rydberg constant times c in Hz                              3.289 841 960 2508 e15   0.000 000 000 0064 e15   Hz
Rydberg constant times hc in eV                             13.605 693 122 994       0.000 000 000 026        eV
Rydberg constant times hc in J                              2.179 872 361 1035 e-18  0.000 000 000 0042 e-18  J
Sackur-Tetrode constant (1 K, 100 kPa)                      -1.151 707 537 06        0.000 000 000 45
Sackur-Tetrode constant (1 K, 101.325 kPa)                  -1.164 870 523 58        0.000 000 000 45
second radiation constant                                   1.438 776 877... e-2     (exact)                  m K
shielded helion gyromag. ratio                              2.037 894 569 e8         0.000 000 024 e8         s^-1 T^-1
shielded helion gyromag. ratio in MHz/T                     32.434 099 42            0.000 000 38             MHz T^-1
shielded helion mag. mom.                                   -1.074 553 090 e-26      0.000 000 013 e-26       J T^-1
shielded helion mag. mom. to Bohr magneton ratio            -1.158 671 471 e-3       0.000 000 014 e-3
shielded helion mag. mom. to nuclear magneton ratio         -2.127 497 719           0.000 000 025
shielded helion to proton mag. mom. ratio                   -0.761 766 5618          0.000 000 0089
shielded helion to shielded proton mag. mom. ratio          -0.761 786 1313          0.000 000 0033
shielded proton gyromag. ratio                              2.675 153 151 e8         0.000 000 029 e8         s^-1 T^-1
shielded proton gyromag. ratio in MHz/T                     42.576 384 74            0.000 000 46             MHz T^-1
shielded proton mag. mom.                                   1.410 570 560 e-26       0.000 000 015 e-26       J T^-1
shielded proton mag. mom. to Bohr magneton ratio            1.520 993 128 e-3        0.000 000 017 e-3
shielded proton mag. mom. to nuclear magneton ratio         2.792 775 599            0.000 000 030
shielding difference of d and p in HD                       2.0200 e-8               0.0020 e-8
shielding difference of t and p in HT                       2.4140 e-8               0.0020 e-8
speed of light in vacuum                                    299 792 458              (exact)                  m s^-1
standard acceleration of gravity                            9.806 65                 (exact)                  m s^-2
standard-state pressure                                     100 000                  (exact)                  Pa
Stefan-Boltzmann constant                                   5.670 374 419... e-8     (exact)                  W m^-2 K^-4
tau Compton wavelength                                      6.977 71 e-16            0.000 47 e-16            m
tau-electron mass ratio                                     3477.23                  0.23
tau energy equivalent                                       1776.86                  0.12                     MeV
tau mass                                                    3.167 54 e-27            0.000 21 e-27            kg
tau mass energy equivalent                                  2.846 84 e-10            0.000 19 e-10            J
tau mass in u                                               1.907 54                 0.000 13                 u
tau molar mass                                              1.907 54 e-3             0.000 13 e-3             kg mol^-1
tau-muon mass ratio                                         16.8170                  0.0011
tau-neutron mass ratio                                      1.891 15                 0.000 13
tau-proton mass ratio                                       1.893 76                 0.000 13
Thomson cross section                                       6.652 458 7321 e-29      0.000 000 0060 e-29      m^2
triton-electron mass ratio                                  5496.921 535 73          0.000 000 27
triton g factor                                             5.957 924 931            0.000 000 012
triton mag. mom.                                            1.504 609 5202 e-26      0.000 000 0030 e-26      J T^-1
triton mag. mom. to Bohr magneton ratio                     1.622 393 6651 e-3       0.000 000 0032 e-3
triton mag. mom. to nuclear magneton ratio                  2.978 962 4656           0.000 000 0059
triton mass                                                 5.007 356 7446 e-27      0.000 000 0015 e-27      kg
triton mass energy equivalent                               4.500 387 8060 e-10      0.000 000 0014 e-10      J
triton mass energy equivalent in MeV                        2808.921 132 98          0.000 000 85             MeV
triton mass in u                                            3.015 500 716 21         0.000 000 000 12         u
triton molar mass                                           3.015 500 715 17 e-3     0.000 000 000 92 e-3     kg mol^-1
triton-proton mass ratio                                    2.993 717 034 14         0.000 000 000 15
triton relative atomic mass                                 3.015 500 716 21         0.000 000 000 12
triton to proton mag. mom. ratio                            1.066 639 9191           0.000 000 0021
unified atomic mass unit                                    1.660 539 066 60 e-27    0.000 000 000 50 e-27    kg
vacuum electric permittivity                                8.854 187 8128 e-12      0.000 000 0013 e-12      F m^-1
vacuum mag. permeability                                    1.256 637 062 12 e-6     0.000 000 000 19 e-6     N A^-2
von Klitzing constant                                       25 812.807 45...         (exact)                  ohm
weak mixing angle                                           0.222 90                 0.000 30
Wien frequency displacement law constant                    5.878 925 757... e10     (exact)                  Hz K^-1
Wien wavelength displacement law constant                   2.897 771 955... e-3     (exact)                  m K
W to Z mass ratio                                           0.881 53                 0.000 17                 */


// NIST Fundamental Constants: https://physics.nist.gov/cuu/Constants/

// Bionumbers: https://bionumbers.hms.harvard.edu/search.aspx?task=searchbytrmorg&log=y&trm=constants

public struct Particle {
	struct Positron {
		public static let mass = Mass(Physical.Constants.Particle.Positron.mass)
		public static let charge = ElectricCharge(Physical.Constants.Particle.Positron.charge)
	}
}

public struct Astronomy {
	struct Planets {
		struct Earth {
			public static let surfaceGravity = Acceleration(Physical.Constants.Earth.surfaceGravity)
		}
	}
}

public struct Earth {
	public static let meanRadius = Length(6371.km)
	
	struct Surface {
		public static let gravity = Acceleration(Physical.Constants.Earth.surfaceGravity)
		
		public struct Area {
			public static let total = 510_072_000.squareKilometers
			public static let land = 148_940_000.squareKilometers
			public static let water = 361_132_000.squareKilometers
		}
		
		public struct Temperature {
			public static let min = 184.K
			public static let mean = 287.16.K
			public static let max = 330.K
		}
	}
}
