import GameplayKit
import SpriteKit

class Cloud : GameObject
{

    init()
    {
        super.init(imageString: "cloud", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCylce Functions
    override func Start()
    {
        zPosition = Layer.cloud.rawValue
        alpha = 0.5 // 50% transparent
        Reset()
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(position.y <= -902)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        // randomize the vertical speed
        verticalSpeed = CGFloat((randomSourse?.nextUniform())! * 5.0) + 5.0
        
        // randomize the horizontal speed
        horizontalSpeed = CGFloat((randomSourse?.nextUniform())! * 4.0) - 2.0
        

        let randomX:Int = (randomSourse?.nextInt(upperBound: 524))! - 262
        position.x = CGFloat(randomX)
        
  
        let randomY:Int = (randomSourse?.nextInt(upperBound: 30))! + 902
        position.y = CGFloat(randomY)
        
        isColliding = false
    }
    
    func Move()
    {
        position.x -= horizontalSpeed!
        position.y -= verticalSpeed!
    }
}
