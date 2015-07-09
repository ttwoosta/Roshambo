//
//  RPSViewController.swift
//  Roshambo
//
//  Created by Tu Tong on 7/3/15.
//  Copyright (c) 2015 Tu Tong. All rights reserved.
//

import UIKit

class RPSViewController: UIViewController {

    @IBOutlet weak var btnPaper: UIButton!
    @IBOutlet weak var btnRock: UIButton!
    @IBOutlet weak var btnScissors: UIButton!
    
    var match: RPSMatch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonsAction(sender: UIButton) {
        
        switch (sender) {
        case self.btnPaper:
            throwDown(RPS.Paper)
        case self.btnRock:
            throwDown(RPS.Rock)
        case self.btnScissors:
            throwDown(RPS.Scissors)
        default:
            assert(false, "An unknown button is invoking buttonsAction")
        }
        
    }
    
    func throwDown(playerMove: RPS) {
        
        // generate opponent's move
        let compMove = RPS()
        
        // RPSMatch struct stores the result of a match
        self.match = RPSMatch(p1: playerMove, p2: compMove)
        
        // insert match to history
        var history = AppDelegate.sharedDelegate().history
        history.append(self.match)
        
        // is this a bug?
        // is array an object?
        // why couldn't array retain?
        AppDelegate.sharedDelegate().history = history
        
        
        self.performSegueWithIdentifier("results", sender: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "results" {
            let vc = segue.destinationViewController as! ResultsViewController
            vc.match = self.match
        }
    }


}

