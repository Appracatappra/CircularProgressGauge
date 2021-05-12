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
    
    // MARK: - Initializers
    
    /// Creates a new instance of the gauge.
    /// - Parameters:
    ///   - progress: The amount of progress as a number between 0.0 to 1.0.
    ///   - gradient: The gradient used to fill the gauge from 0% to 100%.
    ///   - trackColor: The track (the empty part of the gauge) color.
    ///   - fontColor: The color of the font used to display the percent complete.
    ///   - fontSize: The size of the font used to display the percent complete.
    public init(progress:Binding<Float>, gradient:Gradient = Gradient(colors: [.red, .orange, .yellow, .green]), trackColor:Color = Color.systemGray6, fontColor:Color = Color.black, fontSize:Int = 12) {
        // Initialize
        self.progress = progress
        self.gradient = gradient
        self.trackColor = trackColor
        self.fontColor = fontColor
        self.fontSize = fontSize
    }
    
    // MARK: - Control Body
    /// Returns the rendered contents of the gauge.
    public var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 5.0)
                .foregroundColor(trackColor)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress.wrappedValue, 1.0)))
                .stroke(
                        AngularGradient(gradient: gradient, center: .center, startAngle: .zero, endAngle: .degrees(360)),
                        lineWidth: 5
                    )
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            
            Text(String(format: "%.0f%%", min(self.progress.wrappedValue, 1.0)*100.0))
                .font(.system(size: CGFloat(fontSize)))
                .foregroundColor(fontColor)
        }
    }
}

/**
 Creates a preview for the gauge.
 */
public struct CircularProgressView_Previews: PreviewProvider {
    
    /// Returns the list of previews.
    public static var previews: some View {
        CircularProgressGauge(progress: .constant(0.7))
            .frame(width: 50.0, height: 50.0)
    }
}
