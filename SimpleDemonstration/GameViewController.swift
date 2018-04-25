//
//  GameViewController.swift
//  SimpleDemonstration
//
//  Created by Jacqueline on 10/17/17.
//  Copyright © 2017 Jacqueline. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var rotationSlider: UISlider!
    @IBOutlet weak var rotationButton: UIButton!
    @IBOutlet weak var rotationLabel: UILabel!
    
    @IBOutlet weak var lblCondition: UILabel!
    @IBOutlet weak var lblSpinAction: UILabel!
    @IBOutlet weak var lblActionAdd1: UILabel!
    @IBOutlet weak var lblEvaluate: UILabel!
    @IBOutlet weak var lblCurrentLoop: UILabel!
    @IBOutlet weak var lblSliderValue: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    
    
    var currentGame: GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentGame = GameScene(fileNamed: "GameScene")
        currentGame.viewController = self
        
        currentGame.scaleMode = .aspectFill
        
        rotationButton.layer.borderColor = UIColor.cyan.cgColor
        rotationButton.layer.borderWidth = 2
        rotationButton.layer.backgroundColor = UIColor.darkGray.cgColor

        print(currentGame);
        
        if let view = self.view as! SKView? {
            view.presentScene(currentGame)
            
            view.ignoresSiblingOrder = false
            
            view.showsFPS = false
            view.showsNodeCount = false
            
        }
    }
    
    @IBAction func onSlideChanged(_ sender: Any) {
        rotationLabel.text = "Number of Rotation: " + Int(rotationSlider.value).description;
        rotationSlider.value = floor(rotationSlider.value)
    }
    
    @IBAction func buttonUpInside(_ sender: Any) {
        currentGame.spinRectangleXTime(time: Int(rotationSlider.value))
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
