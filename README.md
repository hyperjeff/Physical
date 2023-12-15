# Physical

<img align="right" src="logo.png" style="margin: 0 0 20px 20px">

Physical is a Units of Measurement system for the Swift programming language, built on top of ('s) Foundation's Measurement framework.

The project aims to make use of the developments in Dimensional Analysis and Unit/Measurement research to make writing code more appropriate for both trivial and complex real world calculations. Even if you don't think you are making such calculations in your code, you probably are. This can be your friend to help maintain readable, debuggable code.

The more real-world code that uses this package, the better we can optimize the whole system. Please file requests, ideally with real (or hoped-for) code, submit pull requests, and bring up areas that could improvement.

### Highlights:

* Elegant syntax
* Fully composable system
* Extensive set of constants included
* Discoverable system via autocomplete
* Automatic precision tracking
* Runtime and/or Compiletime type checking
* Very light touch: No code rewriting required
* Extended set of dimensions and units
* Customizable dimensions and units
* Accelerated array operations

For a recent overview of the project, see [this talk on the framework](https://www.youtube.com/watch?v=xmD8wUZ0egQ) given at 360iDev 2022.

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fhyperjeff%2FPhysical%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/hyperjeff/Physical)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fhyperjeff%2FPhysical%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/hyperjeff/Physical)

## License

Physical is released under the MIT license.

## Installation:

If using Xcode, open a workspace or project and: File → Add Packages... → put in the URL of this project.

If editing your `Package.swift` by hand, add in this dependency info:

```swift
let package = Package(
    ...
    targets: [
        .target(name: "YourAwesomeProject", dependencies: ["Physical"]),
    ],
    dependencies: [
        .package(url: "https://github.com/hyperjeff/Physical.git", .branch("main")),
    ],
    ...
)
```

Once you have either of the above set, just `import Physical` atop any file that you would like.

## Dimensions

Physical extends the units supported by the Measurement framework's dimension set:

```
Acceleration, Angle, Area, ConcentrationMass,
Dispersion, Duration, ElectricCharge, ElectricCurrent,
ElectricPotentialDifference, ElectricResistance, Energy,
Frequency, FuelEfficiency, InformationStorage, Length,
Mass, Power, Pressure, Speed, Temperature, Volume
```

and adds these dimensions as well:

```
Activity, Amount, AngularSpeed, ElectricCapacitance,
ElectricConductance, ElectricInductance, Force,
IonizingRadiation, LuminousIntensity, LuminousFlux,
MagneticFlux, MagneticFluxDensity, SolidAngle
```

In addition, the entire system is customizable and expandable.


## Examples
### Basic Idea: Extending numbers

Simple creation and composition of units. One can then convert results into a more appropriate unit.

```swift
import Physical

var distance1 = 10.5.centimeters
let distance2 =  3.3.feet

distance1 + distance2

distance1 += 14.furlongs

distance1 < 3e-5.miles

let speed = 42.0.kilometersPerHour

distance2 / speed
(distance2 / speed).to(.hours)
distance2 / speed → .milliseconds
```

_Note:_ That's a real unicode arrow character → (U+2192), not ->. It's utterly unnecessary. If you don't want to use it or if you use a keyboard layout that doesn't include it, then you can use the `.to()` function instead. It's there if you want it![]().

### Chaining units

To create a Physical object with any dimension, just daisy chain units, possibly with exponents. As well, one can force a unit to be in the denominator via `/` as below. Each unit also has a "per" variant.

```swift
let aForce = 1.kilograms.meters.seconds(-2)
aForce → .newtons

6.meters.seconds(-1)
6.meters/.seconds
6.meters.perSecond

12.metersPerSecondSquared
12.meters/.seconds/.seconds
12.m/.s(2)
12.meters.perSecond.perSecond
```

### Various means of expression

There are several (hopefully just the right amount of) ways to write a complicated set of units, and one can choose the ones that fit the situation and readability demands.

```swift
var density = 27.grams.centimeters(-3)
density = 27.grams.cubicCentimeters(-1)
density = 27.g.cm(-3)
density = 27.g/.cm(3)
density = 27.grams.perCubicCentimeter

density → .milligramsPerDeciliter
density → .gramsPerLiter
```

### Mixing dimensions

One can compose new kinds of Physical objects through standard algebra.

If the combination of items is impossible, the result is a `Physical.notAThing`, in analogy to `NaN` when such an impossible math result happens for floating point numbers. Any further use of this object in more equations infect those results in turn. You can check its status using `.isNotAThing` just as float point numbers have `.isNaN`. To find out _why_ a variable has become not a thing, you can check its `.errorStack` which contains a history of its bad fortune since the first moment it became not a thing.

The `~` operator can be used to test commensurability. `x ~ y` means: Is `x` of the same dimension as `y`.

```swift
let force = 4.5.newtons                    // 4.5 N
let mass = 17.poundsMass                   // 17 lb

force + mass                               // Not a Thing
(force + mass) / 7.feet                    // Not a Thing

(force + mass).isNotAThing                 // true
(force + mass).errorStack                  // ["4.5 N + 17 lb"]

force.dimensionalDescription               // L¹ M¹ T⁻²
mass.dimensionalDescription                // M¹

let acceleration = force / mass            // 0.58358 m / s²
acceleration → .gravity                    // 0.059488 g

acceleration ~ 1.gravity                   // true

1.gravity.withBasicUnits                   // 9.81 m / s²
force.withBasicUnits                       // 4.5 kg m / s²

mass * acceleration                        // 9.9208 lb m / s²
mass * acceleration → .newtons             // 4.5 N
mass * acceleration → .joules              // Not a Thing
mass * acceleration * 37.feet → .joules    // 50.749 J
```

### Angles and Trig

Trig functions use units, contrary to what you might think. Physical provides both trig, exponent and inverse trig functions (normal and hyperbolic) that both wipe out a whole class of bugs ("do I multiply by π and divide by 180?"), but also makes your code, and reasoning about it, greatly improve. These functions are in addition to the standard trig functions and do not conflict with them.

Trig functions map angles to a real number. Inverse functions map real numbers back to angles.

These functions do not interfere with existing old school trig functions and will not contradict any existing algorithms. It's purely opt-in.

```swift
75°                            // 75 °
sin(75°)                       // 0.96593
asin(sin(75°))                 // 1.309 rad
75° → .radians                 // 1.309 rad
asin(sin(75°)) → .degrees      // 75 °


let θ₁ = (2.π/5).radians       // 1.2566 rad
let θ₂ = θ₁ → .degrees         // 72 °
let θ₃ = θ₁ → .revolutions     // 0.2 rev

sin(θ₁)                        // 0.95106
sin(θ₂)                        // 0.95106
sin(θ₃)                        // 0.95106
```

_Note:_ The degree symbol is `°` (`⇧⌥8` on a US Standard keyboard) and not `º` (`⌥0`).

### Temperatures

Special considerations must be given to temperature algebra because there are several scales (Celcius and Fahrenheit) that do not have a common zero temperature reference. Thankfully they are at least all linearly related. But there's also not just one zero-based scaling, there are two: Kelvin and Rankine, both supported, though Kelvin is the SI standard reference.

One can easily convert between them, but various algebraic operations will prevent equations from having a unique meaning, and these sums will become `notAThing`.

```swift
2.kelvin → .celsius            // -271.2.celsius
25.celsius → .fahrenheit       // 77 °F

2 * 100.kelvin                 // 200 K
2 * 100.celsius                // Not a Thing

500.kelvin ^ 4                 // 6.25e10 K⁴ 
500.fahrenheit ^ 4             // Not a Thing

30.fahrenheit < 30.celsius     // true
```

Temperature differences are treated as different kinds of quantities, which expands their meaningful use. A temperature can be either explicitly designated as a difference or implicitly via a subtraction.

```swift
50.celsius - 20.celsius                              // 30.celsius

50.celsius - 20.celsius == 30.kelvin                 // false
50.celsius - 20.celsius == 30.kelvin.difference      // true
50.celsius - 20.celsius == 54.fahrenheit.difference  // true

50.fahrenheit + 30.celsius                           // Not a Thing
50.fahrenheit + 30.celsius.difference                // 104 °F

let a = [68.12, 72.22, 120.5].celsius
let b = [30.31, 71.81, 90.33].celsius
		
a - b → .fahrenheit               // [68.06, 0.738, 54.31] ∆°F
```


### Decibels

Decibels are supported, and are _always_ set relative to a reference value. The system supports many standard dB measures as well as allowing you to use arbitrary reference values. (There are no "pure" dB values.) A decibel is _not_ considered unitless, as it represents a physical measure, relative to a reference value. One can freely convert back and forth as is convenient,  but one may not use them in contexts where their unwrapped value wouldn't also make sense.

Keeping track of the factor of 2 for power vs non-power ratios is done automatically. (If you use custom non-power-based ratios, these will use the standard factor of 10 log₁₀(ratio) for calculations.)

Some standard measures in common use:

```swift
1.pascals.dBSPL              // 93.98 dB SPL
30.watts.dBm                 // 44.77 dBm
30.watts.dBW                 // 14.77 dBW
```

One may use custom reference values as follows. (Reference values for custom dB measures shown in parentheses.)

```swift
let pressure = 43e-3.pascals
let dBPressure = pressure.dB(reference: 4e-3.newtons.perSquareMeter)   // 20.63 dB (0.004 N/m²)

let energy = 10.watts
let dBEnergy = energy.dB(reference: 37.horsepower)                     // -34.41 dB (37 hp)
```

Physical values that correspond to a dB measure as well as the reference value can be queried.

```swift
12.dBm.dBReference                                      // 1 mW
12.dBm.dereferencedValue                                // 3.981 mW

12.dBK.dBReference                                      // 1 K
12.dBK.dereferencedValue                                // 3.981 K

8.dBm.ratio                                             // 6.3096
8.dBSPL.ratio                                           // 2.5119

8.dBm ~ Power.self                                      // true
14.dBSPL ~ Pressure.self                                // true
```

Decibel algebra works like normal algebra, and can mix with physical measures to quickly be useful in real world scenarios.

```swift
0.7.dBW - 21.dBW + 13.dBW                               // -7.3 dBW
10.watts + 0.7.dBW - 21.dBW + 13.dBW                    // 1.862 W

1.W + 10.mW.dB(reference: 1.mW)                         // 10 W
1.W + 10.mW.dB(reference: 2.mW)                         //  5 W

10.dB(reference: 1.mW) + 10.dB(reference: 2.mW)         // 23.01 dBm

√(24.dBm * 600.ohms) → .volts                           // 12.28 V

12.dBSWL + 4.dBK                                        // Not a Thing
```

There is much more to say on this topic.

_Current issues:_ There is an issue with the negative `-` operation that requires numbers for decibels to be put in parentheses. For now be careful to include them or you'll get bad but working numbers. Ex: `(-161).dBK`.


### Arrays, Ramps, Indices

Physical can work to describe whole arrays at once, also providing acceleration on calculations done on them for free. As well, a `ramp` function is included, akin to Numpy's `linspace` function. One can treat arrays an n-dimensional vectors as well, with support for rotating (for now) 2-d arrays.

```swift
let fileSizes = [1, 3, 14, -2].gigabytes      // [1, 3, 14, -2] GB
let dataRate = 1.megabits.perSecond           // 1 Mb / s

(fileSizes / dataRate → .hours)               // [2.2222, 6.6667, 31.111, -4.4444] hr

(0.s...50.s).by(20.μs)                        // [0, 0.00002, 0.00004, ...] seconds
ramp(in: 0...1.pi, count: 27)                 // [0, 0.1208304866765305, ...]
ramp(in: 0...100, by: 3)                      // [0, 3, 6, ..., 99]

let angles = ramp(in: 0...1.pi, count: 27).radians.sigfigs(3)

4.meters.repeated(50)                         // [4, 4, ... ] meters

angles[7]                                     // 0.84581 rad
sin(angles)[7]                                // 0.74851

var position = [0, 1].meters
var velocity = [0, 1].rotated(32°) * 110.milesPerHour
```

### Exponents and power function

Exponents are of a special `TieredNumber` type, that is alternately an integer, a rational or of floating point value, and will gracefully degrade as needed. This allows equations to recover integer or rational exponents, providing better unit matching and accuracy of results.

```swift
let x = 4.76.meters

x^5                       // 2,443.6 m⁵
(x^5) ^ 0.2               // 4.76 m
(x^5) ^ 0.2 → .yards      // 5.2056 yd

let y = x ^ (3.0/7)       // 1.9517 m^(3/7)

y^7                       // 107.85 m³
y^7 → .cubicInches        // 6.5814e6 in³

x^π                       // 134.51 m^3.141592653589793
(x^π) ^ (1/π)             // 4.76 m^1.0
(x^π) ^ (1/π) → .yards    // Not a Thing
```

(Note in the last example that the Double exponent value meant that m^1.0 wasn't exact, and so wasn't commensurate with length.)

### Strong typing

One can optionally (a pun!) use strong typing. If one wraps a Physical object with a strong type, the result is an optional. This is done with analogy to how `Int(...)` and `Double(...)` etc are optionals in the Swift standard library.

One can create a literal strong type, using the two argument init, `Length(value, unit: .meters)` (etc) which guarantees unit-correctness and does not produce an optional. A compile-time error will result if the type is selected incorrectly.

To use a strongly typed object with a dynamically-typed Physical object, one need only extract the `physical` content. (There is room for improvement here.)

```swift
Length(45.feet)                             // optionals, akin to Int("test")
Length(45.hectares)                         // nil

Length(45, unit: .hectares)                 // Compile-time error!

let sailHeight = Length(45, unit: .feet)    // guaranteed type-correct
sailHeight.physical                         // retrieve dynamic Physical type

func orbitalRadiusOfChargeInMagneticField(
	mass: Mass,
	velocity: Speed,
	charge: ElectricCharge,
	magneticFluxDensity: MagneticFluxDensity) -> Length? {

	Length(mass * velocity / (charge * magneticFluxDensity))
}
```

### Constants and formulas

Physical has a rich set of constants with both their units and presently known precision.

```swift
let G = Physical.Constants.gravitation
let sunMass = Physical.Constants.Astronomic.Sun.mass
let earthMass = Physical.Constants.Earth.mass
let earthRadius = Physical.Constants.Earth.meanRadius

func orbitHeight(period: Duration) -> Length {
	return Length( ∛(G * earthMass * (period^2) / 4.π²) - earthRadius )!
}

let heightISS = orbitHeight(period: Duration(92, unit: .minutes)).physical
heightISS → .miles

func orbitalPeriod(height: Length) -> Duration {
	Duration( √(4.π² * ((heightISS + earthRadius)^3) / (G * earthMass)) )!
}

let periodISS = orbitalPeriod(height: Length(254, unit: .miles)).physical
periodISS → .minutes
```

### Extensions to regular numbers

A number of enhancements to float point numbers have been included.

```swift
6.pi               // sugar
2.π                // greek letter π
3.e                // 3 * natural number

14.0 ^ 2           // instead of pow(14.0, 2)

√14
√(x + y)           // longer expressions need parentheses

∛14                // silly but available
∜14

8√14               // 8th root of 14. can be any integer.
n√14

47%                // 0.47

distance *= 2.1%
```

_Note:_ Both π and √ are typable on most keyboard layouts. (On a US Qwerty layout, they're `⌥p` and `⌥v`.)

_Note:_ Non-ASCII characters all have ASCII equivalents, for those stuck on projects with 20th-century restrictions and Asciitarians.
