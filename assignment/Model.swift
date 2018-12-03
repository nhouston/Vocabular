//
//  Model.swift
//  assignment
//
//  Created by Neil Houston on 15/11/2018.
//  Copyright © 2018 Neil Houston. All rights reserved.
//

import UIKit

class Languages {
    
    func addLanguages(settings: ChosenLanguages) {
        languageSettings = settings
    }
    var languageSettings = ChosenLanguages(native: "<#T##String#>", learningLanguage: "<#T##String#>")
    
    func load(){
        if fileExistsInDocuments("languageSettings.plist"){
            let languageURL = urlToFileInDocuments("languageSettings.plist")
            print(languageURL)
            if let dataFromFile = try? Data(contentsOf: languageURL){
                let decoder = PropertyListDecoder()
                if let loadedState = try? decoder.decode(ChosenLanguages.self, from: dataFromFile){
                    languageSettings = loadedState
                    print(loadedState)
                }
            }
        }
    }
    
    func save(){
        let languages = urlToFileInDocuments("languageSettings.plist")
        print(languages)
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        if let data = try? encoder.encode(languageSettings){
            print("Encoded data")
            print(String(data: data, encoding: .utf8)!)
            
            try? data.write(to: languages, options: .noFileProtection)
        }
    }
    
    func urlToFileInDocuments( _ fileName:  String) -> URL{
        let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let  fileURL = docDir.appendingPathComponent(fileName)
        print(fileURL)
        return fileURL
        
    }
    
    func fileExistsInDocuments(_ fileName: String) -> Bool {
        let fileManager = FileManager.default
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDir = dirPaths[0]
        let filepathName = docsDir + "/\(fileName)"
        return fileManager.fileExists(atPath: filepathName)
    }
    
    func getNative() -> String{
        return languageSettings.native
    }
    
    func getLearning() -> String{
        return languageSettings.learningLanguage
    }
}
struct ChosenLanguages:Codable {
    let native: String
    let learningLanguage: String
    
    init(native: String, learningLanguage: String) {
        self.native = native
        self.learningLanguage = learningLanguage
    }
    
    

}



