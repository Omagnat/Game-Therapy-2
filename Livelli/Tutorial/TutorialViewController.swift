//
//  GameViewController.swift
//  test
//
//  Created by Caliendo Gianluca on 17/05/2019.
//  Copyright © 2019 iOSFoundation. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class TutorialViewController: UIViewController {
    
    
    override func viewWillLayoutSubviews() {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        if let view = self.view as! SKView? {
            // Load the SKScene from 'TutorialScene.sks'
            if let scene = SKScene(fileNamed: "TutorialScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
//            view.showsFPS = true
//            view.showsNodeCount = true
        }
        
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
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
