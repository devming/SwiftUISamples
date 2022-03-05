//
//  ContentView.swift
//  SwiftUI001
//
//  Created by minkimingming on 2022/02/22.
//

import SwiftUI
import Foundation

struct TabExView: View {
    
    @State var heartBadgeSeen = false
    
    var body: some View {
        TabView {
            Color.red
                .tabItem {
                    Image(systemName: "house.fill")
                }
                .badge(10)
            
            Color.green
                .onAppear(perform: {
                    heartBadgeSeen = true
                })
                .tabItem {
                    Image(systemName: "suit.heart.fill")
                }
            // 비어있는 String은 비어있는 뱃지가 나오게 되는데 숫자 0으로하면 사라진다.
                .badge(heartBadgeSeen ? "" : "New")
//                .badge(heartBadgeSeen ? 30 : 0)
            
            Color.yellow
                .tabItem {
                    Image(systemName: "gearshape")
                }
        }
    }
}

struct TabExView_Previews: PreviewProvider {
    static var previews: some View {
        TabExView()
    }
}
