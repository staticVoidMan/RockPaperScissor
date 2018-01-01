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
        XCTAssertTrue(isToolBetter, "Paper should win over a rock")
    }
    
    func testScissorBeatsPaper() {
        let scissor = RockPaperScissorGame.GameTool.scissor
        let paper = RockPaperScissorGame.GameTool.paper
        
        let isToolBetter = game.toolIsBetter(scissor, than: paper)
        XCTAssertTrue(isToolBetter, "Scissor should win over paper")
    }
    
    func testRockBeatsScissor() {
        let rock = RockPaperScissorGame.GameTool.rock
        let scissor = RockPaperScissorGame.GameTool.scissor
        
        let isToolBetter = game.toolIsBetter(rock, than: scissor)
        XCTAssertTrue(isToolBetter, "Rock should win over scissor")
    }
    
}
