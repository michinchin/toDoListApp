//
//  AddItemViewController.swift
//  toDoApp
//
//  Created by Abigail Chin on 4/1/18.
//  Copyright © 2018 Abigail Chin. All rights reserved.
//
import UIKit
import Foundation

class AddItemViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    @IBOutlet weak var daysOfTheWeekPicker: UIPickerView!
    @IBOutlet weak var toDoInput: UITextField!
    
    var currentRow: Int = 0;
    
    @IBAction func addItem(_ sender: Any) {
        if (toDoInput.text != "")
        {
            sections[currentRow].toDos.append(toDoInput.text!)
            toDoInput.text = ""
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sections[row].dayOfTheWeek
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sections[component].dayOfTheWeek.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentRow = row
    }
    
    
}
