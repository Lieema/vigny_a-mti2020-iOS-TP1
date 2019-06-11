//
//  AddTodoItemViewController.swift
//  ToDoList
//
//  Created by epita on 10/05/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class AddTodoItemViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var buttonDone: UIBarButtonItem!
    var item: ToDoItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional set/Users/epita/Desktop/ToDoList/ToDoList/Base.lproj/Main.storyboardup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you wil/Users/epita/Desktop/ToDoList/ToDoList/Base.lproj/Main.storyboardl often want to do a little preparation before navigation*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let sender = sender as? UIBarButtonItem, sender == buttonDone {
            if let text = textField.text, text.count > 0 {
                item = ToDoItem(itemName: text)
            }
        }
    }
}
