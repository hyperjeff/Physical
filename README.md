# Physical

<img align="right" src="logo.png">

Physical is a Units of Measurement system for the Swift programming language, built on top of ('s) Foundation's Measurement framework.

The project aims to make use of the developments in Dimensional Analysis and Unit/Measurement research to make writing code more appropriate for both trivial and complex real world calculations. Even if you don't think you are making such calculations in your code, you probably are. This can be your friend to help maintain readable, debuggable code.

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

## Examples:

### Basic Idea: Extending numbers

```swift
let distance1 = 10.5.centimeters
let distance2 =  3.3.feet

distance1 + distance2

let speed = 42.0.kilometersPerHour

distance2 / speed
(distance2 / speed).to(.hours)
distance2 / speed → .milliseconds
```

_Note:_ That's a real unicode arrow character → (U+2192), not ->. It's utterly unnecessary. If you don't want to use it or use a keyboard layout that doesn't include it, use the `.to()` function instead. It's there for elegance and convenience, if desired.

### Chaining units

```swift
let aForce = 1.kilograms.meters.seconds(-2)
aForce → .newtons

6.meters.seconds(-1)
6.meters/.seconds

12.meters/.seconds/.seconds
```

### Various means of expression

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

```swift
let force = 4.5.newtons
let mass = 17.poundsMass

force + mass
(force + mass) / 7.feet

force.dimensionalDescription
mass.dimensionalDescription

let acceleration = force / mass
acceleration → .gravity

acceleration ~ 1.gravity

1.gravity.withBasicUnits
force.withBasicUnits

mass * acceleration
mass * acceleration → .newtons
mass * acceleration → .joules
mass * acceleration * 37.feet → .joules
```

### Angles and Trig

```swift
75°
sin(75°)
asin(sin(75°))
75° → .radians
asin(sin(75°)) → .degrees      // 75°


let θ1 = (2.π/5).radians
let θ2 = θ1 → .degrees
let θ3 = θ1 → .revolutions

sin(θ1)               // All 3 give 0.95106
sin(θ2)
sin(θ3)
```

### Arrays, Ramps, Indices

```swift
let fileSizes = [1, 3, 14, -2].gigabytes
let dataRate = 1.megabits.perSecond

(fileSizes / dataRate → .hours)


ramp(in: 0...1.pi, count: 27)

let angles = ramp(in: 0...1.pi, count: 27).radians.sigfigs(3)

let angle27 = angles[26]
```

### Unit exponents

```swift
let x = 4.76.meters

x^5
(x^5) ^ 0.2
(x^5) ^ 0.2 → .yards

let y = x ^ (3.0/7)

y^7                   // exactly y^3 results
y^7 → .cubicInches

x^π
(x^π) ^ (1/π)
(x^π) ^ (1/π) → .yards
```

### Strong typing

```swift
Length(45.feet)         // optionals, akin to Int("test")
Length(45.hectares)     // nil

Length(45, unit: .hectares)  // Compile-time error!

let sailHeight = Length(45, unit: .feet)   // guaranteed type-correct
sailHeight.physical                        // retrieve dynamic Physical type
```

### Constants and formulas

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