//
//  ContentView.swift
//  SwiftUI001
//
//  Created by minkimingming on 2022/02/22.
//

import SwiftUI
import Foundation

struct CustomSheetDismiss: View {
    
    @State var show = false
    
    var body: some View {
        VStack {
            Button("Show Sheet") {
                show.toggle()
            }
        }
        .sheet(isPresented: $show) {
            Text("I'm Sheet View.")
            // Dismiss Gesture를 비활성화 시킴
            // Sheet Content에서 사용해야함
                .interactiveDismissDisabled(true)
        }
    }
}

struct CustomSheetDismiss_Previews: PreviewProvider {
    static var previews: some View {
        CustomSheetDismiss()
    }
}
