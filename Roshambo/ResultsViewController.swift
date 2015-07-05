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
        
        var name = ""
        
        switch (match.winner) {
        case .Rock:
            name = "RockCrushesScissors"
        case .Paper:
            name = "PaperCoversRock"
        case .Scissors:
            name = "ScissorsCutPaper"
        }
        
        return UIImage(named: name)!
    }
}