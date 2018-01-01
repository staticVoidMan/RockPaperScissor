//
//  RockPaperScissorTests.swift
//  RockPaperScissorTests
//
//  Created by Amin Siddiqui on 29/12/17.
//  Copyright © 2017 svmLogics. All rights reserved.
//

import XCTest
@testable import RockPaperScissor

class RockPaperScissorTests: XCTestCase {
    
    func testGameCanGenerateRandomTool() {
        let game = RockPaperScissorGame()
        let randomTool = game.selectRandomTool()
        
        XCTAssertTrue(randomTool.rawValue >= RockPaperScissorGame.GameTool.paper.rawValue
            && randomTool.rawValue <= RockPaperScissorGame.GameTool.scissor.rawValue, "Computer should have anyone of the 3 selectable tools: Rock, Paper, Scissor")
    }
    
    func testUserHasOptions() {
        let game = RockPaperScissorGame()
        let options = game.provideUserToolOptions()
        
        XCTAssertTrue(options.count == 3, "There should be 3 selectable tools: Rock, Paper, Scissor")
    }
    
}
