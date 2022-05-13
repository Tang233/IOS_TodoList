//
//  ItemModel.swift
//  TodoList
//
//  Created by Jin Tang on 14/5/2022.
//

import Foundation

//make each item unique by creating random string id number
struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isComplete: Bool
}
