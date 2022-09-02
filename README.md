# Physical

![Physical Swift](logo.png "Logo")

Physical is a Units of Measurement system for the Swift programming language, built on top of ('s) Foundation's Measurement framework.

The project aims to make use of the developments in Dimensional Analysis and Unit/Measurement research to make writing code more appropriate for both trivial and complex real world calculations. Even if you don't think you are making such calculations in your code, you probably are. This can be your friend to help maintain readable, debuggable code.

### Highlights:

* Elegant syntax
* Fully composable system
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

