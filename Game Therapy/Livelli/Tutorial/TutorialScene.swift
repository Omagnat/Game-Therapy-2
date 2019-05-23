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
        var striscia = [CGPoint(x: -640, y: -10),
                        CGPoint(x: 100, y: -10),
                        CGPoint(x: 400, y: -10),
                        CGPoint(x: 1334, y: -10)]
        
        //generazione terreno
        let ground = SKShapeNode(splinePoints: &striscia, count: striscia.count)
        ground.zPosition = 0
        addChild(ground)

        
        //proprietà fisiche del terreno
        ground.physicsBody = SKPhysicsBody(edgeChainFrom: ground.path!)


          //crea criteri di collisione
//        ground.physicsBody?.categoryBitMask = groundCategory
//        tile.physicsBody?.collisionBitMask = groundCategory
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            tile1.position.x = location.x
            tile1.position.y = location.y
            tile1.zRotation = 0
        
            print("x: \(tile1.position.x), y: \(tile1.position.y)")
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        /*
        if  tile1.position.y < 0 {
            tile1.physicsBody?.affectedByGravity = false
                tile1.position.x = 55.0
                tile1.position.y = -100.0
                tile1.zRotation = 0
            }
        
        if  tile2.position.y < 0 {
            tile2.physicsBody?.affectedByGravity = false
            tile2.position.x = 55.0
            tile2.position.y = -100.0
            tile2.zRotation = 0
        }
        
        if  tile3.position.y < 0 {
            tile3.physicsBody?.affectedByGravity = false
            tile3.position.x = 55.0
            tile3.position.y = -100.0
            tile3.zRotation = 0
        }
        
        if  tile4.position.y < 0 {
            tile4.physicsBody?.affectedByGravity = false
            tile4.position.x = 55.0
            tile4.position.y = -100.0
            tile4.zRotation = 0
        }
        */
}

    
    
    
}
