//
//  UpdateTodoItemViewController.swift
//  ToDoList
//
//  Created by Axel on 11/06/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class UpdateTodoItemViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var buttonUpdate: UIButton!
    @IBOutlet weak var buttonDelete: UIBarButtonItem!
    var item: ToDoItem?
    var row: Int?
    var type: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let todoName = item?.itemName {
            textField.textColor = .black
            textField.isEnabled = true
            buttonDelete.isEnabled = true
            buttonUpdate.isEnabled = true
            textField.text = todoName
        }
        else {
            textField.textColor = .red
            textField.isEnabled = false
            buttonDelete.isEnabled = false
            buttonUpdate.isEnabled = false
            textField.text = "No Item Selected"
        }
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let sender = sender as? UIBarButtonItem, sender == buttonDelete {
            type = 1
        }
        else if let sender = sender as? UIButton, sender ==
            buttonUpdate {
            if let text = textField.text, text.count > 0 {
                item = ToDoItem(itemName: text)
                type = 2
            }
        }
        else {
            type = 0
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
