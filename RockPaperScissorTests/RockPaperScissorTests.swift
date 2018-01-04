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
    
    lazy var game: RockPaperScissorGame = {
        return RockPaperScissorGame()
    }()
    
    func testGameCanGenerateRandomTool() {
        let randomTool = game.selectRandomTool()
        
        XCTAssertTrue(randomTool.rawValue >= RockPaperScissorGame.GameTool.rock.rawValue
            && randomTool.rawValue <= RockPaperScissorGame.GameTool.scissor.rawValue, "Random tool generated: \(randomTool)")
    }
    
    func testUserHasOptions() {
        let options = game.provideUserToolOptions()
        
        XCTAssertTrue(options.count == 3, "There should be 3 selectable tools: Rock, Paper, Scissor")
    }
    
    fileprivate func paperBeatsRock() {
        let isToolBetter = game.toolIsBetter(RockPaperScissorGame.GameTool.paper,
                                             than: RockPaperScissorGame.GameTool.rock)
        XCTAssertTrue(isToolBetter == true, "Paper beats Rock")
    }
    
    fileprivate func scissorBeatsPaper() {
        let isToolBetter = game.toolIsBetter(RockPaperScissorGame.GameTool.scissor,
                                             than: RockPaperScissorGame.GameTool.paper)
        XCTAssertTrue(isToolBetter == true, "Scissor beats Paper")
    }
    
    func rockBeatsScissor() {
        var isToolBetter = game.toolIsBetter(RockPaperScissorGame.GameTool.rock,
                                             than: RockPaperScissorGame.GameTool.scissor)
        XCTAssertTrue(isToolBetter == true, "Rock beats Scissor")
        
        isToolBetter = game.toolIsBetter(RockPaperScissorGame.GameTool.scissor,
                                             than: RockPaperScissorGame.GameTool.rock)
        XCTAssertTrue(isToolBetter == false, "Rock beats Scissor")
    }
    
    fileprivate func rockTiesRock() {
        let isToolBetter = game.toolIsBetter(RockPaperScissorGame.GameTool.rock,
                                             than: RockPaperScissorGame.GameTool.rock)
        XCTAssertTrue(isToolBetter == nil, "Rock ties with Rock")
    }
    
    func testPaperBeatsRock() {
        paperBeatsRock()
    }
    
    func testScissorBeatsPaper() {
        scissorBeatsPaper()
    }
    
    func testRockBeatsScissor() {
        rockBeatsScissor()
    }
    
    func testTieCondition() {
        rockTiesRock()
        
        var isToolBetter = game.toolIsBetter(RockPaperScissorGame.GameTool.paper,
                                             than: RockPaperScissorGame.GameTool.paper)
        XCTAssertTrue(isToolBetter == nil, "Paper ties with Paper")
        
        isToolBetter = game.toolIsBetter(RockPaperScissorGame.GameTool.scissor,
                                         than: RockPaperScissorGame.GameTool.scissor)
        XCTAssertTrue(isToolBetter == nil, "Scissor ties with Scissor")
    }
    
    func testAllPossibleUserWinOptionsAgainstRock() {
        let options = game.provideUserToolOptions()
        
        for toolOption in options {
            if case RockPaperScissorGame.GameTool.rock = toolOption {
                rockTiesRock()
            }
            else if case RockPaperScissorGame.GameTool.paper = toolOption {
                paperBeatsRock()
            }
            else if case RockPaperScissorGame.GameTool.scissor = toolOption {
                rockBeatsScissor()
            }
        }
    }
    
}
