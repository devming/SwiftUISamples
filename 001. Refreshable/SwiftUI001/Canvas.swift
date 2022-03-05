//
//  ContentView.swift
//  SwiftUI001
//
//  Created by minkimingming on 2022/02/22.
//

import SwiftUI
import Foundation

struct MyCanvas: View {
    
    
    var body: some View {
        VStack {
            // CoreGraphics의 GraphicsContext를 사용해서 그림을 그릴 수 있다.
            Canvas { context, size in
                context.draw(Text("Hello"), at: CGPoint(x: size.width / 2, y: size.height / 2))
                context.draw(Image(systemName: "house.fill"), at: CGPoint(x: size.width / 1.8, y: size.height / 1.5))
            }
            .frame(width: 300, height: 300)
            .background(.green, in: RoundedRectangle(cornerRadius: 15))
        }
    }
}

struct MyCanvas_Previews: PreviewProvider {
    static var previews: some View {
        MyCanvas()
    }
}
