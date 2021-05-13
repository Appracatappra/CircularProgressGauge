# CircularProgressGauge for Swift and SwiftUI

![](https://img.shields.io/badge/license-MIT-green) ![](https://img.shields.io/badge/maintained%3F-Yes-green) ![](https://img.shields.io/badge/swift-5.4-green) ![](https://img.shields.io/badge/iOS-13.0-red) ![](https://img.shields.io/badge/macOS-10.15-red) ![](https://img.shields.io/badge/tvOS-13.0-red) ![](https://img.shields.io/badge/watchOS-6.0-red) ![](https://img.shields.io/badge/release-v1.0.1-blue)

**CircularProgressGauge** uses SwiftUI to display a circular gauge showing the percent complete (0% to 100%) for a process. **CircularProgressGauge** is completely user styleable with control over the following elements: 

* **Gradient** - Defines the color that will be used to fill the gauge.
* **Track Color** - The color for the empty part of the gauge.
* **Font Color** - The color for the percent completed text.
* **Font Size** - The size of the percent completed text.

<a name="Installation"></a>
## Installation

**Swift Package Manager** (Xcode 11 and above)

1. Select **File** > **Swift Packages** > **Add Package Dependency…** from the **File** menu.
2. Paste `https://github.com/Appracatappra/CircularProgressGauge.git` in the dialog box.
3. Follow the Xcode's instruction to complete the installation.

> Why not CocoaPods, or Carthage, or blank?

Supporting multiple dependency managers makes maintaining a library exponentially more complicated and time consuming.

Since, the **Swift Package Manager** is integrated with Xcode 11 (and greater), it's the easiest choice to support going further.

## Using CircularProgressGauge

**CircularProgressGauge** is very easy to use inside a SwiftUI `View`:

```swift
@State var progress = 0.5
 
var body: some View {
	VStack {
	    // Progress is give as 0.0 to 1.0
	     CircularProgressGauge(progress: $progress)
	         .frame(width: 40.0, height: 40.0)
	     }
	}
}
```

Would present the following gauge on iOS:

![](Documentation/Images/Gauge01.png)
 
 
