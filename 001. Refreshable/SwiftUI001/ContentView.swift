//
//  ContentView.swift
//  SwiftUI001
//
//  Created by minkimingming on 2022/02/22.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")
    
    @State var users: [User] = []
    
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView {
//            List(users) { user in
            List {
                ForEach(users) { user in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.name)
                        Text(user.email)
                            .font(.caption)
                    }
                    // Row seperator customazation
                    .listRowSeparatorTint(.red)
                    .listRowSeparator(.hidden)
                }
            }
            // Indicator will show until async task finished
            .refreshable {
                await fetchUsers()
            }
            // searchable은 Navigation View와 사용할 수 있다.
            .searchable(text: $searchText, prompt: "Search User", suggestions: {
                
                // search field가 활성화될 때 보여주는 리스트
                ForEach(
                    users.filter {
                        searchText == ""
                        ? true
                        : $0.email.lowercased().contains(searchText.lowercased())
                    }
                ) { user in
                    Text(user.email)
                    // cell 탭했을 때, 검색어 자동완성되도록
                        .searchCompletion(user.name)
                }
            })
            .navigationTitle("Pull To Refresh")
        }
    }

    //fetching user in async
    func fetchUsers() async {
        let session = URLSession(configuration: .default)
        do {
            let task = try await session.data(from: url!)
            let users = try JSONDecoder().decode([User].self, from: task.0)
            self.users = users
        } catch {
            print("error \(error)")
        }
    }
}

//
struct User: Identifiable, Decodable {
    var id: Int
    var name: String
    var email: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
