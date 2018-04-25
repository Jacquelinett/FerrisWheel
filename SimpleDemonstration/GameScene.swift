//
//  GameScene.swift
//  SimpleDemonstration
//
//  Created by Jacqueline on 10/17/17.
//  Copyright © 2017 Jacqueline. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var background : SKSpriteNode!
    var ferrisWheel : SKSpriteNode!
    var ferrisHandle : SKSpriteNode!
    
    var spinCount = 0
    var tempCount = 0;
    var tempValue = 0;
    
    weak var viewController: GameViewController!
    
    override func didMove(to view: SKView) {
        background = SKSpriteNode(imageNamed: "background.jpeg")
        background.position = CGPoint(x: 0, y: 0)
        background.physicsBody?.pinned = true
        self.addChild(background)
        
        ferrisWheel = SKSpriteNode(imageNamed: "ferris.jpeg")
        ferrisWheel.position = CGPoint(x: frame.midX, y: frame.midY + 10)
        ferrisWheel.physicsBody?.pinned = true
        self.addChild(ferrisWheel)
        
        ferrisHandle = SKSpriteNode(imageNamed: "handle.jpeg")
        ferrisHandle.position = CGPoint(x: frame.midX, y: frame.midY + 10)
        ferrisHandle.physicsBody?.pinned = true
        self.addChild(ferrisHandle)
    }
    
    func spinRectangleXTime(time : Int) {
        spinCount = time;
        viewController.lblStatus.textColor = UIColor.yellow
        viewController.lblStatus.text = "Loop in progress...";
        viewController.lblSliderValue.text = "Slider Value = \(time)";
        viewController.lblCurrentLoop.text = "Current Loop = 0";
        viewController.lblEvaluate.text = "";
        tempCount = 0;
        tempValue = time;
        repeatRunning()
    }
    
    func repeatRunning() {
        
        let wait500 = SKAction.wait(forDuration: 0.5)
        
        viewController.lblCurrentLoop.text = "Current Loop = \(tempCount)";
        
        if (spinCount > 0) {
            spinCount -= 1;
            viewController.lblCondition.textColor = UIColor.yellow
            viewController.lblEvaluate.textColor = UIColor.yellow
            viewController.lblEvaluate.text = "\(tempCount) < \(tempValue)";
            self.run(wait500, completion: evaluate1)
        }
        else {
            viewController.lblSpinAction.textColor = UIColor.white
            viewController.lblCondition.textColor = UIColor.yellow
            viewController.lblEvaluate.textColor = UIColor.yellow
            viewController.lblEvaluate.text = "\(tempCount) < \(tempValue)";
            self.run(wait500, completion: fEvaluate1)            
        }
    }
    
    func fEvaluate1() {
        let wait500 = SKAction.wait(forDuration: 0.5)
        viewController.lblEvaluate.text = "\(tempCount) < \(tempValue).";
        self.run(wait500, completion: fEvaluate2)
    }
    
    func fEvaluate2() {
        let wait500 = SKAction.wait(forDuration: 0.5)
        viewController.lblEvaluate.text = "\(tempCount) < \(tempValue)..";
        self.run(wait500, completion: fEvaluate3)
    }
    
    func fEvaluate3() {
        let wait500 = SKAction.wait(forDuration: 0.5)
        viewController.lblEvaluate.text = "\(tempCount) < \(tempValue)...";
        self.run(wait500, completion: fEvaluateFinal)
    }
    
    func fEvaluateFinal() {
        viewController.lblEvaluate.textColor = UIColor.red
        viewController.lblEvaluate.text = "\(tempCount) < \(tempValue) FALSE";
        
        viewController.lblStatus.textColor = UIColor.green
        viewController.lblStatus.text = "DONE";
    }
    
    func evaluate1() {
        let wait500 = SKAction.wait(forDuration: 0.5)
        viewController.lblEvaluate.text = "\(tempCount) < \(tempValue).";
        self.run(wait500, completion: evaluate2)
    }
    
    func evaluate2() {
        let wait500 = SKAction.wait(forDuration: 0.5)
        viewController.lblEvaluate.text = "\(tempCount) < \(tempValue)..";
        self.run(wait500, completion: evaluate3)
    }
    
    func evaluate3() {
        let wait500 = SKAction.wait(forDuration: 0.5)
        viewController.lblEvaluate.text = "\(tempCount) < \(tempValue)...";
        self.run(wait500, completion: evaluateFinal)
    }
    
    func evaluateFinal() {
        let wait500 = SKAction.wait(forDuration: 0.5)
        
        viewController.lblEvaluate.textColor = UIColor.green
        viewController.lblEvaluate.text = "\(tempCount) < \(tempValue) TRUE";
        
        self.run(wait500, completion: beginSpin)
    }
    
    func beginSpin() {
        let spin = SKAction.rotate(byAngle: CGFloat.pi * 2, duration: 1)
        
        viewController.lblCondition.textColor = UIColor.white
        viewController.lblEvaluate.textColor = UIColor.white
        viewController.lblSpinAction.textColor = UIColor.yellow
        
        ferrisWheel.run(spin, completion: stopSpin)
    }
    
    func stopSpin() {
        let wait500 = SKAction.wait(forDuration: 0.5)
        
        viewController.lblSpinAction.textColor = UIColor.white
        viewController.lblActionAdd1.textColor = UIColor.yellow
        
        self.run(wait500, completion: incrementTemp)
    }
    
    func incrementTemp() {
        let wait500 = SKAction.wait(forDuration: 0.5)
        
        tempCount = tempCount + 1;
        viewController.lblEvaluate.text = "\(tempCount) < \(tempValue)";
        
        self.run(wait500, completion: briefWait)
    }
    
    func briefWait() {
        viewController.lblActionAdd1.textColor = UIColor.white
        repeatRunning()
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
