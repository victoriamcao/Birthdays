//
//  ContentView.swift
//  Birthdays
//
//  Created by Scholar on 7/25/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var friends: [Friend]
    @Environment(\.modelContext) private var context
    @State private var newName = ""
    @State private var newBirthday = Date.now
    var body: some View {
        NavigationStack{
            List {
                ForEach(friends) { friend in
                    HStack{
                        HStack{
                            Text("\(friend.name)")
                            Text(friend.birthday, format: .dateTime.month(.wide).day().year()) }//HStack
                    }//HStack
                    .navigationTitle("Birthdays")
                }//HStack
                .onDelete(perform: deleteFriend)
            }

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
                            context.insert(newFriend)
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
        func deleteFriend(at offsets: IndexSet) {
            for index in offsets {
                let friendToDelete = friends[index]
                context.delete(friendToDelete)
            }//for loop
        }//func
        
    }//struct
    #Preview {
        ContentView()
            .modelContainer(for: Friend.self, inMemory: true)
    }

