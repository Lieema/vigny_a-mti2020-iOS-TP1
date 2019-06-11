//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Epita on 17/05/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class ToDoItem {
    var itemName:String
    var completed:Bool
    var creationDate:Date
    init(itemName:String) {
        self.itemName = itemName
        completed = false
        creationDate = Date()
    }
}
