//
//  AskForAssistance.swift
//  InnovationHub
//
//  Created by Andres Ibarra on 2/11/18.
//  Copyright © 2018 Andres Ibarra. All rights reserved.
//

import UIKit
import Foundation
import MessageUI

class AskForAssistance: UIViewController, UITextFieldDelegate, MFMailComposeViewControllerDelegate {
    
    let submitAlert = UIAlertController(title: "Done!", message: "Your submission has been recieved, someone will be with you shortly!", preferredStyle: UIAlertControllerStyle.alert)

    @IBOutlet var returnButton: UIButton!
    
    @IBOutlet var categoryTextBox: UITextField!
    @IBOutlet var assistantTextfield: UITextField!
    
    var categoryPickerView = UIPickerView()
    var assistantPickerView = UIPickerView()
    
    var categories = ["Design/Hacking Lab", "Makerspace", "Virtual Reality Lab", "3D Printing"]
    
    //Assistant names
    /*NOTE: this needs to be updated every semester, and pushed as an update to
            stay up to date. This could be fixed by implementing a firebase basic
            database and updating that and making sure the application always pulls
            from that list in order to have the latest update
     */
    var hackingLabAssitants = ["First Available","Andres Ibarra", "Benjamin Cynamon", "Ariana Davis"]
    var makerspaceAssitants = ["First Available","Robby Nowell","Rienne Saludo", "Cody Vabderpool","Maddie Wieshart"]
    var virtualspaceAssitants = ["First Available","Joshua Barrios", "Rienne Saludo"]
    var printingAssitants = ["First Available","Robby Nowell","Rienne Saludo", "Cody Vabderpool","Maddie Wieshart"]
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var problemDescriptionTextView: UITextView!
    @IBOutlet var submitButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         submitAlert.addAction(UIAlertAction(title: "Return", style: UIAlertActionStyle.default))

        //return button rounded
        returnButton.layer.borderWidth = 2
        returnButton.layer.borderColor = Assist.convertFromHex(hexNum: 0xFFFFFF).cgColor
        returnButton.layer.cornerRadius = 15
        
        submitButton.isHidden = true
        submitButton.layer.cornerRadius = 20
        
        //setting up the pickerView to be able to set the information for the category picker and assitant pickers
        categoryTextBox.delegate = self
        assistantTextfield.delegate = self
        emailTextField.delegate = self
        problemDescriptionTextView.delegate = self
        
        categoryPickerView.delegate = self
        categoryPickerView.dataSource = self
        categoryPickerView.tag = 1
        
        assistantPickerView.delegate = self
        assistantPickerView.dataSource = self
        assistantPickerView.tag = 2
        
        emailTextField.tag = 3
        problemDescriptionTextView.tag = 1
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = Assist.convertFromHex(hexNum: 0xFFFFFF)
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(AskForAssistance.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(AskForAssistance.cancelClick))
        doneButton.tintColor = UIColor.black
        cancelButton.tintColor = UIColor.black
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        categoryTextBox.inputView =  categoryPickerView
        categoryTextBox.inputAccessoryView = toolBar
        
        assistantTextfield.inputView =  assistantPickerView
        assistantTextfield.inputAccessoryView = toolBar
        
    }
    
    //SEND THE EMAIL AS WELL AS GOING TO UPDATE FIREBASE
    @IBAction func clickedSubmit(_ sender: Any) {
        let areaOfAssist = categoryTextBox.text
        let assistant = assistantTextfield.text
        let email = emailTextField.text
        let description = problemDescriptionTextView.text
        
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        }
        
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        
        // Configure the fields of the interface.
        composeVC.setToRecipients(["info@innovation.fsu.edu"])

        if areaOfAssist != nil && assistant != nil && description != nil{
        composeVC.setSubject("Assistance with " + areaOfAssist!  + " with " + assistant!)
            composeVC.setMessageBody(description!, isHTML: false)
            self.present(composeVC, animated: true, completion: nil)
        }
        
        print(areaOfAssist ?? " ",assistant ?? " ",email ?? " ",description ?? " ")
        
    }
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
        self.dismiss(animated: true, completion: nil)
        
    }

}

//HANDLERS FOR TEXTVIEWS AND PICKERS
extension AskForAssistance: UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1{
            return categories.count
        }else if pickerView.tag == 2{
            if categoryTextBox.text == "Design/Hacking Lab"{
                return hackingLabAssitants.count
            }else if categoryTextBox.text == "Makerspace"{
                return makerspaceAssitants.count
            }else if categoryTextBox.text == "Virtual Reality Lab"{
                return virtualspaceAssitants.count
            }else if categoryTextBox.text == "3D Printing"{
                return printingAssitants.count
            }
        }
            
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1{
            return categories[row]
        }else if pickerView.tag == 2{
            if categoryTextBox.text == "Design/Hacking Lab"{
                return hackingLabAssitants[row]
            }else if categoryTextBox.text == "Makerspace"{
                return makerspaceAssitants[row]
            }else if categoryTextBox.text == "Virtual Reality Lab"{
                return virtualspaceAssitants[row]
            }else if categoryTextBox.text == "3D Printing"{
                return printingAssitants[row]
            }
  
        }
    
        return "No Available Data"

     
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1{
           categoryTextBox.text = categories[row]
        }else if pickerView.tag == 2{
            assistantTextfield.text = categories[row]
            if categoryTextBox.text == "Design/Hacking Lab"{
                assistantTextfield.text = hackingLabAssitants[row]
            }else if categoryTextBox.text == "Makerspace"{
                assistantTextfield.text = makerspaceAssitants[row]
            }else if categoryTextBox.text == "Virtual Reality Lab"{
                assistantTextfield.text = virtualspaceAssitants[row]
            }else if categoryTextBox.text == "3D Printing"{
                assistantTextfield.text = printingAssitants[row]
            }
            
        }
        
    }
  
    //handles moving the whole view up and down for readability purposes
    func moveView(distance: Int, up: Bool){
        let duration = 0.3
        let movement: CGFloat = CGFloat(up ? -distance : distance)
        UIView.beginAnimations("animateKeyboard", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(duration)
        self.view.frame = (self.view.frame).offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
        
    }
    
    //event handlers for toolbar
    @objc func doneClick() {
        categoryTextBox.resignFirstResponder()
        assistantTextfield.resignFirstResponder()
    }
    @objc func cancelClick() {
        categoryTextBox.resignFirstResponder()
        assistantTextfield.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //Email Field
        print(textField.tag)
        if textField.tag == 3{
            moveView(distance: 100, up: true)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 3{
            moveView(distance: 100, up: false)
            
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.tag == 1{
            moveView(distance: 120, up: true)
            
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.tag == 1{
            moveView(distance: 120, up: false)
            if categoryTextBox.text != nil && assistantTextfield.text != nil && emailTextField.text != nil && problemDescriptionTextView.text != nil{
                submitButton.isHidden = false
                
            }
            else{
                submitButton.isHidden = true
            }
            
            
        }
    }
    
    // DESCRIPTION:
    // Called when the editing is done on a textfield
    // and the return button is clicked to remove the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        emailTextField.resignFirstResponder()
       
        return false
    }
    
    //allows for user to simply click enter and it makes the keyboard disappear
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
             problemDescriptionTextView.resignFirstResponder()
            return false
        }
        return true
    }
    
    
}
