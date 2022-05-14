//
//  ItemModel.swift
//  TodoList
//
//  Created by Jin Tang on 14/5/2022.
//

import Foundation

//Imutable Struct
//make each item unique by creating random string id number
struct ItemModel: Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    //create new item, call the init(id, title, isCompleted)
    //upodate item, call init(title, isCompleted), the id will not be created again
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
