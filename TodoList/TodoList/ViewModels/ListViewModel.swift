//
//  ListViewModel.swift
//  TodoList
//
//  Created by Jin Tang on 14/5/2022.
//

import Foundation
import UIKit

/*
CRUD function
Create
Read
Update
Delete
 */

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        //Every time the array changes, saveItems function will be called
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        //let newItems = [
        //    ItemModel(title: "This is the first title!", isCompleted: false),
        //    ItemModel(title: "This is the second!", isCompleted: true),
        //    ItemModel(title: "Third!", isCompleted: false),
        //]
        //items.append(contentsOf: newItems)
        //Avoid to use the fake data
        
        //get items from user defaults
        //if there is the data, then return the data, if not, just return null
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = saveItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        //When click the specifc item, find this item in the array list, then change its styles
        //if let index = items.firstIndex{ (existingItem) -> Bool in
        //    return existingItem.id == item.id
        //} {
        //    //run this code
        //}
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    //Use userdefaults to encode and decode the data
    //transfer the item data to json version, and put the data in the user defaults
    func saveItems() {
        if let endcodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(endcodedData, forKey: itemsKey)
        }
    }
}
