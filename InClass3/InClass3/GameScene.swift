//
//  GameScene.swift
//  InClass3
//
//  Created by Manoj on 2021-02-27.
//  Copyright © 2021 Manoj. All rights reserved.
//

import UIKit
import AVFoundation
import SpriteKit
import GameplayKit

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

class GameScene: SKScene {
    
    //instance members
    var ocean: Ocean?
    var island: Island?
    var plane: Plane?
    var clouds: [Cloud] = []
    
    override func didMove(to view: SKView) {
        screenWidth = frame.width
        screenHeight = frame.height
        
        name = "GAME"
        
        //add ocean
        ocean = Ocean()
        ocean?.position = CGPoint(x: 0, y: 773)
        addChild(ocean!)
        
        //add island
        island = Island()
        addChild(island!)
        
        plane = Plane()
        plane?.position = CGPoint(x: 0, y: -400)
        addChild(plane!)
        
        //add clouds
        for _ in 0...2 {
            let cloud = Cloud()
            clouds.append(cloud)
            addChild(cloud)
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        plane?.touchMove(newPos: CGPoint(x: pos.x, y: -400))
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        plane?.touchMove(newPos: CGPoint(x: pos.x, y: -400))
    }
    
    func touchUp(atPoint pos : CGPoint) {
        plane?.touchMove(newPos: CGPoint(x: pos.x, y: -400))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
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
    
    // Called before each frame is rendered
    override func update(_ currentTime: TimeInterval) {
        ocean?.update()
        island?.update()
        plane?.update()
        CollisionManager.squareRadiusCheck(obj1: plane!, obj2: island!)
        for cloud in clouds{
            CollisionManager.squareRadiusCheck(obj1: plane!, obj2: cloud)
            cloud.update()
        }
    }
}
