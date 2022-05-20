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
    //Use Published to update views when object changed, should be used with OberservableObject
    @Published var items: [ItemModel] = [] {
        //Every time the array changes, saveItems function will be called
        didSet { saveItems() }
    }
    let itemsKey: String = "items_list"
    
    //Initializer
    init() {
        getItems()
    }
    
    //get items from user defaults
    func getItems() {
        //Get the data and try to decode the data from Userdefaults
        //if there is the item data, then return the items array, if not, just return null
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = saveItems
    }
    
    //Delete item function
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    //Change position fucntion, change the order of the items
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    //Create new item and save the new item to the item list
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    //Update the item's completion status
    func updateItem(item: ItemModel) {
        //When click the specifc item, find this item in the array list, then change its styles
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    //transfer the item data to json format, and put the data in the user defaults
    func saveItems() {
        if let endcodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(endcodedData, forKey: itemsKey)
        }
    }
}
