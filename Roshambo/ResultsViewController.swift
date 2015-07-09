//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Tu Tong on 7/3/15.
//  Copyright (c) 2015 Tu Tong. All rights reserved.
//

import Foundation
import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var imgViewPlayer: UIImageView!
    @IBOutlet weak var imgViewComp: UIImageView!
    
    @IBOutlet weak var imgViewResults: UIImageView!
    @IBOutlet weak var lblResults: UILabel!
    
    @IBOutlet weak var btnPlayAgain: UIButton!
    
    var match: RPSMatch!
    static let imageNames = ["rock", "paper", "scissors"]
    
    override func viewWillAppear(animated: Bool) {
        // update images
        self.imgViewPlayer.image = UIImage(named: ResultsViewController.imageNames[match.p1.rawValue])
        self.imgViewComp.image = UIImage(named: ResultsViewController.imageNames[match.p2.rawValue])
        
        // update results
        self.lblResults.text = messageForMatch(match)
        self.imgViewResults.image = imageForMatch(match)
        
        // hide image view and label before view appears
        // so that animation will happends
        self.imgViewPlayer.alpha = 0
        self.imgViewComp.alpha = 0
        self.imgViewResults.alpha = 0
        self.lblResults.alpha = 0
        self.btnPlayAgain.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.3, animations: {
            self.imgViewComp.alpha = 1
            self.imgViewPlayer.alpha = 1
            
            }, completion:
            { (bool finished) in
                
                UIView.animateWithDuration(0.3, animations: {
                    self.imgViewResults.alpha = 1
                    self.lblResults.alpha = 1
                    
                    }, completion:
                    { (bool finished) in
                        
                        self.btnPlayAgain.alpha = 1
                })
        })
    }
        
    func messageForMatch(match: RPSMatch) -> String {
        
        // Handle the tie
        if match.p1 == match.p2 {
            return "It's a tie!"
        }
        
        // Here we build up the results message "RockCrushesScissors. You Win!" etc.
        return match.winner.description + " " + victoryModeString(match.winner) + " " + match.loser.description + ". " + resultString(match)
    }
    
    func resultString(match: RPSMatch) -> String {
        return match.p1.defeats(match.p2) ? "You Win!" : "You Lose!"
    }
    
    func victoryModeString(gesture: RPS) -> String {
        switch (gesture) {
        case .Rock:
            return "crushes"
        case .Scissors:
            return "cuts"
        case .Paper:
            return "covers"
        }
    }
    
    func imageForMatch(match: RPSMatch) -> UIImage {
        
        if match.p1 == match.p2 {
            return UIImage(named: "itsATie")!
        }
        
        let resultsImgNames = ["RockCrushesScissors", "PaperCoversRock", "ScissorsCutPaper"]
        return UIImage(named: resultsImgNames[match.winner.rawValue])!
    }
    
    @IBAction func playAgainAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}