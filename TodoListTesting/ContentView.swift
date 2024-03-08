//
//  ContentView.swift
//  TodoListTesting
//
//  Created by Eduardo Thomas on 03/01/24.
//

import SwiftUI

struct ContentView: View {
    //let textValue: String = "Hello Workshop"
    @State var todos: [String] = [
        "End world Hunger",
        "Start strength training",
        "Walk for 30 minutes",
        "Solve the gravity equation",
        "Read for 20 minutes",
        "Go lift heavy items"
    ]
    
    @State var showingAlert: Bool = false
    @State var newItem = ""
    
    func addNewItem() {
        print("Added item")
        todos.append(newItem)
        newItem = ""
    }
    
    var body: some View {
        NavigationStack {
            List($todos, id: \.self, editActions: .all) { $todoItem in
                Text(todoItem)
            }
            .navigationTitle("To Do List")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showingAlert.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }.alert("What do you need to do?", isPresented: $showingAlert) {
            TextField("Add item here", text: $newItem)
            Button {
                addNewItem()
            } label: {
                Text("OK")
            }
        }
    }
}

#Preview {
    ContentView()
}
