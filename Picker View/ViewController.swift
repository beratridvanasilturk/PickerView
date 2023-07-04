//
//  ViewController.swift
//  Picker View
//
//  Created by Berat Rıdvan Asiltürk on 4.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Variables
    @IBOutlet var pickerView: UIPickerView!
    
    @IBOutlet var HourLbl: UILabel!
    @IBOutlet var minuteLbl: UILabel!
    @IBOutlet var secondLbl: UILabel!
    
    var hourArr = Array<String>()
    var minuteArr = Array<String>()
    var secondArr = Array<String>()
    
    //MARK: Function
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitViews()
    }

    private func setInitViews() {
        pickerView.delegate = self
        pickerView.dataSource = self
        
        for i in 0..<24 {
            hourArr.insert("\(i+1)", at: i)
        }
        minuteArr = { for i in 0...60 {
            minuteArr.insert("\(i)", at: i)
        }
            return minuteArr
        }()
        secondArr = minuteArr
    }
}


extension ViewController: UIPickerViewDataSource{
    
   
}

extension ViewController: UIPickerViewDelegate  {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var baslik = ""
        
        switch component {
        case 0: baslik = hourArr[row]
        case 1: baslik = minuteArr[row]
        case 2: baslik = secondArr[row]
        default:
            baslik = ""
        }
        return baslik
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch component {
        case 0: HourLbl.text = hourArr[row]
        case 1: minuteLbl.text = minuteArr[row]
        case 2: secondLbl.text = secondArr[row]
        default:
            HourLbl.text = ""
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView,  numberOfRowsInComponent component: Int) -> Int {
        var numberOfRows = 0
        
        switch component {
        case 0: numberOfRows = 24
        case 1: numberOfRows = 60
        case 2: numberOfRows = 60
        default:
            numberOfRows = 0
        }
        return numberOfRows
    }
    
}

 
