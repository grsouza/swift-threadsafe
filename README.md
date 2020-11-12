# ThreadSafe
![CI](https://github.com/grsouza/swift-threadsafe/workflows/CI/badge.svg)

Micro library for Swift that guarantees synchonized access to a wrapped value.

## Installation

`ThreadSafe` is distributed using [Swift Package Manager](https://swift.org/package-manager/). To install it into a project, add it as a dependency within your `Package.swift` manifest:

```swift
let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/grsouza/swift-threadsafe.git", from: "1.0.0")
    ],
    ...
)
```

Then import ThreadSafe wherever you'd like to use it:

```swift
import ThreadSafe
```

## Usage

Just wrap the value you wish to synchonize in a `ThreadSafe` type and use the methods `write` to mutate the inner value and `read` to access a read only reference to the inner value. **Reads are concurrent and writes are exclusive.**

```swift
let value = ThreadSafe(value: 0)

value.write {
    $0 += 1
}

let computedValue = value.read { 
    $0 + 1 
}
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://github.com/grsouza/Box.swift/blob/master/LICENSE)
