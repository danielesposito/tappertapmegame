//
//  ViewController.swift
//  TapperTapMeGame
//
//  Created by Daniel Esposito on 3/13/16.
//  Copyright © 2016 Daniel Esposito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var setScoreField: UITextField!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var strawberryButton: UIButton!
    
    //Properties
    var maxScoreNumber: Int = 0
    var currentScoreNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
    }
    

    @IBAction func playButtonPressed(sender: UIButton!) {
        

        if setScoreField.text != nil && setScoreField.text != "" {
 
            logoImage.hidden = true
            playButton.hidden = true
            setScoreField.hidden = true
            
            strawberryButton.hidden = false
            scoreLabel.hidden = false
            
            maxScoreNumber = Int(setScoreField.text!)!
            
            currentScoreNumber = 0
            
            updateTabsLabel()
            
        }
        
        
        
    }
    
    @IBAction func strawberryButtonPressed(sender: UIButton!) {
        
        currentScoreNumber++ //same as currentScoreNumber += 1 just shorter+= 1 just shorter
        
        updateTabsLabel()
        
        if isGameOver() {
            
            restartGame()
        }

}

    func updateTabsLabel(){
        
        scoreLabel.text = "\(currentScoreNumber) Tabs"
    }
    
    func isGameOver() -> Bool {
        
        if currentScoreNumber >= maxScoreNumber {
            
            return true
            
        } else {
            
            return false
            
        }
    }
    
    func restartGame() {
        
        scoreLabel.text = ""
        logoImage.hidden = false
        playButton.hidden = false
        setScoreField.hidden = false

        strawberryButton.hidden = true
        scoreLabel.hidden = true

        currentScoreNumber = 0
        setScoreField.text = ""
    }

    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}

