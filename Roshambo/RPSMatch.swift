//
//  RPSMatch.swift
//  Roshambo
//
//  Created by Tu Tong on 7/3/15.
//  Copyright (c) 2015 Tu Tong. All rights reserved.
//

//
//  SingleMatch.swift
//  RockPaperScissors
//
//  Created by Jason on 11/14/14.
//  Copyright (c) 2014 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation

// The RPSMatch struct stores the results of a match.
// Later in the course we will store multiple matches in an array, so users can track their match history.
struct RPSMatch {
    
    let p1: RPS
    let p2: RPS
    
    init(p1: RPS, p2: RPS) {
        self.p1 = p1
        self.p2 = p2
    }
    
    var winner: RPS {
        get {
            return p1.defeats(p2) ? p1 : p2
        }
    }
    
    var loser: RPS {
        get {
            return p1.defeats(p2) ? p2 : p1
        }
    }
}
