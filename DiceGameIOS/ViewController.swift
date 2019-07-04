//
//  ViewController.swift
//  DiceGameIOS
//
//  Created by Codenation11 on 20/06/2019.
//  Copyright © 2019 Codenation11. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    //MARK: Variables
    var dice = [#imageLiteral(resourceName: "Kismet-Ace"), #imageLiteral(resourceName: "Kismet-Deuce"), #imageLiteral(resourceName: "Kismet-Trey"), #imageLiteral(resourceName: "Kismet-Four"), #imageLiteral(resourceName: "Kismet-Five"), #imageLiteral(resourceName: "Kismet-Six") ]
    var randomDiceInedx: Int = 0
    var score: Int = 0
    
    //MARK: Outlets
    
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var rulesLabel: UILabel!
    @IBOutlet weak var mainMessageLabel: UILabel!
    @IBOutlet weak var secondaryMessageLabel: UILabel!
    @IBOutlet weak var diceImage: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    //MARK: Actions
    @IBAction func resetButtonAction(_ sender: Any) {
        
        }
    
    @IBAction func rollButtonAction(_ sender: Any) {
        mainMessageLabel.text = ""
        secondaryMessageLabel.text = ""
        //selecting a random number between 0 & 5
    
        randomDiceInedx = Int.random(in: 0 ... 5)
        diceImage.image = dice[randomDiceInedx]
        score += randomDiceInedx + 1
        ScoreLabel.text = "\(score)"
        diceLogic()
    }
    
    
    //MARK: Functions
    
    
    //Get to 21 or higher then you win.
    //roll a 1 and you lose.
    func diceLogic(){
        if(score >= 21){
            mainMessageLabel.text = "You won"
            mainMessageLabel.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            score = 0
            
        }else if(randomDiceInedx == 0 ){
            mainMessageLabel.text = "You lost"
            mainMessageLabel.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            score = 0
        }else{
            return
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

