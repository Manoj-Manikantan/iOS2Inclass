//
//  Plane.swift
//  InClass3
//
//  Created by Manoj on 2021-02-27.
//  Copyright © 2021 Manoj. All rights reserved.

import SpriteKit

class Plane: GameObject {
    
    init() {
        super.init(imageString: "plane", initialScale: 2.0)
        start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // LifeCycle functions
    override func checkBounds() {
        // left boundary
        if position.x <= -310 {
            position.x = -310
        }
        
        // right boundary
        if position.x >= 310 {
            position.x = 310
        }
    }
    
    override func reset() {

    }
    
    override func start() {
        zPosition = 2
    }
    
    override func update() {
        checkBounds()
    }
    
    func touchMove(newPos: CGPoint) {
        position = newPos
    }
    
}

