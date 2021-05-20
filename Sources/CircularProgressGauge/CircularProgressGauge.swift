//
//  CircularProgressView.swift
//  Stuff To Buy
//
//  Created by Kevin Mullins on 4/15/21.
//

import SwiftUI
import SwiftletUtilities

/**
 Defines a SwiftUI Circular Progress Gause that will show the percent complete (0% to 100%) for a process.
 
 ## Example:
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
 - Remark: Progress is given to the control as a number between 0.0 to 1.0 which will render as a 0% to 100%.
 */
public struct CircularProgressGauge: View {
    
    // MARK: - Properties
    /// The amount of progress as a number between 0.0 to 1.0.
    var progress: Binding<Float>
    
    /// The gradient used to fill the gauge from 0% to 100%.
    var gradient = Gradient(colors: [.red, .orange, .yellow, .green])
    
    /// The track (the empty part of the gauge) color.
    var trackColor = Color.systemGray6
    
    /// The color of the font used to display the percent complete.
    var fontColor = Color.black
    
    /// The size of the font used to display the percent complete.
    var fontSize = 12
    
    /// The width of the Track and gauge display line.
    var trackWidth = 5.0
    
    /// If `true`, the gauge will animate when it's value changes,. If false the gauge will change value without animating the change.
    var isAnimated:Bool = true
    
    /// If not empty (""), display the named SF Font image given in the center of the gauge instead of the percentage complete. The image will be rendered in the `fontColor` and at the `fontSize`.
    var systemImage:String = ""
    
    // MARK: - Initializers
    
    /// Creates a new instance of the gauge.
    /// - Parameters:
    ///   - progress: The amount of progress as a number between 0.0 to 1.0.
    ///   - gradient: The gradient used to fill the gauge from 0% to 100%.
    ///   - trackColor: The track (the empty part of the gauge) color.
    ///   - fontColor: The color of the font used to display the percent complete.
    ///   - fontSize: The size of the font used to display the percent complete.
    ///   - trackWidth: The width of the Track and gauge display line.
    ///   - systemImage: If not empty (""), display the named SF Font  image given in the center of the gauge instead of the percentage complete. The image will be rendered in the `fontColor` and at the `fontSize`.
    ///   - isAnimated: If `true`, the gauge will animate when it's value changes,. If false the gauge will change value without animating the change.
    public init(progress:Binding<Float>, gradient:Gradient = Gradient(colors: [.red, .orange, .yellow, .green]), trackColor:Color = Color.systemGray6, fontColor:Color = Color.black, fontSize:Int = 12, trackWidth:Double = 5.0, systemImage:String = "", isAnimated:Bool = true) {
        // Initialize
        self.progress = progress
        self.gradient = gradient
        self.trackColor = trackColor
        self.fontColor = fontColor
        self.fontSize = fontSize
        self.trackWidth = trackWidth
        self.systemImage = systemImage
        self.isAnimated = isAnimated
    }
    
    // MARK: - Control Body
    /// Returns the rendered contents of the gauge.
    public var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: CGFloat(trackWidth))
                .foregroundColor(trackColor)
            
            if isAnimated {
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.progress.wrappedValue, 1.0)))
                    .stroke(
                            AngularGradient(gradient: gradient, center: .center, startAngle: .zero, endAngle: .degrees(360)),
                        lineWidth: CGFloat(trackWidth)
                        )
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear)
            } else {
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.progress.wrappedValue, 1.0)))
                    .stroke(
                            AngularGradient(gradient: gradient, center: .center, startAngle: .zero, endAngle: .degrees(360)),
                        lineWidth: CGFloat(trackWidth)
                        )
                    .rotationEffect(Angle(degrees: 270.0))
            }
            
            if systemImage.isEmpty {
                Text(String(format: "%.0f%%", min(self.progress.wrappedValue, 1.0)*100.0))
                    .font(.system(size: CGFloat(fontSize)))
                    .foregroundColor(fontColor)
            } else {
                Image(systemName: systemImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(fontColor)
                    .frame(width: CGFloat(fontSize), height: CGFloat(fontSize))
                    
            }
        }
    }
}

/**
 Creates a preview for the gauge.
 */
public struct CircularProgressView_Previews: PreviewProvider {
    
    /// Returns the list of previews.
    public static var previews: some View {
        Group {
            CircularProgressGauge(progress: .constant(0.7))
                .frame(width: 50.0, height: 50.0)
            CircularProgressGauge(progress: .constant(0.7), fontSize: 24, systemImage: "pencil.tip.crop.circle")
                .frame(width: 50.0, height: 50.0)
        }
    }
}
