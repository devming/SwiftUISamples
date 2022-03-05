//
//  ContentView.swift
//  SwiftUI001
//
//  Created by minkimingming on 2022/02/22.
//

import SwiftUI
import Foundation

struct AppStorageRawRepresentable: View {
    
    @AppStorage("deviceType") var device: MyDevice?
    
    var body: some View {
        VStack {
            if let deviceType = device {
                Text(deviceType.rawValue)
            }
            
            Button {
                device = .iPhone12
            } label: {
                Text("Select iPhone 12")
            }
        }
    }
}

// Storing Enum in App Storage
enum MyDevice: String {
    case iPhone8 = "8"
    case iPhone11 = "11"
    case iPhone12 = "12"
}

struct AppStorageRawRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageRawRepresentable()
    }
}
