# CircularProgressGauge for Swift and SwiftUI

![](https://img.shields.io/badge/license-MIT-green) ![](https://img.shields.io/badge/maintained%3F-Yes-green) ![](https://img.shields.io/badge/swift-5.4-green) ![](https://img.shields.io/badge/iOS-17.0-red) ![](https://img.shields.io/badge/macOS-14.0-red) ![](https://img.shields.io/badge/tvOS-17.0-red) ![](https://img.shields.io/badge/watchOS-10.0-red) ![](https://img.shields.io/badge/dependency-LogManager-orange) ![](https://img.shields.io/badge/dependency-SwiftletUtilities-orange)

**CircularProgressGauge** uses SwiftUI to display a circular gauge showing the percent complete (0% to 100%) for a process. **CircularProgressGauge** is completely user styleable with control over the following elements: 

* **Gradient** - Defines the color that will be used to fill the gauge.
* **Track Color** - The color for the empty part of the gauge.
* **Font Color** - The color for the percent completed text.
* **Font Size** - The size of the percent completed text.

## Support

If you find `CircularProgressGauge` useful and would like to help support its continued development and maintenance, please consider making a small donation, especially if you are using it in a commercial product:

<a href="https://www.buymeacoffee.com/KevinAtAppra" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

It's through the support of contributors like yourself, I can continue to build, release and maintain high-quality, well documented Swift Packages like `CircularProgressGauge` for free.

<a name="Installation"></a>
## Installation

**Swift Package Manager** (Xcode 11 and above)

1. In Xcode, select the **File** > **Add Package Dependency…** menu item.
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
 
# Documentation

The **Package** includes full **DocC Documentation** for all of its features.
