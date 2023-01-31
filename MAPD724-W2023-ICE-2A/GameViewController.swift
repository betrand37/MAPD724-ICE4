

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    @IBOutlet weak var LifeLabel: UILabel!
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(self.view.frame.size.width)
//        print(self.view.frame.size.height)
        
        if let scene = GKScene(fileNamed: "GameScene") {
            
     
            if let sceneNode = scene.rootNode as! GameScene? {
                
                sceneNode.scaleMode = .aspectFill
                sceneNode.size.width = 800
                sceneNode.size.height = 1800
                
                if let view = self.view as! SKView?
                {
                    view.presentScene(sceneNode)
                    
                    view.ignoresSiblingOrder = true
                    
                }
                
                
            }
        }
        
        CollisionManager.gameViewController = self
               ScoreManager.Score = 0
               ScoreManager.Lives = 5
               updateLivesLabel()
               updateScoreLabel()
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
            return .portrait
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateScoreLabel()
    {
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    
    func updateLivesLabel()
    {
        LifeLabel.text = "Lives: \(ScoreManager.Lives)"
    }
}
