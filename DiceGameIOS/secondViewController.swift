//
//  secondViewController.swift
//  DiceGameIOS
//
//  Created by Codenation11 on 20/06/2019.
//  Copyright © 2019 Codenation11. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
    
    //MARK: Variables
    var dice = [#imageLiteral(resourceName: "Kismet-Ace"), #imageLiteral(resourceName: "Kismet-Deuce"), #imageLiteral(resourceName: "Kismet-Trey"), #imageLiteral(resourceName: "Kismet-Four"), #imageLiteral(resourceName: "Kismet-Five"), #imageLiteral(resourceName: "Kismet-Six") ]
    var dice2 = [#imageLiteral(resourceName: "Kismet-Ace"), #imageLiteral(resourceName: "Kismet-Deuce"), #imageLiteral(resourceName: "Kismet-Trey"), #imageLiteral(resourceName: "Kismet-Four"), #imageLiteral(resourceName: "Kismet-Five"), #imageLiteral(resourceName: "Kismet-Six")]
    var randomDiceIndex: Int = 0
    var randomDiceIndex2: Int = 0
    var score: Int = 0
    var score2: Int = 0
    var player = "Player1"
    var player1 = 0
    var player2 = 0
    
    //MARK: Outlets
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var RulesLabels: UILabel!
    @IBOutlet weak var MainMessageLabel: UILabel!
    @IBOutlet weak var SecondaryMessageLabel: UILabel!
    @IBOutlet weak var ImageViewLabel: UIImageView!
    @IBOutlet weak var ButtonLabel: UIButton!
    @IBOutlet weak var player1WinsLabel: UILabel!
    @IBOutlet weak var player2WinsLabel: UILabel!
    @IBOutlet weak var ImageViewLabel2: UIImageView!
    //MARK: Actions
    
    @IBAction func RestartButtonAction(_ sender: Any) {
        MainMessageLabel.text = ""
        SecondaryMessageLabel.text = ""
        RulesLabels.text = ""
        ScoreLabel.text = ""
        player1 = 0
        player2 = 0
        score = 0
        score2 = 0
        player = "Player1"
        player1WinsLabel.text = "Wins \(player1)"
        player2WinsLabel.text = "Wins \(player2)"
        ScoreLabel.backgroundColor = #colorLiteral(red: 0.3049400151, green: 0.3134638667, blue: 0.3395860791, alpha: 1)
        RulesLabels.backgroundColor = #colorLiteral(red: 0.3049400151, green: 0.3134638667, blue: 0.3395860791, alpha: 1)
        ImageViewLabel.image = dice[5]
        ImageViewLabel2.image = dice2[5]
    }
    @IBAction func ButtonAction(_ sender: Any) {
        SecondaryMessageLabel.text = ""
        if(player == "Player1"){
            MainMessageLabel.text = ""
            //selecting a random number between 0 & 5
            
            randomDiceIndex = Int.random(in: 0 ... 5)
            randomDiceIndex2 = Int.random(in: 0 ... 5)
            ImageViewLabel.image = dice[randomDiceIndex]
            ImageViewLabel2.image = dice2[randomDiceIndex2]
            score += randomDiceIndex + randomDiceIndex2 + 2
            ScoreLabel.textColor = #colorLiteral(red: 0.1190966442, green: 0.1371350884, blue: 0.167398721, alpha: 1)
            ScoreLabel.backgroundColor = #colorLiteral(red: 1, green: 0.5166546106, blue: 0.007819370367, alpha: 1)
            RulesLabels.backgroundColor = #colorLiteral(red: 0.3049400151, green: 0.3134638667, blue: 0.3395860791, alpha: 1)
            
            ScoreLabel.text = """
            Player1 score\n
            \(score)
            """
            diceLogic()
            player = "Player2"
//            SecondaryMessageLabel.text = ""
            RulesLabels.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }else if( player == "Player2"){
            MainMessageLabel.text = ""
            ScoreLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
            
            //selecting a random number between 0 & 5
            
            randomDiceIndex = Int.random(in: 0 ... 5)
            randomDiceIndex2 = Int.random(in: 0 ... 5)
            ImageViewLabel.image = dice[randomDiceIndex]
            ImageViewLabel2.image = dice2[randomDiceIndex2]
            score2 += randomDiceIndex + randomDiceIndex2 + 2
            RulesLabels.textColor = #colorLiteral(red: 0.1605534554, green: 0.1643698514, blue: 0.1861875653, alpha: 1)
            RulesLabels.backgroundColor = #colorLiteral(red: 1, green: 0.5166546106, blue: 0.007819370367, alpha: 1)
            ScoreLabel.backgroundColor = #colorLiteral(red: 0.3049400151, green: 0.3134638667, blue: 0.3395860791, alpha: 1)
            RulesLabels.text = """
            Player2 score\n
            \(score2)
            """
            diceLogic()
            player = "Player1"
//            SecondaryMessageLabel.text = ""
        }
        
        
    }
    
    
    func diceLogic(){
        if(player == "Player1"){
            if(score >= 31){
                player1 += 1
                MainMessageLabel.text = "player 1 Winner"
                MainMessageLabel.textColor = #colorLiteral(red: 1, green: 0.5166546106, blue: 0.007819370367, alpha: 1)
                SecondaryMessageLabel.text = "PLayer2 Looser"
                scoreReset()
            
                player1WinsLabel.text = "Wins \(player1)"
                player2WinsLabel.text = "Wins \(player2)"
            }else if(randomDiceIndex == 0 || randomDiceIndex2 == 0){
                player2 += 1
                MainMessageLabel.text = "player 1 Looser"
                MainMessageLabel.textColor = #colorLiteral(red: 1, green: 0.5166546106, blue: 0.007819370367, alpha: 1)
                SecondaryMessageLabel.text = "Player2 Winner"
                scoreReset()
            
                player1WinsLabel.text = "Wins \(player1)"
                player2WinsLabel.text = "Wins \(player2)"
        }
            }else if (player == "Player2"){
                if(score2 >= 31){
                    player2 += 1
                    MainMessageLabel.text = "Player2 Winner"
                    SecondaryMessageLabel.text = "Player1 Looser"
                    SecondaryMessageLabel.textColor = #colorLiteral(red: 1, green: 0.5166546106, blue: 0.007819370367, alpha: 1)
                    MainMessageLabel.textColor = #colorLiteral(red: 1, green: 0.5166546106, blue: 0.007819370367, alpha: 1)
                    scoreReset()
                    
                    player1WinsLabel.text = "Wins \(player1)"
                    player2WinsLabel.text = "Wins \(player2)"
                    
                }else if(randomDiceIndex == 0 || randomDiceIndex2 == 0){
                    player1 += 1
                    MainMessageLabel.text = "Player2 Looser"
                    MainMessageLabel.textColor = #colorLiteral(red: 1, green: 0.5166546106, blue: 0.007819370367, alpha: 1)
                    SecondaryMessageLabel.text = "Player1 Winner"
                    SecondaryMessageLabel.textColor = #colorLiteral(red: 1, green: 0.5166546106, blue: 0.007819370367, alpha: 1)
                    scoreReset()
                    
                    player1WinsLabel.text = "Wins \(player1)"
                    player2WinsLabel.text = "Wins \(player2)"
                    
                }else{
                return
            }
            
        }
        
    }
    
    func scoreReset(){
        score2 = 0
        score = 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        player1WinsLabel.textColor = #colorLiteral(red: 1, green: 0.5166546106, blue: 0.007819370367, alpha: 1)
        player2WinsLabel.textColor = #colorLiteral(red: 1, green: 0.5166546106, blue: 0.007819370367, alpha: 1)
        MainMessageLabel.text = ""
        SecondaryMessageLabel.text = ""
        player1WinsLabel.text = "Wins \(player1)"
        player2WinsLabel.text = "Wins \(player2)"
        RulesLabels.text = """
        Player2 score\n
        
        """
        ScoreLabel.text = """
        Player1 score\n
        
        """
        // Do any additional setup after loading the view.
    }
}

