//
//  ContentView.swift
//  SwiftUI001
//
//  Created by minkimingming on 2022/02/22.
//

import SwiftUI
import Foundation

struct SafeAreaInset: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                ForEach(1...25, id: \.self) { _ in
                    HStack {
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 45, height: 45)
                        
                        VStack(alignment: .leading, spacing: 15 ) {
                            Rectangle()
                                .fill(.gray)
                                .frame(height: 15)
                            
                            Rectangle()
                                .fill(.gray)
                                .frame(height: 15)
                                .padding(.trailing, 50)
                        }
                    }
                }
            }
            .padding()
        }
        .safeAreaInset(edge: .bottom) {
            // 자동으로 메인 컨텐츠에 패딩을 추가해주게 된다.
            Capsule()
                .fill(.red)
                .frame(height: 55)
                .padding(.horizontal)
        }
    }
}

struct SafeAreaInset_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaInset()
    }
}
