//
//  Cloud.swift
//  InClass3
//
//  Created by Manoj on 2021-02-27.
//  Copyright © 2021 Manoj. All rights reserved.
//

import SpriteKit
import GameplayKit

class Cloud: GameObject {
    
    init() {
        super.init(imageString: "cloud", initialScale: 1.0)
        start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func checkBounds() {
        if position.y <= -760 {
            reset()
        }
    }
    
    override func reset() {
        dy = CGFloat(Int.random(in: 3...5))
        dx = CGFloat(Int.random(in: -2...2))
        position.y = 760
        position.x = CGFloat(Int.random(in: -250...250))
        isColliding = false
    }
    
    override func start() {
        zPosition = 3
        alpha = 0.5
        reset()
    }
    
    override func update() {
        move()
        checkBounds()
    }
    
    func move() {
        position.y -= dy!
        position.x -= dx!
    }
    
}
