//
//  Ocean.swift
//  InClass3
//
//  Created by Manoj on 2021-02-27.
//  Copyright © 2021 Manoj. All rights reserved.
//


import SpriteKit
import GameplayKit

class Ocean: GameObject {
    
    init() {
        super.init(imageString: "ocean", initialScale: 2.0)
        start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func checkBounds() {
        if position.y <= -773 {
            reset()
        }
    }
    
    override func reset() {
        position.y = 773
    }
    
    override func start() {
        zPosition = 0
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
