//
//  AddLanguages.swift
//  assignment
//
//  Created by Neil Houston on 13/11/2018.
//  Copyright © 2018 Neil Houston. All rights reserved.
//

import UIKit

class addLanguages: UIViewController, UITextFieldDelegate {
    
    var myLanguages = Languages()
    var firstTimeLoad = false
    
    @IBOutlet weak var newLanguage: UITextField!
    @IBOutlet weak var native: UITextField!

    @IBAction func sendLanguageInfo(_ sender: UIButton) {
        //check if things have been added
            myLanguages.addLanguages(settings: ChosenLanguages(native: native.text!, learningLanguage: newLanguage.text!))
            myLanguages.save()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newLanguage.delegate = self
        native.delegate = self
        myLanguages.load()

        if firstTimeLoad{
            performSegue(withIdentifier: "doFirst", sender: self)
        }

    }
    
    // MARK: - Navigation

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doFirst" {
            //if both text fields or one of each is empty show an alert to say no languages have been added
            if ((native.text?.isEmpty)! || ((newLanguage.text?.isEmpty)!)){
            let alert = UIAlertController(title: "No Languages inputted", message: "Please input your Native language and the langauge you'd like to learn", preferredStyle: UIAlertController.Style.alert)
    
    // add the actions (buttons)
    let noLanguages = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){
    UIAlert in
    }
    
    alert.addAction(noLanguages)
    
    self.present(alert, animated: true, completion: nil)
            }
        }
    }

 

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
