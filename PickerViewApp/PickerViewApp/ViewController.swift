//
//  ViewController.swift
//  PickerViewApp
//
//  Created by Apple on 16/06/17.
//  Copyright © 2017 Valuesol. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIPickerViewDataSource,UIPickerViewDelegate{
    
    @IBOutlet var textField:UITextField!
    @IBOutlet var textField1:UITextField!
    @IBOutlet var datePickerView:UIPickerView!
    @IBOutlet var CancleButton: UIBarButtonItem!
    @IBOutlet var ToolBar:UIToolbar!
    
    let daysPicker = UIPickerView()
    
    var pickerDaysmonth = [["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"],["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]];
    var Days = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.datePickerView.delegate = self
        self.datePickerView.dataSource = self
        daysPicker.dataSource = self
        daysPicker.delegate = self
        
    }
    @IBAction func canclebtntapped() {
        self.datePickerView.isHidden = true
        self.ToolBar.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == daysPicker {
            return Days.count
            
        } else if pickerView == datePickerView{
            return self.pickerDaysmonth[component].count
        }
        
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == daysPicker {
            return Days[row]
        }
        return self.pickerDaysmonth[component][row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == daysPicker {
            textField1.text = Days[row]
            self.view.endEditing(false)
            return
        }
        
        let days =  pickerDaysmonth[0][pickerView.selectedRow(inComponent: 0)]
        let month = pickerDaysmonth[1][pickerView.selectedRow(inComponent: 1)]
        textField.text =   days + " " + month
        
        
    }
}

