//
//  ContentView.swift
//  SwiftUI001
//
//  Created by minkimingming on 2022/02/22.
//

import SwiftUI
import Foundation

struct KeyboardDoneAlternatives: View {
    
    
    var body: some View {
        VStack {
            TextField("devming", text: .constant(""))
                .textFieldStyle(.roundedBorder)
            // 여기 파라미터에 따라 키보드 파란색 버튼의 text가 바뀐다.
                .submitLabel(.search)
                .padding()
        }
    }
}

struct KeyboardDoneAlternatives_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardDoneAlternatives()
    }
}
