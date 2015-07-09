//
//  HistoryTableViewController.swift
//  Roshambo
//
//  Created by Tu Tong on 7/8/15.
//  Copyright (c) 2015 Tu Tong. All rights reserved.
//

import UIKit


class HistoryTableViewController: UITableViewController {
    
    var history: [RPSMatch]!
    
    static let CellIdentifier = "historyTableCell"
    
    override func viewDidLoad() {
        self.history = AppDelegate.sharedDelegate().history
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.history.count
    }
    
    func resultString(match: RPSMatch) -> String {
        return match.p1.defeats(match.p2) ? "You Win!" : "You Lose!"
    }
    
    func imageForMatch(match: RPSMatch) -> UIImage {
        
        if match.p1 == match.p2 {
            return UIImage(named: "itsATie")!
        }
        
        let resultsImgNames = ["RockCrushesScissors", "PaperCoversRock", "ScissorsCutPaper"]
        return UIImage(named: resultsImgNames[match.winner.rawValue])!
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(HistoryTableViewController.CellIdentifier,
            forIndexPath: indexPath) as! RPSTableViewCell
        let match = self.history[indexPath.row]
        cell.lblResults.text = self.resultString(match)
        cell.imgViewP1.image = UIImage(named: ResultsViewController.imageNames[match.p1.rawValue])
        cell.imgViewP2.image = UIImage(named: ResultsViewController.imageNames[match.p2.rawValue])
        
        return cell
    }
    
    
    @IBAction func dismissAction(sender: AnyObject) {
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
        
    }
}
