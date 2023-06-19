# OSLogKit

OSLogKit is a layer 2 framework developed on top of the native OSLog system, aiming to simplify the integration of OSLog into your project. Apple has done an excellent job in ensuring that OSLogging is straightforward and easy to use. However, when it comes to implementing OSLog in your codebase, it can be challenging. To address this, OSLogKit has been developed, further simplifying the process of adopting OSLog. One notable advantage of OSLogKit is that it offers additional functionalities that are not available in the native API.

## 📔 Usage 

### ⚙️ Initialisation
In order to use Logger you need to initialise the instance of Logger. OSLogKit supports a variety of Initialisation

### 🗳 Basic Initialisation
* The default behavior of the empty initialisation is to store the logs in the subsystem that has the same name as the app's Bundle ID.
* It always suggested to use the default initialiser, making it easy to manage Subsystems.
```swift
let logger = Logger()
```

### 🗳 Advance Initialisation
* This initialisation provides the leverage to select your won Subsytem and Category
* When Subsytem is left empty then Bundle ID of the app is taken into consideration

```swift
let logger = Logger(subSystem: "com.gokulnair.Test-OSKit", category: "ContentView")
```
