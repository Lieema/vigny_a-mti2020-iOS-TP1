//
//  ToDoListTableViewController.swift
//  ToDoList
//
//  Created by Epita on 17/05/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {

    var toDoItems = [ToDoItem]()
    var selectedRow: Int?
    var selectedItem: ToDoItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadInitialData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nv = segue.destination as! UINavigationController
        
        if (nv.topViewController is UpdateTodoItemViewController){
            let vc = nv.topViewController as? UpdateTodoItemViewController
            vc?.item = selectedItem
            vc?.row = selectedRow
        }
    }
    
    // MARK: - Table view data source

    func loadInitialData(){
        let item1 = ToDoItem(itemName: "Buy milk")
        toDoItems.append(item1)
        let item2 = ToDoItem(itemName: "Buy eggs")
        toDoItems.append(item2)
        let item3 = ToDoItem(itemName: "Read a book")
        toDoItems.append(item3)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoItems.count
    }

    @IBAction func unwindToList(_ segue:UIStoryboardSegue){
        if let source = segue.source as? AddTodoItemViewController {
            if let item = source.item {
                toDoItems.append(item)
                tableView.reloadData()
            }
        }
        else if let source = segue.source as?
            UpdateTodoItemViewController {
            if let type = source.type, type == 2,
                let item = source.item,
                let row = source.row {
                toDoItems[row] = item
                tableView.reloadData()
            }
            else if let type = source.type, type == 1,
                let row = source.row {
                toDoItems.remove(at: row)
                tableView.reloadData()
            }
            else if let type = source.type, type != 0 {
                print("fail to update")
            }
            selectedRow = nil
            selectedItem = nil
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)

        // Configure the cell...
        if indexPath.row < toDoItems.count {
            let todoItem = toDoItems[indexPath.row]
            cell.textLabel?.text = todoItem.itemName
            if todoItem.completed {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        let color = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
        cell.backgroundColor = color
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath:
        IndexPath) {
        if indexPath.row < toDoItems.count {
            let todoItem = toDoItems[indexPath.row]
            todoItem.completed = !todoItem.completed
            tableView.reloadRows(at: [indexPath], with: .none)
            selectedItem = todoItem
            selectedRow = indexPath.row
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
 */
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") {
            (rowAction, indexPath) in
            self.selectedItem = self.toDoItems[indexPath.row]
            self.selectedRow = indexPath.row
            self.performSegue(withIdentifier: "update", sender: nil)
        }
        editAction.backgroundColor = .green
        let deleteAction = UITableViewRowAction(style: .normal, title: "Delete") {
            (rowAction, indexPath) in
            self.toDoItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        deleteAction.backgroundColor = .red
        return [editAction,deleteAction]
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let item = toDoItems[fromIndexPath.row]
        toDoItems.remove(at: fromIndexPath.row)
        toDoItems.insert(item, at: to.row)
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

