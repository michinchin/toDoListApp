//
//  Section.swift
//  toDoApp
//
//  Created by Abigail Chin on 3/16/18.
//  Copyright © 2018 Abigail Chin. All rights reserved.
//

import Foundation

struct Section{
    var dayOfTheWeek: String
    var toDos: [String]
    var expanded: Bool
    
    init(dayOfTheWeek: String, toDos: [String], expanded: Bool){
        self.dayOfTheWeek = dayOfTheWeek
        self.toDos = toDos
        self.expanded = expanded
    }
    
    
}
