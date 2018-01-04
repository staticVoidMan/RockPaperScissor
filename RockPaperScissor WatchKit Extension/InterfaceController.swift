//
//  InterfaceController.swift
//  RockPaperScissor WatchKit Extension
//
//  Created by Amin Siddiqui on 29/12/17.
//  Copyright © 2017 svmLogics. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var imgVChallengeTool: WKInterfaceImage!
    @IBOutlet var challengeOptions: WKInterfaceGroup!
    
    @IBOutlet var btnRock: WKInterfaceButton!
    @IBOutlet var btnPaper: WKInterfaceButton!
    @IBOutlet var btnScissor: WKInterfaceButton!
    
    @IBOutlet var lblWinLevel: WKInterfaceLabel!
    
    var challengeTool: RockPaperScissorGame.GameTool!
    var level = 0
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        updateUI()
        setChallengeTool()
    }
    
    fileprivate func updateUI() {
        btnRock.setBackgroundImage(UIImage(named: "rock"))
        btnPaper.setBackgroundImage(UIImage(named: "paper"))
        btnScissor.setBackgroundImage(UIImage(named: "scissor"))
    }
    
    fileprivate func setChallengeTool() {
        challengeTool = RockPaperScissorGame().selectRandomTool()
        
        let image = UIImage(named: "\(challengeTool!)")
        imgVChallengeTool.setImage(image)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    fileprivate func checkWin(_ isWin: Bool?) {
        
        if isWin == true {
            level += 1
        }
        else if isWin == false {
            level = max(level - 1, 0)
        }
        
        lblWinLevel.setText("\(level)/20")
        
        setChallengeTool()
    }
    
    @IBAction func btnRock_Action() {
        let isWin = RockPaperScissorGame().toolIsBetter(RockPaperScissorGame.GameTool.rock,
                                                        than: challengeTool)
        checkWin(isWin)
    }
    
    @IBAction func btnPaper_Action() {
        let isWin = RockPaperScissorGame().toolIsBetter(RockPaperScissorGame.GameTool.paper,
                                            than: challengeTool)
        checkWin(isWin)
    }
    
    @IBAction func btnScissor_Action() {
        let isWin = RockPaperScissorGame().toolIsBetter(RockPaperScissorGame.GameTool.scissor,
                                            than: challengeTool)
        checkWin(isWin)
    }
    

}
