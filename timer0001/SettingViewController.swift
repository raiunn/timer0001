//
//  SettingViewController.swift
//  timer0001
//
//  Created by 梅北文仁 on 2018/05/24.
//  Copyright © 2018年 梅北文仁. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController , UIPickerViewDataSource , UIPickerViewDelegate{
    
    let valueArrey : [Int] = [10,30, 60,120, 180]
    let settingKey = "timerValue"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerPicker.delegate = self
        timerPicker.dataSource = self
        
        let settings = UserDefaults.standard
        let timerValue = settings.integer(forKey: settingKey)
        // Do any additional setup after loading the view.
        
        for row in 0..<valueArrey.count {
            if valueArrey [row] == timerValue{
                timerPicker.selectRow(row, inComponent:0 , animated : true)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var timerPicker: UIPickerView!
    @IBAction func chooseAction(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return valueArrey.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  String(valueArrey [row])
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let settings = UserDefaults.standard
        settings.setValue(valueArrey[row], forKey: settingKey)
        settings.synchronize()
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
