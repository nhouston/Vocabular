//
//  addWordsNewVC.swift
//  assignment
//
//  Created by Neil Houston on 16/11/2018.
//  Copyright © 2018 Neil Houston. All rights reserved.
//

import UIKit

class addWordsNewVC: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet weak var newWord: UITextField!
    @IBOutlet weak var translationWord: UITextField!

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newWord.delegate = self
        translationWord.delegate = self

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addingNewWordSegue"{
            // show an alert if no text has been entered in the text fields - please inout a word
            if ( (newWord.text?.isEmpty)! && (translationWord.text?.isEmpty)!){
                let alert = UIAlertController(title: "No Word Entered", message: "Please input a word", preferredStyle: UIAlertController.Style.alert)
                
                // add the actions (buttons)
                let noLanguages = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){
                    UIAlert in
                }
                
                alert.addAction(noLanguages)
                
                self.present(alert, animated: true, completion: nil)
            } else if (addedVocab.sharedInstance.contains(newWord.text!)){
                //if a text has been entered that already exists, clear text fields, and show an alert to say word already exists
                self.newWord.text = ""
                self.translationWord.text = ""
                let alert = UIAlertController(title: "You've already added this word", message: "Please input a different word", preferredStyle: UIAlertController.Style.alert)
                
                // add the actions (buttons)
                let noLanguages = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){
                    UIAlert in
                    
                }
                
                alert.addAction(noLanguages)
                
                self.present(alert, animated: true, completion: nil)
            }else{
                //if both textfields have been filled then append word to all vocab and to words to learn sections
            addedVocab.sharedInstance.append(newWord.text!)
            addedVocabLearning.sharedInstance.append(translationWord.text!)
                wordsToLearn.sharedInstance.append(newWord.text!)
                wordsToLearnTranslation.sharedInstance.append(translationWord.text!)
            }
        }
    }
    

}
