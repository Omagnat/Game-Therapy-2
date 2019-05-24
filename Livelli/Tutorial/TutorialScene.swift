//
//  GameScene.swift
//  GameScene
//
//  Created by Caliendo Gianluca on 17/05/2019.
//  Copyright © 2019 iOSFoundation. All rights reserved.
//

import SpriteKit
import GameplayKit

class TutorialScene: SKScene {
    
    
    private var label : SKLabelNode?
    
    
//    let tileCategory:   UInt32 = 0x1 << 0 // 1
//    let groundCategory: UInt32 = 0x1 << 2 // 4
    
    var tile1: SKSpriteNode!
    var tile2: SKSpriteNode!
    var tile3: SKSpriteNode!
    var tile4: SKSpriteNode!
    var currentTile: SKSpriteNode!
    var lastLocation: CGPoint!
    
    override func didMove(to view: SKView) {
        /*// Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }*/
        
        
        //generazione sfondo
        let background = SKSpriteNode(imageNamed: "tutorial_background")
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.zPosition = -1
        
        addChild(background)
        
        //generazione tessera
        tile1 = self.childNode(withName: "tile1") as? SKSpriteNode
        tile2 = self.childNode(withName: "tile2") as? SKSpriteNode
        tile3 = self.childNode(withName: "tile3") as? SKSpriteNode
        tile4 = self.childNode(withName: "tile4") as? SKSpriteNode

        
        //imposta coordinate di partenza del terreno
//        var striscia = [CGPoint(x: -640, y: -10),
//                        CGPoint(x: 100, y: -10),
//                        CGPoint(x: 400, y: -10),
//                        CGPoint(x: 1334, y: -10)]
        
        //generazione terreno
//        let ground = SKShapeNode(splinePoints: &striscia, count: striscia.count)
//        ground.zPosition = 0
//        addChild(ground)

        
        //proprietà fisiche del terreno
//        ground.physicsBody = SKPhysicsBody(edgeChainFrom: ground.path!)


          //crea criteri di collisione
//        ground.physicsBody?.categoryBitMask = groundCategory
//        tile.physicsBody?.collisionBitMask = groundCategory
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        let node = self.atPoint(touchLocation)
        
        if let name = node.name {
            if name.contains("tile") {
                //drag
                currentTile = node as? SKSpriteNode
                lastLocation = touchLocation
                
            }
        }
        
        
        
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            var center: CGPoint?

            if currentTile != nil {
//            if tiles.contains(tile1) {
//            let tile = tile1!
                if  (currentTile.zRotation.truncatingRemainder(dividingBy: 1.5708)) == 0 {
                    center = CGPoint(x: currentTile.position.y + 55, y: currentTile.position.x + 30)
                } else {
                    center = CGPoint(x: currentTile.position.x + 30, y: currentTile.position.y + 55)
                    }
                }
            if abs((center?.x)! - location.x) > 10 || abs((center?.y)! - location.y) > 20 {
            //drag
            currentTile.position.x = location.x
            currentTile.position.y = location.y
                    
            
            print("\(currentTile.name!): x: \(currentTile.position.x), y: \(currentTile.position.y)")
            }
            }
//            }
//
//            if tiles.contains(tile2) {
//                let tile = tile2!
//
//                //drag
//                tile.position.x = location.x
//                tile.position.y = location.y
//
//                print("\(tile.name!): x: \(tile.position.x), y: \(tile.position.y)")
//
//            }
            
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        if lastLocation == touchLocation {
            currentTile.zRotation += 1.5708
        }
        currentTile = nil
        
}
    
    
    
}
