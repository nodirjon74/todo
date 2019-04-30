//
//  TodoItem.swift
//  ToDoApp
//
//  Created by Nodirjon on 3/1/19.
//  Copyright © 2019 Nodirjon. All rights reserved.
//

import Foundation
import UIKit

struct TodoItem: Codable {
    var title: String
    var completed: Bool
    var createdAt: Date
    var itemIdentifier: UUID
    
    func saveItem() {
        DataManager.save(self, with: itemIdentifier.uuidString)
    }
    func deleteItem() {
        DataManager.delete(itemIdentifier.uuidString)
    }
    mutating func markAsCompleted() {
        self.completed = true
        DataManager.save(self, with: itemIdentifier.uuidString)
        
    }
}
