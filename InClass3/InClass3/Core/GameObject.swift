//
//  GameObject.swift
//  InClass3
//
//  Created by Manoj on 2021-02-27.
//  Copyright © 2021 Manoj. All rights reserved.


import SpriteKit
import GameplayKit

class GameObject: SKSpriteNode, GameProtocol {
    
    //Instance Members
    var dx: CGFloat?
    var dy: CGFloat?
    var width: CGFloat?
    var height: CGFloat?
    var halfHeight: CGFloat?
    var halfWidth: CGFloat?
    var scale: CGFloat?
    var isColliding: Bool?
    var randomSource: GKARC4RandomSource?
    var randomDist: GKRandomDistribution?
    
    
    //Constructor
    init(imageString: String, initialScale: CGFloat) {
        //initialize the game object with an Image or Texture
        let texture = SKTexture(imageNamed: imageString)
        let color = UIColor.clear
        super.init(texture: texture,color: color, size: texture.size())
        
        scale = initialScale
        setScale(scale!)
        width = texture.size().width * scale!
        height = texture.size().height * scale!
        halfWidth = width! * 0.5
        halfHeight = height! * 0.5
        isColliding = false
        name = imageString
        randomSource = GKARC4RandomSource()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func checkBounds() {
        
    }
    
    func reset() {
        
    }
    
    func start() {
        
    }
    
    func update() {
        
    }
}
