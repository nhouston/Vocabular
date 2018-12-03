//
//  addWords.swift
//  assignment
//
//  Created by Neil Houston on 16/11/2018.
//  Copyright © 2018 Neil Houston. All rights reserved.
//

import UIKit

class addWords: UITableViewController {
    
    
    
    @IBAction func comeBackFromAdding(segue: UIStoryboardSegue){
        if segue.identifier == "addingNewWordSegue" {
            print("Added")
            self.tableView.reloadData()
        }
    }
    
    @IBAction func comeBackFromLearntWords(segue: UIStoryboardSegue){
        if segue.identifier == "addingToLearnt" {
            print("Added")
            self.tableView.reloadData()
        }
    }
    @IBAction func comeBackFromMovingWords(segue: UIStoryboardSegue){
        if segue.identifier == "addingToLearnt" {
            print("Added")
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        //return 3 sections - all vocab, learning, learnt
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //retrun the size for each section from the size of the array
        if(section == 0){
            return addedVocab.sharedInstance.count
        } else if(section == 1){
            return wordsLearnt.sharedInstance.count
        } else {
            return wordsToLearn.sharedInstance.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)
        //define what each cell says for native and translation as with the array
        if(indexPath.section == 0){
        cell.textLabel?.text = addedVocab.sharedInstance[indexPath.row]
            cell.detailTextLabel?.text = addedVocabLearning.sharedInstance[indexPath.row]
            cell.backgroundColor = UIColor.white
            
        } else if(indexPath.section == 1){
            cell.textLabel?.text = wordsLearnt.sharedInstance[indexPath.row]
            cell.detailTextLabel?.text = wordsLearntTranslation.sharedInstance[indexPath.row]
            cell.backgroundColor = UIColor.green
            
        } else{
            cell.textLabel?.text = wordsToLearn.sharedInstance[indexPath.row]
            cell.detailTextLabel?.text = wordsToLearnTranslation.sharedInstance[indexPath.row]
            cell.backgroundColor = UIColor.red
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //section header titles
        if(section == 0){
            return "All Words"
        } else if(section == 1){
            return "Words Learnt"
        }
        else{
            return "Words to learn"
        }
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //if section selected reload data and delselect selection
        if(indexPath.section == 0){
            self.tableView.reloadData()
            tableView.deselectRow(at: indexPath, animated: true)
        }else if(indexPath.section == 1){
            self.tableView.reloadData()
            tableView.deselectRow(at: indexPath, animated: true)
        }else {
            self.tableView.reloadData()
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addingToLearnt"{
            let nextVC = segue.destination as! addToLearnt
            nextVC.myParent = self
            if let indexPathToPass = self.tableView.indexPathForSelectedRow {
                nextVC.indexToItem = indexPathToPass.row
            }
        }
    }

}
