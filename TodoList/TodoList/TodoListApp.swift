//
//  TodoListApp.swift
//  TodoList
//
//  Created by Jin Tang on 13/5/2022.
//
//123
import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
