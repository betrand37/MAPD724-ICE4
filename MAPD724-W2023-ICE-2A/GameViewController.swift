

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    @IBOutlet weak var LivesLabel: UILabel!
    
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
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
            return .portrait
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
