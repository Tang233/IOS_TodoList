import Foundation

//make each item unique by creating random string id number
//Use codable to encode and decode the ItemModel instance data
//follow identifiable protocol
struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    //create new item, call the init(id, title, isCompleted)
    //update item, call init(title, isCompleted), the id will not be created again
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    //Change the completion status
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
