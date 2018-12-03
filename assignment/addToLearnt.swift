//
//  addToLearnt.swift
//  assignment
//
//  Created by Neil Houston on 22/11/2018.
//  Copyright © 2018 Neil Houston. All rights reserved.
//

import UIKit

class addToLearnt: UIViewController {
    
    var myParent: addWords!
    var indexToItem: Int = 0


    @IBAction func addToLearnt(_ sender: UIButton) {
        //when add to learnt button is pressed append words from learning to words learnt
        wordsLearnt.sharedInstance.append("\(wordsToLearn.sharedInstance[indexToItem])")
        wordsLearntTranslation.sharedInstance.append("\(wordsToLearnTranslation.sharedInstance[indexToItem])")
        //remove the old data that has been moved to a different table - with checks to make sure correct one is being moved
        if (indexToItem <= wordsLearnt.sharedInstance.count-1){
            wordsToLearn.sharedInstance.remove(at: indexToItem)
            wordsToLearnTranslation.sharedInstance.remove(at: indexToItem)
            myParent.tableView.reloadData()
        }else {
            wordsToLearn.sharedInstance.remove(at: indexToItem)
            wordsToLearnTranslation.sharedInstance.remove(at: indexToItem)
            myParent.tableView.reloadData()
        }
        
    }
    
    @IBAction func addToLearning(_ sender: UIButton) {
        //when add to learnign button is pressed append words from learnt to words to learn 
        wordsToLearn.sharedInstance.append("\(wordsLearnt.sharedInstance[indexToItem])")
        wordsToLearnTranslation.sharedInstance.append("\(wordsLearntTranslation.sharedInstance[indexToItem])")
        //remove the old data that has been moved to a different table - with checks to make sure correct one is being moved
        if (indexToItem <= wordsToLearn.sharedInstance.count-1){
            wordsLearnt.sharedInstance.remove(at: indexToItem)
            wordsLearntTranslation.sharedInstance.remove(at: indexToItem)
            myParent.tableView.reloadData()
        }else {
            wordsLearnt.sharedInstance.remove(at: indexToItem)
            wordsLearntTranslation.sharedInstance.remove(at: indexToItem)
            myParent.tableView.reloadData()
            
        }
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   
        }*/
    }

