//
//  RPS.swift
//  Roshambo
//
//  Created by Tu Tong on 7/3/15.
//  Copyright (c) 2015 Tu Tong. All rights reserved.
//

//
//  RPS
//  RockPaperScissors
//
//  Created by Jason on 11/14/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import Foundation

// The RPS enum represents a move.

enum RPS: Int {
    case Rock = 0, Paper, Scissors
    
    // init method randomly generate opponent's move
    init() {
        // randomly generates Int from 0 to 2
        let randomValue = Int(arc4random() % 3)
        self = RPS(rawValue: randomValue)!
    }
    
    // The defeats method defines the hierarchy of moves, Rock defeats Scissors etc.
    func defeats(opponent: RPS) -> Bool {
        switch (self, opponent) {
        case (.Paper, .Rock), (.Scissors, .Paper), (.Rock, .Scissors):
            return true;
        default:
            return false;
        }
    }
}

extension RPS: Printable {
    var description: String {
        get {
            switch (self) {
            case .Rock:
                return "Rock"
            case .Paper:
                return "Paper"
            case .Scissors:
                return "Scissors"
            }
        }
    }
}