//
//  GameScene.swift
//  InClass2
//
//  Created by Manoj on 2021-02-05.
//  Copyright © 2021 Manoj. All rights reserved.

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    private var label : SKLabelNode?
    private var sprite : SKSpriteNode?
    private var spriteSpeed : CGFloat = 5.0
    
    override func sceneDidLoad()
    {
        self.lastUpdateTime = 0
        
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        self.sprite = SKSpriteNode(color: UIColor.blue, size: CGSize(width: 100.0,height: 100.0))
        self.addChild(self.sprite!)
        reset()
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
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
    
    func moveSprite()
    {
        self.sprite?.position.y += self.spriteSpeed // Pixels per frame
        self.sprite?.zRotation -= self.spriteSpeed * 0.02 // Rotation
        // self.sprite?.zPosition = 1 On top of the label
        // self.sprite?.color = UIColor.init(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.5) - Color
        // self.sprite?.setScale(1.5) To vary the scale
    }
    
    func checkBounds()
    {
        // To check if sprite leaves the top boundary
        if ((self.sprite?.position.y)! > 700)
        {
            reset()
        }
    }
    
    func reset()
    {
        self.sprite?.position.y = -700
        let randColor: UIColor = .random
        self.sprite?.color = randColor // Change random color
        self.sprite?.setScale(CGFloat(Float.random(in: 0.2..<2.2))) // Change random scale
        self.sprite?.position.x = CGFloat(Int.random(in: -300..<300)) // Change x random location
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTIme if it has not already been
        if(self.lastUpdateTime == 0)
        {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entitites
        for entity in self.entities{
            entity.update(deltaTime: dt)
        }
        
        moveSprite()
        checkBounds()
        
        self.lastUpdateTime = currentTime
        
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 0.8)
    }
}
