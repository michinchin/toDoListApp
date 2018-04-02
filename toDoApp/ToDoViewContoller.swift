//
//  ToDoViewContoller.swift
//  toDoApp
//
//  Created by Abigail Chin on 2/27/18.
//  Copyright © 2018 Abigail Chin. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController{
    
    var toDos: ["wash dishes", "eat food"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toDo = toDos[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell")! //don't want to create a new cell every time, but resuse cell
        cell.textLabel?.text = toDo //edit text of the cell
        return cell
    }
    
    
    
    
}
