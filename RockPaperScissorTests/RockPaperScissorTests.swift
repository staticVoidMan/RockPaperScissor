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
    
    func testPaperBeatsRock() {
        let paper = RockPaperScissorGame.GameTool.paper
        let rock = RockPaperScissorGame.GameTool.rock
        
        let isToolBetter = game.toolIsBetter(paper, than: rock)
        XCTAssertTrue(isToolBetter == true, "Paper beats Rock")
    }
    
    func testScissorBeatsPaper() {
        let scissor = RockPaperScissorGame.GameTool.scissor
        let paper = RockPaperScissorGame.GameTool.paper
        
        let isToolBetter = game.toolIsBetter(scissor, than: paper)
        XCTAssertTrue(isToolBetter == true, "Scissor beats Paper")
    }
    
    func testRockBeatsScissor() {
        let rock = RockPaperScissorGame.GameTool.rock
        let scissor = RockPaperScissorGame.GameTool.scissor
        
        let isToolBetter = game.toolIsBetter(rock, than: scissor)
        XCTAssertTrue(isToolBetter == true, "Rock beats Scissor")
    }
    
    func testTieCondition() {
        let rock = RockPaperScissorGame.GameTool.rock
        let paper = RockPaperScissorGame.GameTool.paper
        let scissor = RockPaperScissorGame.GameTool.scissor
        
        var isToolBetter = game.toolIsBetter(rock, than: rock)
        XCTAssertTrue(isToolBetter == nil, "Rock ties with Rock")
        
        isToolBetter = game.toolIsBetter(paper, than: paper)
        XCTAssertTrue(isToolBetter == nil, "Paper ties with Paper")
        
        isToolBetter = game.toolIsBetter(scissor, than: scissor)
        XCTAssertTrue(isToolBetter == nil, "Scissor ties with Scissor")
    }
    
    func testAllPossibleUserWinOptionsAgainstRock() {
        let options = game.provideUserToolOptions()
        
        for toolOption in options {
            let isToolBetter = game.toolIsBetter(RockPaperScissorGame.GameTool.rock, than: toolOption)
            
            if case RockPaperScissorGame.GameTool.rock = toolOption {
                XCTAssertTrue(isToolBetter == nil, "Rock ties with Rock")
            }
            else if case RockPaperScissorGame.GameTool.paper = toolOption {
                XCTAssertTrue(isToolBetter == false, "Paper beats Rock")
            }
            else if case RockPaperScissorGame.GameTool.scissor = toolOption {
                XCTAssertTrue(isToolBetter == true, "Rock beats Scissor")
            }
        }
    }
    
}
