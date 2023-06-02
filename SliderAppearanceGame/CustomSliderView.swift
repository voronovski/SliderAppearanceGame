//
//  CustomSliderView.swift
//  SliderAppearanceGame
//
//  Created by Aleksei Voronovskii on 6/1/23.
//

import SwiftUI

struct CustomSliderView: UIViewRepresentable {
    @Binding var value: Double
    
    let alpha: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = .red.withAlphaComponent(CGFloat(alpha) / 100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension CustomSliderView {
    class Coordinator: NSObject {
        @Binding var value: Double
                
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSliderView(value: .constant(50.0), alpha: 100)
    }
}
