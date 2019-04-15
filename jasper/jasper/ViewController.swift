//
//  ViewController.swift
//  jasper
//
//  Created by User16 on 2019/4/15.
//  Copyright © 2019 User16. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    
   
    @IBOutlet weak var answerText: UITextView!
    
    @IBOutlet weak var BirthDatePicker: UIDatePicker!
    @IBOutlet weak var SOSegmentControl: UISegmentedControl!
    @IBOutlet weak var SexSwitch: UISwitch!
    @IBOutlet weak var NameTextField: UITextField!
    
    @IBOutlet weak var LuckSlider: UISlider!
    @IBOutlet weak var LuckShow: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func LuckSlider(_ sender: UISlider) {
         LuckShow.text = String(format: "%d", Int(LuckSlider.value))
    }
    
    @IBAction func Keyboard(_ sender: UITextField) {
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override  func touchesBegan(_ touches:Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    var hasSO = false
    
    
    @IBAction func SOsegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{hasSO = false}
        else if sender.selectedSegmentIndex == 1{hasSO = true}
    }
    
    
    var dayString = ""
    var monthString = ""
    var yearString = ""
    @IBAction func BirthDatePicker(_ sender: UIDatePicker) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day,.month,.year], from: self.BirthDatePicker.date);
        if let day = components.day, let month = components.month, let year = components.year {
            dayString = String(day)
            monthString = String(month)
            yearString = String(year)
        }
    }
    var sex = 1
    @IBAction func sexSwitch(_ sender: UISwitch) {
        if SexSwitch.isOn {sex = 0 }   //girl
        else {sex = 1}   //boy
    }
    var luck = 0
    
    
    @IBAction func calculateButton(_ sender: UIButton) {
        let random = Int.random(in: 0...10)
        if sex == 0 {
        if hasSO == true{answerText.text = "Hello Miss " + NameTextField.text! + " You have a Boyfriend/Girlfriend already, You are lucky enough you ungrateful jerk, Piss off"}
        else {
            if monthString == "7"
            {
                answerText.text = "Hello Miss " + NameTextField.text! + "!" + " Born in July! You lucky Dude!!!"
                
            }
            else {
            if Int(LuckShow.text!) == random {
                
            answerText.text = "Hello Miss " + NameTextField.text! + "!" + " You are lucky"
            }
            else if Int(LuckShow.text!) != random{
            answerText.text = "Hello Miss " + NameTextField.text! + "!" + " Not so lucky"
            }
            }
        }
    }
        else if sex == 1 {
            if hasSO == true{answerText.text = "Hello Mr " + NameTextField.text! + " You have a Boyfriend/Girlfriend already, You are lucky enough you ungrateful jerk, Piss off"}
            else {
                if monthString == "7"
                {
                    answerText.text = "Hello Mr " + NameTextField.text! + "!" + " Born in July! You lucky Dude!!!"
                    
                }
                else {
                    if Int(LuckShow.text!) == random {
                        
                        answerText.text = "Hello Mr " + NameTextField.text! + "!" + " You are lucky"
                    }
                    else if Int(LuckShow.text!) != random{
                        answerText.text = "Hello Mr " + NameTextField.text! + "!" + " Not so lucky"
                    }
                }
            }
        }
}
}
