//
//  RockPaperScissorGame.swift
//  RockPaperScissor
//
//  Created by Amin Siddiqui on 29/12/17.
//  Copyright © 2017 svmLogics. All rights reserved.
//

import WatchKit

class RockPaperScissorGame: NSObject {

    enum GameTool: NSInteger {
        case rock
        case paper
        case scissor
    }
    
    private var challengeTool: GameTool!
    
    func selectRandomTool() -> GameTool {
        challengeTool = GameTool(rawValue: NSInteger(arc4random_uniform(3)))
        return challengeTool
    }
    
    func provideUserToolOptions() -> [GameTool] {
        let toolOptions = [GameTool.rock, GameTool.paper, GameTool.scissor]
        return toolOptions
    }
    
}
