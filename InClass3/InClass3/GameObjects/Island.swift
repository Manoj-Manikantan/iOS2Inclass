//
//  Island.swift
//  InClass3
//
//  Created by Manoj on 2021-02-27.
//  Copyright © 2021 Manoj. All rights reserved.

import SpriteKit
import GameplayKit

class Island: GameObject {
    
    init() {
        super.init(imageString: "island", initialScale: 2.0)
        start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func checkBounds() {
        if position.y <= -730 {
            reset()
        }
    }
    
    override func reset() {
        position.y = 730
        position.x = CGFloat(Int.random(in: -250...250))
        isColliding = false
    }
    
    override func start() {
        zPosition = 1
        reset()
        dy = 5.0
    }
    
    override func update() {
        move()
        checkBounds()
    }
    
    func move() {
        position.y -= dy!
    }
    
}
