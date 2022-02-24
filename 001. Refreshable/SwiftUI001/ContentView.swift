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
    
    var body: some View {
        NavigationView {
            List(users) { user in
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.name)
                    Text(user.email)
                        .font(.caption)
                }
            }
            // Indicator will show until async task finished
            .refreshable {
                await fetchUsers()
            }
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
