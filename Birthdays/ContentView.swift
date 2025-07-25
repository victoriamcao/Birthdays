//
//  ContentView.swift
//  Birthdays
//
//  Created by Scholar on 7/25/25.
//

import SwiftUI

struct ContentView: View {
    @State private var friends: [Friend] = [Friend(name: "Tenley", birthday: .now), Friend(name: "Joie", birthday: .now)]
    @State private var newName = ""
    @State private var newBirthday = Date.now
    var body: some View {
        NavigationStack{
            List(friends, id: \.name) { friend in
                HStack{
                    Text("\(friend.name)")
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year()) }//HStack
                .navigationTitle("Birthdays")
            }//list
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20){
                    Text("New Birthday")
                        .font(.headline)
                    DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date) {
                               TextField("Name", text: $newName)
                                   .textFieldStyle(.roundedBorder)
                           }//DatePicker
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newBirthday)
                        friends.append(newFriend)
                        newName = ""
                        newBirthday = .now
                    }
                    .bold()
                }//VStack
                .padding()
                .background(.bar)
            }//safeAreaInset
        }//navstack
    }//body
}//struct
#Preview {
    ContentView()
}
