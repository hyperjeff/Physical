# Physical

<img align="right" src="logo.png" style="margin: 0 0 20px 20px">

Physical is a Units of Measurement system for the Swift programming language, built on top of ('s) Foundation's Measurement framework.

The project aims to make use of the developments in Dimensional Analysis and Unit/Measurement research to make writing code more appropriate for both trivial and complex real world calculations. Even if you don't think you are making such calculations in your code, you probably are. This can be your friend to help maintain readable, debuggable code.

The more real-world code that uses this package, the better we can optimize the whole system. Please file requests, ideally with real code, submit pull requests, and bring up areas that could improvement.

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

let distance1 = 10.5.centimeters
let distance2 =  3.3.feet

distance1 + distance2

let speed = 42.0.kilometersPerHour

distance2 / speed
(distance2 / speed).to(.hours)
distance2 / speed → .milliseconds
```

_Note:_ That's a real unicode arrow character → (U+2192), not ->. It's utterly unnecessary. If you don't want to use it or if you use a keyboard layout that doesn't include it, then you can use the `.to()` function instead. It's there if you want it![]().

### Chaining units

To create a Physical object with any dimension, just daisy chain units, possibly with exponents. As well, one can force a unit to be in the denominator via `/` as below.

```swift
let aForce = 1.kilograms.meters.seconds(-2)
aForce → .newtons

6.meters.seconds(-1)
6.meters/.seconds

12.meters/.seconds/.seconds
12.m/.s(2)
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

Trig functions use units, contrary to what you might think. Physical provides both trig and inverse trig functions (normal and hyperbolic) that both wipe out a whole class of bugs ("do I multiply by π and divide by 180?"), but also makes your code, and reasoning about it, greatly improve. These functions are in addition to the standard trig functions and do not conflict with them.

Currently the result of a trig function is a Physical object of unitless (`constant`) type. If you need to use the Double value, grab its value. E.g., `sin(φ).value`. This allows inverse trig functions to return Physical objects with units radian, without interferring with existing trig functions in the Swift standard library.

```swift
75°                            // 75 °
sin(75°)                       // 0.96593
asin(sin(75°))                 // 1.309 rad
75° → .radians                 // 1.309 rad
asin(sin(75°)) → .degrees      // 75 °


let θ₁ = (2.π/5).radians       // 1.2566 rad
let θ₂ = θ1 → .degrees         // 72 °
let θ₃ = θ1 → .revolutions     // 0.2 rev

sin(θ₁)                        // 0.95106
sin(θ₂)                        // 0.95106
sin(θ₃)                        // 0.95106
```

_Note:_ The degree symbol is `°` (`⇧⌥8` on a US Qwerty keyboard) and not `º` (`⌥0`).

### Arrays, Ramps, Indices

Physical can work to describe whole arrays at once, also providing acceleration on calculations done on them for free. As well, a `ramp` function is included, akin to Numpy's `linspace` function.

```swift
let fileSizes = [1, 3, 14, -2].gigabytes      // [1, 3, 14, -2] GB
let dataRate = 1.megabits.perSecond           // 1 Mb / s

(fileSizes / dataRate → .hours)               // [2.2222, 6.6667, 31.111, -4.4444] hr


ramp(in: 0...1.pi, count: 27)                 // [0, 0.1208304866765305, ...]

let angles = ramp(in: 0...1.pi, count: 27).radians.sigfigs(3)

angles[7]                                     // 0.84581 rad
sin(angles)[7]                                // 0.74851
```

### Unit exponents

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
```

_Note:_ Both π and √ are typable on most keyboard layouts. (On a US Qwerty layout, they're `⌥p` and `⌥v`.)

_Note:_ Non-ASCII characters all have ASCII equivalents, for those stuck on projects with 20th-century restrictions and Asciitarians.
