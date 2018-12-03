//
//  assignmentTests.swift
//  assignmentTests
//
//  Created by Neil Houston on 22/10/2018.
//  Copyright © 2018 Neil Houston. All rights reserved.
//

import XCTest


class assignmentTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLangaugesChosen(){
        var result = true
        let native: String = "English"
        let learning: String = "Spanish"
        
        let addLan = ChosenLanguages(native: native, learningLanguage: learning)
        
        if addLan.native == native && addLan.learningLanguage == learning {
            result = true
        } else {
            result = false
        }
        
        XCTAssert(result)
    }
    
    func testAddingToVocab(){
        var result = true
        let testWord: String = "Testing"
        
        addedVocab.sharedInstance.append(testWord)
        addedVocabLearning.sharedInstance.append(testWord)
        
        if addedVocab.sharedInstance.contains(testWord) && addedVocabLearning.sharedInstance.contains(testWord){
            result = true
        } else {
            result = false
        }
        XCTAssert(result)
    }
    
    func testReset(){
        var result = false
        
        addedVocab.sharedInstance.append("test")
        
        if addedVocab.sharedInstance.isEmpty && wordsLearnt.sharedInstance.isEmpty && wordsToLearn.sharedInstance.isEmpty {
            result = false
        } else {
            addedVocab.sharedInstance.removeAll()
            wordsLearnt.sharedInstance.removeAll()
            wordsToLearn.sharedInstance.removeAll()
            if addedVocab.sharedInstance.isEmpty && wordsLearnt.sharedInstance.isEmpty && wordsToLearn.sharedInstance.isEmpty {
                result = true
            }
        }
        XCTAssert(result)
    }
    
    func testScoring(){
        var result = false
        
        let pointsTestForWord: Int = 4
        
        wordsToLearn.sharedInstance.append("Test")
        wordsToLearnTranslation.sharedInstance.append("Test")
        
            let word = wordsToLearn.sharedInstance[0]
            let wordLearn = wordsToLearnTranslation.sharedInstance[0]
            
            if word.count == pointsTestForWord && wordLearn.count == pointsTestForWord {
                result = true
            } else {
                result = false
        }
        XCTAssert(result)
    }
    
    
    func testAddingToVocabAndMovingToLearn(){
        var result = true
        
        addedVocab.sharedInstance.append("Add a word")
        addedVocabLearning.sharedInstance.append("Add a words translation")
        
        if (addedVocab.sharedInstance.contains("Add a word") && addedVocabLearning.sharedInstance.contains("Add a words translation")){
            wordsToLearn.sharedInstance.append("Add a word")
            wordsToLearn.sharedInstance.append("Add a words translation")
            if (wordsToLearn.sharedInstance.contains("Add a word") && wordsToLearnTranslation.sharedInstance.contains("Add a words translation")){
                result = true
            }
        } else {
            result = false
        }
        XCTAssert(result)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
