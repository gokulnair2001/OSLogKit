
<!-- <img src="https://github.com/gokulnair2001/OSLogKit/assets/56252259/55aef060-6273-4f48-8bed-f46ad6db8681" width=20% height=20%> -->

<img src="https://github.com/gokulnair2001/OSLogKit/assets/56252259/53164f76-9f0e-4dbf-8298-814424a427a0" width=20% height=20%>

# OSLogKit

OSLogKit is a layer 2 framework developed on top of the native OSLog system, aiming to simplify the integration of OSLog into your project. Apple has done an excellent job in ensuring that OSLogging is straightforward and easy to use. However, when it comes to implementing OSLog in your codebase, can be challenging. 

To address this, OSLogKit has been developed, further simplifying the process of adopting OSLog. One notable advantage of OSLogKit is that it offers additional functionalities not available in the native API.

OSLogKit has a variety of Modifiers which makes OSLogKit adoption very easy. Don't worry if your code base is in UIKit, you can still adopt it quickly.

[![Generic badge](https://img.shields.io/badge/iOS-14+-black.svg)](https://shields.io/)
[![Generic badge](https://img.shields.io/badge/macOS-11+-black.svg)](https://shields.io/)
[![Generic badge](https://img.shields.io/badge/tvOS-14+-black.svg)](https://shields.io/)
[![Generic badge](https://img.shields.io/badge/watchOS-7+-black.svg)](https://shields.io/)

[Demo App](https://github.com/gokulnair2001/OSLogKit_DemoApp)

## 📔 Usage 

### ⚙️ Initialisation
In order to use Logger you need to initialize the instance of Logger. OSLogKit supports a variety of Initialisation

### 🗳 Basic Initialisation
* The default behavior of the empty initialization is to store the logs in the subsystem that has the same name as the app's Bundle ID.
* It is always suggested to use the default initializer, making it easy to manage Subsystems.
```swift
let logger = Logger()
```

### 🗳 Advance Initialisation
* This initialization provides the leverage to select your own Subsystem and Category
* When Subsytem is left empty then the Bundle ID of the app is taken into consideration

```swift
let logger = Logger(subSystem: "com.gokulnair.Test-OSKit", category: "ContentView")
```
## 🛠 Operations
Following are the methods which OSLogKit supports

💽 Single Capture/Logging
* Captures a single log with specified OSLogLevel and message
* By default the capture level is ```.default```
```swift
 func capture(level: OSLogType? = nil, message: String)
```

💽 Bulk Capturing/Logging
* Captures logs in bulk with the specified OSLogLevels and messages
 ```swift
 func captureInBulk(levels: [OSLogType] = [], messages: [String])
 ```
 
 💽 Log Exporting
 * This method exports the log entries for a specific SubSystem within the specified time span
 * Use the same ```subsystem``` using which the logs are made
 * ```timeSpan``` denotes the span for which logs needs to be exported(Default 1 day)
 * ```completion``` Block returns an array of logs captured if the process succeeds and on failure, OSLogKit provides the error. 
 * Exported Log format - `[[Date] [Category] message]`
 ```swift
 func exportLogs(forSubsystem subsystem: String = "", timeSpan span: OSLogSpan = .day(1), completion: @escaping((Result<[String], OSLogError>) -> ()))
 ```
 
 ### OSLogSpan
 * OSLogSpan is the duration for which any log is exported
 Following are the OSLogSpans
 
 | Name | Cases | Description |
 | -- | -- | -- |
 | minutes | .minute(x) | Considers x minutes in past |
 | hours | .hour(x) | Considers x hours in past |
 | days | .day(x) | Considers x days in past |
 
 ### OSLogError
 * The default error type returned in OSLogKit for any form of failure is OSLogError
 * Use ```errorDescription``` in the failure case in order to get the error description
 * [Demo App](https://github.com/gokulnair2001/OSLogKit_DemoApp)
 
 | Name | Case | Description |
 | -- | -- | -- |
 | Export Failure | .exportFailure(let customString) | Custom export failure error |
 | Invalid Subsystem | .invalidSubsystem | Occurs when an Invalid Subsystem is used |
 
 ## SwiftUI Modifiers
 
 ### 🧩 CaptureLogOnAppear
 * ```logger``` log instance for which logs need to be captured
 * ```message``` string which needs to be logged
 * ```level``` specific level on which log needs to be captured
 * ```perform```Since this modifier is made on top of OnAppear in order to perform additional actions in OnApper you can use this param
 ```swift
 func captureLogOnAppear(_ logger: OSLogKit, _ message: String, _ level: OSLogType = .default, _ perform: (() -> Void)? = nil)
 ```
 
 ### 🧩 CaptureBulkLogOnAppear
 * ```logger``` log instance for which logs need to be captured
 * ```message``` strings that need to be logged
 * ```level``` specific levels on which logs need to be captured
 * ```perform```Since this modifier is made on top of OnAppear in order to perform additional actions in OnApper you can use this param
 ```swift
 func captureBulkLogOnAppear(_ logger: OSLogKit, _ messages: [String], _ levels: [OSLogType], _ perform: (() -> Void)? = nil)
 ```
 Other modifiers are
 
 | Case | Description |
 | -- | -- |
 | .captureLogOnDisappear | Captures log on disappear |
 | .captureBulkLogOnDisappear | Captures bulk log on disappear |
 | .captureLogOnLongPress | Captures log on long press |
 | .captureBulkLogOnLongPress | Captures bulk log on long press |
 | .captureLogOnTap | Captures log on tap |
 | .captureBulkLogOnTap | Captures bulk log on tap |
 | .captureLogOnSubmit | Captures log on submit |
 | .captureBulkLogOnSubmit | Captures bulk log on submit |
 
 * Parameters for the above modifiers are same as ```CaptureLogOnAppear``` & ```captureBulkLogOnAppear```

## ⌨️ In Code Usage

### SwiftUI
```swift
 VStack {
 // Some view
 }.captureLogOnTap(logger, "OSLogKit test log") {
  // additional on tap action (Optional)
 }
```
### UIKit
```swift
logger.capture(message: "OSLogKit test log")
```
* The following are the most basic usage, various other parameters are available which can be used as per need

## ⚠️ Caution
* OSLogKit only supports messages of String type, thus in order to log messages with various privacy levels you still need to use the classic logger. This is because Apple doesn't provide the option to create an instance of OSLogMessage.
* Thus create an instance of OSLogKit and directly access the classic logger.

## 📦 SPM 
OSLogKit is available through [Swift Package Manager](https://github.com/apple/swift-package-manager/). To add OSLogKit through SPM
* Open project in Xcode
* **Select ```File > Add Packages```**

```
https://github.com/gokulnair2001/OSLogKit
```
<img src="https://github.com/gokulnair2001/OSLogKit/assets/56252259/05f1688b-b62a-4114-a239-aa2f691f2e52" width=80% height=40%>

## ✨ Upcoming Features
* I am currently working on this version, aiming to delve deeper and offer a bunch of additional features. Keep an eye on my [Twitter](https://twitter.com/itIsGokulNair) handle for further updates.

## ⚖️ License
* OSLogKit is available under MIT [License](https://github.com/gokulnair2001/OSLogKit/blob/main/LICENSE).

## 🪄 How to contribute?

* Use the framework through SPM
* If you face any issue or you feel you can contribute in any way then fork this repository, make your changes, and make a Pull Request


<p align="center" width="100%">
   Made with ❤️ in 🇮🇳 By Gokul Nair   
</p>
 
