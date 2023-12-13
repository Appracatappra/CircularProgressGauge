# ``CircularProgressGauge``

CircularProgressGauge uses SwiftUI to display a circular gauge showing the percent complete (0% to 100%) for a process.

## Overview

**CircularProgressGauge** is completely user styleable with control over the following elements: 

* **Gradient** - Defines the color that will be used to fill the gauge.
* **Track Color** - The color for the empty part of the gauge.
* **Font Color** - The color for the percent completed text.
* **Font Size** - The size of the percent completed text.

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

## Topics


