# SwiftUI Modifiers

OSLogKit offers readily available modifiers that greatly simplify the process of adopting OSLog.

### 🧩 CaptureLogOnAppear
* **logger** : log instance for which logs need to be captured
* **message** : string which needs to be logged
* **level** : specific level on which log needs to be captured
* **perform** : Since this modifier is made on top of OnAppear in order to perform additional actions in OnAppear you can use this param
```swift
func captureLogOnAppear(_ logger: OSLogKit, _ message: String, _ level: OSLogType = .default, _ perform: (() -> Void)? = nil)
```

### 🧩 CaptureBulkLogOnAppear
* **logger** : log instance for which logs need to be captured
* **message** : strings that need to be logged
* **level** : specific levels on which logs need to be captured
* **perform** : Since this modifier is made on top of OnAppear in order to perform additional actions in OnAppear you can use this param
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

* Parameters for the above modifiers are same as **CaptureLogOnAppear** & **captureBulkLogOnAppear**

