//
//  UpdateTodoNavController.swift
//  ToDoList
//
//  Created by Axel on 11/06/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class UpdateTodoNavController: UINavigationController {
    
    var item: ToDoItem?
    var row: Int?
    var type: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print (segue.destination)
        if (segue.destination is UpdateTodoItemViewController){
            let vc = segue.destination as? UpdateTodoItemViewController
            vc?.item = item
            vc?.row = row
            print(item?.itemName)
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
