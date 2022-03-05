//
//  ContentView.swift
//  SwiftUI001
//
//  Created by minkimingming on 2022/02/22.
//

import SwiftUI
import Foundation

struct SwipeAction: View {
    
    var body: some View {
        List {
            ForEach(1...20, id: \.self) { index in
                Text("User Task \(index)")
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button {
                            
                        } label: {
                            Image(systemName: "house.fill")
                        }
                        .tint(.red)
                        Button {
                            
                        } label: {
                            Image(systemName: "gearshape")
                        }
                        .tint(.blue)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                        Button {
                            
                        } label: {
                            Image(systemName: "photo")
                        }
                        .tint(.yellow)
                    }
            }
        }
    }
}

struct SwipeAction_Previews: PreviewProvider {
    static var previews: some View {
        SwipeAction()
    }
}
