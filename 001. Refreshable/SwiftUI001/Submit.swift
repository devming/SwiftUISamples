//
//  ContentView.swift
//  SwiftUI001
//
//  Created by minkimingming on 2022/02/22.
//

import SwiftUI
import Foundation

struct Submit: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Text("OnTrigger...!")
                TextField("Type Here", text: .constant(""))
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
            .searchable(text: .constant(""))
            .navigationTitle("Home")
            
        }
        // search는 검색 필드, text는 text필드에 해당함.
        .onSubmit(of: [.search, .text]) {
            print("Search field submitted..")
        }
    }
}

struct Submit_Previews: PreviewProvider {
    static var previews: some View {
        Submit()
    }
}
