#  Getting Started

OSLogKit helps you to adopt OSLog into your code base with ease. The powerful API's of OSLogKit make it easy to perform various logging operations.

## Usage

Initially create the instance of ``OSLogKit`` with ``OSLogKit/OSLogKit/init()`` or ``OSLogKit/OSLogKit/init(subSystem:category:)`` initialiser

```swift
let logger = Logger()
```

### SwiftUI

```swift
VStack {
// Some view
}.captureLogOnTap(logger, "OSLogKit test log") {
 // additional on tap action (Optional)
}
```
- <doc:Modifiers>

### UIKit
```swift
logger.capture(message: "OSLogKit test log")
```

- Important: Use the classic logger instance from ``OSLogKit`` inorder to capture logs with more privacy

## Topics

### Classes

- ``OSLogKit/OSLogKit``

### Enumerations

- ``OSLogError``
- ``OSLogSpan``
