

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    @IBOutlet weak var LifeLabel: UILabel!
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBOutlet weak var StartLabel: UILabel!
    var currentScene: GKScene?
    @IBOutlet weak var EndLabel: UILabel!
    
    @IBOutlet weak var StartButton: UIButton!
    
    @IBOutlet weak var RestartButton: UIButton!
    
    override func viewDidLoad()
      {
          super.viewDidLoad()

 //         presentEndScene()
          
          presentStartScene()
          
          // Initialize the Lives and Score
          CollisionManager.gameViewController = self
         
      }

      override var supportedInterfaceOrientations: UIInterfaceOrientationMask
      {
          return .portrait
      }

      override var prefersStatusBarHidden: Bool
      {
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
      
      func setScene(sceneName: String) -> Void
      {
          currentScene = GKScene(fileNamed: sceneName)
          
          if let scene = currentScene!.rootNode as! SKScene?
          {
              scene.scaleMode = .aspectFill
              
              if let view = self.view as! SKView?
              {
                  view.presentScene(scene)
                  view.ignoresSiblingOrder = true
              }
          }
          
      }
    func presentStartScene(){
        ScoreLabel.isHidden = true
        LifeLabel.isHidden = true
        StartButton.isHidden = false
        EndLabel.isHidden = true
        RestartButton.isHidden = true
        setScene(sceneName: "StartScene")
    }
    func presentEndScene(){
        RestartButton.isHidden = false
        EndLabel.isHidden = false
        ScoreLabel.isHidden = true
        LifeLabel.isHidden = true
        setScene(sceneName: "EndScene")
    }
    
    @IBAction func startButton_Pressed(_ sender: UIButton) {
        StartButton.isHidden = true
        StartLabel.isHidden = true
        ScoreLabel.isHidden = false
        LifeLabel.isHidden = false
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        setScene(sceneName: "GameScene")
    }
    
    
    @IBAction func restartButton_Pressed(_ sender: UIButton) {
        RestartButton.isHidden = true
        EndLabel.isHidden = true
        ScoreLabel.isHidden = false
        LifeLabel.isHidden = false
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        setScene(sceneName: "GameScene")
    }
    
}
