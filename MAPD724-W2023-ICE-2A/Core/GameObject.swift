//
//  GameObject.swift
//  MAPD724W2022-ICE1
//
//  Created by Kobbie on 21/01/2023.
//

import GameplayKit
import SpriteKit


class GameObject : SKSpriteNode, GameProtocol
{
  
    
    var horizontalSpeed: CGFloat?
    var verticalSpeed: CGFloat?
    var width: CGFloat?
    var height: CGFloat?
    var halfWidth: CGFloat?
    var halfHeight: CGFloat?
    var scale: CGFloat?
    var isColliding: Bool?
    var randomSourse: GKARC4RandomSource?
    var randomDist: GKRandomDistribution?
    
    init(imageString: String, initialScale: CGFloat){
        let texture = SKTexture(imageNamed: imageString)
        let color = UIColor.clear
        super.init(texture: texture, color: color, size: texture.size())
        
        scale = initialScale
        setScale(scale!)
        width = texture.size().width * scale!
        height = texture.size().height * scale!
        halfWidth = width! * 0.5
        halfHeight = height! * 0.5
        isColliding = false
        name = imageString
        randomSourse = GKARC4RandomSource()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func Start() {
        
    }
    
    func Update() {
        
    }
    
    func CheckBounds() {
        
    }
    
    func Reset() {
        
    }
}
