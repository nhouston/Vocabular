//
//  testingVocab.swift
//  assignment
//
//  Created by Neil Houston on 24/11/2018.
//  Copyright © 2018 Neil Houston. All rights reserved.
//

import UIKit

class testingVocab: UIViewController, UITextFieldDelegate {
    
    var arrIndex: Int = 0
    var points: Int = 0

    @IBOutlet weak var wordToTest: UILabel!
    @IBOutlet weak var showTranslation: UISwitch!
    @IBOutlet weak var translationText: UITextField!
    @IBOutlet weak var pointsSystem: UILabel!
    
    @IBAction func checkTranslation(_ sender: UIButton) {
        if(translationText.text == addedVocabLearning.sharedInstance[arrIndex]){
            //then show alert view that answer is correct
            let alert = UIAlertController(title: "Your Translation is: Correct!!", message: "", preferredStyle: UIAlertController.Style.alert)

            // add the actions (buttons)
            let newWord = UIAlertAction(title: "Next Word", style: UIAlertAction.Style.default){
                UIAlert in
                /* Load the next word
                 * If the word is in the learnt section then load the next word
                 */
                if (wordsLearnt.sharedInstance.contains("\(wordsToLearn.sharedInstance[self.arrIndex])")){
                    //call function to load next word
                    self.newWordsNext()
                } else {
                    
                    //append the word that was successfully learnt to the words learnt instance
                    wordsLearnt.sharedInstance.append("\(wordsToLearn.sharedInstance[self.arrIndex])")
                    wordsLearntTranslation.sharedInstance.append("\(wordsToLearnTranslation.sharedInstance[self.arrIndex])")
                    // word score is the length of the word
                    self.points = self.points + (self.translationText.text?.count)!
                    //show the points
                    self.pointsSystem.text = "\(self.points)"
                    // set the labels & textfield to empty ready for next word
                    self.wordToTest.text = ""
                    self.translationText.text = ""
                    //set the translation label text to empty
                    if self.showTranslation.isOn {
                        self.wordToTest.text = ""
                    } else {
                        self.wordToTest.text = ""
                    }
                    //call next word
                    self.newWordsNext()
                }
            }
        
            alert.addAction(newWord)
            
            alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.green
            // show the alert
            self.present(alert, animated: true, completion: nil)
        } else {
            //if the answer does not match then show an alert view that the answer is incorrect
            //then show alert view that answer is correct
            let alert = UIAlertController(title: "Your Translation is: Wrong! Please try again.", message: "", preferredStyle: UIAlertController.Style.alert)
            
            // add the actions (buttons)
            let retryWord = UIAlertAction(title: "Try again", style: UIAlertAction.Style.default){
                UIAlert in
                //incorrect word - lose 5 points
                self.points = self.points - 5
                self.pointsSystem.text = "\(self.points)"
                self.translationText.text = ""
            }
            
            alert.addAction(retryWord)
            
            alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.red
            alert.view.tintColor = UIColor.white
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }
    /*Function to get the next word from the array of words to learn*/
    @IBAction func testNewWord(_ sender: UIButton) {
        // get the next word in the array, allow array to wrap so that tests can be continued
        if (arrIndex >= wordsToLearn.sharedInstance.count-1){
            arrIndex = 0
            self.wordToTest.text = wordsToLearn.sharedInstance[arrIndex]
        }else {
            arrIndex += 1
            self.wordToTest.text = wordsToLearn.sharedInstance[arrIndex]
        }
    }
    
    @IBAction func showTheTranslation(_ sender: UISwitch) {
        //show the correct translation of the word ready for when switch is turned on
        if showTranslation.isOn {
            self.wordToTest.text = wordsToLearnTranslation.sharedInstance[arrIndex]
        } else {
            self.wordToTest.text = wordsToLearn.sharedInstance[arrIndex]
        }
    }
    
    /*Function to get the next word from the array of words to learn*/
    func newWordsNext(){
        // get the next word in the array, allow array to wrap so that tests can be continued
        if (arrIndex >= wordsToLearn.sharedInstance.count-1){
            arrIndex = 0
            self.wordToTest.text = wordsToLearn.sharedInstance[arrIndex]
        }else {
            arrIndex += 1
            self.wordToTest.text = wordsToLearn.sharedInstance[arrIndex]
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showTranslation.setOn(false, animated:true)
        //intitial word to test loaded.
        self.wordToTest.text = wordsToLearn.sharedInstance[arrIndex]
        //points intialised 
        self.pointsSystem.text = "\(self.points)"
        translationText.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "testSegue"{
     }
    }
    */

}
