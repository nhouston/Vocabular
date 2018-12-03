//
//  SettingsView.swift
//  assignment
//
//  Created by Neil Houston on 19/11/2018.
//  Copyright © 2018 Neil Houston. All rights reserved.
//

import UIKit

class SettingsView: UIViewController {

    var loadLan = Languages()
    
    @IBOutlet weak var currentNative: UILabel!
    
    @IBOutlet weak var currentLearningLangauge: UILabel!
    
    @IBAction func reset(sender: UIButton) {
        //remove everything from arrays
        addedVocab.sharedInstance.removeAll()
        addedVocabLearning.sharedInstance.removeAll()
        wordsToLearn.sharedInstance.removeAll()
        wordsToLearnTranslation.sharedInstance.removeAll()
        wordsLearnt.sharedInstance.removeAll()
        wordsLearntTranslation.sharedInstance.removeAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLan.load()
        //show the current native and learning language settings
        self.currentNative.text = "\(loadLan.getNative())"
        self.currentLearningLangauge.text = "\(loadLan.getLearning())"
        
    }
    

    
    // MARK: - Navigation
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
    }
    */

}
