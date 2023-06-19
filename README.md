# OSLogKit

OSLogKit is a layer 2 framework developed on top of the native OSLog system, aiming to simplify the integration of OSLog into your project. Apple has done an excellent job in ensuring that OSLogging is straightforward and easy to use. However, when it comes to implementing OSLog in your codebase, it can be challenging. 

To address this, OSLogKit has been developed, further simplifying the process of adopting OSLog. One notable advantage of OSLogKit is that it offers additional functionalities that are not available in the native API.

OSLogKit have a variety of Modifiers which makes OSLogKit adoption very easy. Dont worry if your code base is in UIKit, you can still adopt it easily.

[Demo App](https://github.com/gokulnair2001/OSLogKit_DemoApp)

[![Generic badge](https://img.shields.io/badge/iOS-14+-black.svg)](https://shields.io/)
[![Generic badge](https://img.shields.io/badge/macOS-11+-black.svg)](https://shields.io/)
[![Generic badge](https://img.shields.io/badge/tvOS-14+-black.svg)](https://shields.io/)
[![Generic badge](https://img.shields.io/badge/watchOS-7+-black.svg)](https://shields.io/)

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
 * ```timeSpan``` denotes the span for which logs needs to be exported
 * ```completion``` Block returns array of logs captured if the process succeeds and on failure OSLogKit provides the error. 
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
 
 | Cases | Description |
 | -- | -- |
 | Export Failure | .exportFailure(let customString) | Custom export failure error |
 | Invalid Subsystem | .invalidSubsystem | Occours when an Invalid Subsystem is used |
 
 ## SwiftUI Modifiers
 
 ### 🧩 CaptureLogOnAppear
 * ```logger``` log instance for which logs needs to be captured
 * ```message``` string which needs to be logged
 * ```level``` specific level on which log needs to be captured
 * ```perform``` since this modifier is made on top of OnAppear inorder to perform additional actions in OnApper you can use this param
 ```swift
 func captureLogOnAppear(_ logger: OSLogKit, _ message: String, _ level: OSLogType = .default, _ perform: (() -> Void)? = nil)
 ```
 
 ### 🧩 CaptureBulkLogOnAppear
 * ```logger``` log instance for which logs needs to be captured
 * ```message``` strings which needs to be logged
 * ```level``` specific levels on which logs needs to be captured
 * ```perform``` since this modifier is made on top of OnAppear inorder to perform additional actions in OnApper you can use this param
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

## In Code Usage

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
* The following are the most basic usage, various other parameters are availabel which can be used as per need

## ⚠️ Caution
* OSLogKit only supports messages of String type, thus inorder to log messages with various privacy levels you still need to use the classic logger. This is because Apple doesnt provide the option to create an instance of OSLogMessage.
* Thus create instance of OSLogKit and directly access the classic logger. 

## ⚖️ License
* OSLogKit is available under MIT [License](https://github.com/gokulnair2001/OSLogKit/blob/main/LICENSE).

## 🪄 How to contribute ?

* Use the framework through SPM
* If you face any issue or you feel you can contribute to in anyway then fork this repository, make your changes and make a Pull Request


<p align="center" width="100%">
   Made with ❤️ in 🇮🇳 By Gokul Nair   
</p>
 
