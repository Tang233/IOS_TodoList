//
//  ListView.swift
//  TodoList
//
//  Created by Jin Tang on 13/5/2022.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [itemModel] = [
        itemModel(title: "This is the first title!", isComplete: false),
        itemModel(title: "This is the second!", isComplete: true),
        itemModel(title: "Third!", isComplete: false),
    ]
    
    var body: some View {
        List {
            ForEach(items){ item in
                ListRowView(item: item)
            }
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add",destination: AddView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}


