//
//  ViewController.swift
//  toDoApp
//
//  Created by Abigail Chin on 2/27/18.
//  Copyright © 2018 Abigail Chin. All rights reserved.
//

import UIKit

var sections: [Section] = [
    Section(dayOfTheWeek: "Sunday", toDos: [""], expanded: false),
    Section(dayOfTheWeek: "Monday", toDos: [""], expanded: false),
    Section(dayOfTheWeek: "Tuesday", toDos: [""], expanded: false),
    Section(dayOfTheWeek: "Wednesday", toDos: [""], expanded: false),
    Section(dayOfTheWeek: "Thursday", toDos: [""], expanded: false),
    Section(dayOfTheWeek: "Friday", toDos: [""], expanded: false),
    Section(dayOfTheWeek: "Saturday", toDos: [""], expanded: false),
    
]

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, ExpandableHeaderViewDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].toDos.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return ((tableView.bounds.size.height)/7)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { //adjusts height of cell
        if sections[indexPath.section].expanded{
            return (tableView.bounds.size.height)/7
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        let header = ExpandableHeaderView()
        header.customInit(title: sections[section].dayOfTheWeek, section: section, delegate: self)
        return header
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell")!
        cell.textLabel?.text = sections[indexPath.section].toDos[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        
        return cell
    }

    func toggleSection(header: ExpandableHeaderView, section: Int) {
        sections[section].expanded = !sections[section].expanded
        
        tableView.beginUpdates()
        
        for i in 0..<(sections[section].toDos.count){
            tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            sections[indexPath.section].toDos.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

