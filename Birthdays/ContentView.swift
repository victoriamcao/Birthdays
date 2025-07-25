//
//  ContentView.swift
//  Birthdays
//
//  Created by Scholar on 7/25/25.
//

import SwiftUI

struct ContentView: View {
    @State private var friends: [Friend] = [Friend(name: "Tenley", birthday: .now), Friend(name: "Joie", birthday: .now)]
    var body: some View {
        NavigationStack{
            List(friends, id: \.name) { friend in
                HStack{
                    Text("\(friend.name)")
                    Text("\(friend.birthday)")
                }//HStack
                .navigationTitle("Birthdays")
            }//list
        }//navstack
    }//body
}//struct
#Preview {
    ContentView()
}
