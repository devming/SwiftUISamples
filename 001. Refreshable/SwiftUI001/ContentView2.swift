//
//  ContentView.swift
//  SwiftUI001
//
//  Created by minkimingming on 2022/02/22.
//

import SwiftUI
import Foundation

struct ContentView2: View {
    
    var url = URL(string: "https://images5.fanpop.com/image/photos/31600000/Puppie-puppies-31602729-800-600.jpg")
    
    var body: some View {
        NavigationView {
            VStack {
//                AsyncImage(url: url)
//                // 비율을 직접 다루는 함수는 없고, 프레임으로 자를 순 있다.
//                    .frame(width: 100, height: 100)
//                    .clipped()
                // AsyncImage를 사용해서 원하는 크기의 이미지를 사용하기 위해서는 scale 파라미터가 있는 생성자를 사용한다.
                AsyncImage(url: url, scale: 1.0) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300, height: 300)
//                            .cornerRadius(10)
                        // Blur Effect (aka. UIVisualEffectView)
                            .overlay(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
                    } else {
                        Image(systemName: "house.fill")
                            .font(.largeTitle)
                            .foregroundColor(.yellow)
                    }
                }
            }
            .navigationTitle("Async Image")
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
