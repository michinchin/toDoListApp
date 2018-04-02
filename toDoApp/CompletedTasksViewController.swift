//
//  CompletedTasksViewController.swift
//  toDoApp
//
//  Created by Abigail Chin on 4/2/18.
//  Copyright © 2018 Abigail Chin. All rights reserved.
//

import Foundation
import UIKit

class CompletedTasksViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completedTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "completedCell")!
        cell.textLabel?.text = completedTasks[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            completedTasks.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    
    
}
