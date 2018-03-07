//
//  GameViewController.swift
//  ceelogame
//
//  Created by rr on 2018-02-23.
//  Copyright © 2018 rr. All rights reserved.
//

import UIKit
import Foundation

//Enum used for setting CPU betting patterns
enum CpuLevel {
    case easy, normal, hard, none
}

class GameViewController: UIViewController {
    
    //MARK: Properties
    var numOfPlayers: Int?
    var gameType: Int?
    
    //Contains the CPU players as PlayerStats objects, each containing a PlayerCard UI element
    var players = [PlayerStats]()
    //Contains the banker PlayerStats object
    var banker = [PlayerStats]()
    
    //UI Player cards containing player Data
    @IBOutlet weak var p0: PlayerCard!
    @IBOutlet weak var p1: PlayerCard!
    @IBOutlet weak var p2: PlayerCard!
    @IBOutlet weak var p3: PlayerCard!
    
    //Options Menu outlet links
    @IBOutlet weak var optionsMenu: UIView!
    
    //Betting window outlet links
    @IBOutlet weak var betWindow: UIView!
    @IBOutlet weak var betAmount: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var bettingPopup: UIView!
    @IBOutlet weak var bettingPopupLabel: UILabel!
    
    
    
    //MARK: UI Touch Events
    
    //Under construction Pop-up alert
    func alertPopup(){
        // create the alert
        let alert = UIAlertController(title: "Error:", message: "The element you selected is not implemented yet", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    //Options menu - gear button
    @IBAction func openMenu(_ sender: Any) {
        optionsMenu.isHidden = false
    }
    
    //Options menu - exit button
    @IBAction func exitGame(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func restartGame(_ sender: Any) {
        //TODO: Implement restarting the game
        alertPopup()
    }

    //Options menu - return to game button
    @IBAction func returnToGame(_ sender: Any) {
        optionsMenu.isHidden = true
    }
    
    //Betting window - change betting amount value on screen
    @IBAction func changeBet(_ sender: Any) {
        betAmount.text = String(describing: Int(stepper.value))
    }
    @IBAction func confirmBet(_ sender: Any) {
        for p in banker{
            p.bet = Int(stepper.value)
            p.playerCard.playerBet.text = String(p.bet)
            
        }
        betWindow.isHidden = true
        betting()
    }
    
    //MARK: Loading
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    //This controls changing data in the view as it loads
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        super.viewDidAppear(animated)
        self.view.addSubview(optionsMenu)
        initializePlayers()
        setGameBoard()
        
        
        //set game data player amount to playerSlider's value
        //set game data game type to 0 (which means banker mode, 1 means no banker), segmented control's banker type which starts out selected
        
        
    }
    //Stops screen from rotating
    override open var shouldAutorotate: Bool{
        return false
    }
    
    //MARK: Game Functions

    
    //Generates a random number between
    func generateNumber(minVal: Int, maxVal: UInt32)->Int{
        var lvl = Int(arc4random_uniform(maxVal))
        while (lvl < minVal){
            lvl = Int(arc4random_uniform(maxVal))
        }
        return lvl
    }
    
    func getDifficulty()-> CpuLevel{
        let number = generateNumber(minVal: 1, maxVal: 3)
        switch(number){
        case 1: return CpuLevel.easy
        case 2: return CpuLevel.normal
        case 3: return CpuLevel.hard
        default: return CpuLevel.easy
        }
    }
    //Adjust the game values and screens associated during the view load
    func initializePlayers(){
        //Adjust UI component visability during load
        optionsMenu.isHidden = true
        bettingPopup.isHidden = true

        //Create the array of players
        
        
        var statsp0 = PlayerStats(name: "You", cash: 10000, bet: 0, point: 0, position: 0, pcard: p0, cpu: CpuLevel.none)
        banker.append(statsp0)
        
        
        var statsp1 = PlayerStats(name: "CPU 1", cash: 10000, bet: 0, point: 0, position: 1, pcard: p1, cpu: getDifficulty())
        players.append(statsp1)
        
        if (numOfPlayers! == 3){
            p3.isHidden = true
            var statsp2 = PlayerStats(name: "CPU 2", cash: 10000, bet: 0, point: 0, position: 2, pcard: p2, cpu: getDifficulty())
            players.append(statsp2)
 
        }
        else{
            var statsp3 = PlayerStats(name: "CPU 2", cash: 10000, bet: 0, point: 0, position: 2, pcard: p3, cpu: getDifficulty())
            players.append(statsp3)

            var statsp2 = PlayerStats(name: "CPU 3", cash: 10000, bet: 0, point: 0, position: 3, pcard: p2, cpu: getDifficulty())
            players.append(statsp2)
 
            
        }
        //Anything else to initialize game? Current Player icon
    }
    
    func setGameBoard(){
        for p in banker{
            p.playerCard.playerName.text = p.name
            p.playerCard.playerBet.text = String(p.bet)
            p.playerCard.playerCash.text = String(p.cash)
            p.playerCard.playerPoint.text = String(p.point)
        }
        for p in players{
            p.playerCard.playerName.text = p.name
            p.playerCard.playerBet.text = String(p.bet)
            p.playerCard.playerCash.text = String(p.cash)
            p.playerCard.playerPoint.text = String(p.point)
        }
    }
    
    //MARK: Betting Functions
    func cpuBetPercentage(difficulty: CpuLevel)->[Double]{
        if (difficulty == .easy){
            return [0.05, 0.1, 0.14, 0.02, 0.08]
        }
        else if (difficulty == .normal){
            return [0.05, 0.1, 0.15, 0.2, 0.25]
        }
        else{ //hard
            return [0.5, 0.12, 0.35, 0.18, 1.0]
        }
    }
    
    func betting(){
        let bankerBet = banker[0].bet
        var totalAgainst = 0
        
        for p in players{
            let cpuPercentages = cpuBetPercentage(difficulty: p.cpuLvl)
            let n = generateNumber(minVal: 0, maxVal: 4)
            //If the cpu has no cash, go to next cpu for betting
            if (p.cash <= 0){
                continue
            }
            //If the banker's bet has been covered already, go to the next cpu for betting
            let needsToBeCovered = bankerBet! - totalAgainst
            if ((needsToBeCovered) <= 0){
                continue
            }
            let cpuBet = Int(Double(needsToBeCovered) * cpuPercentages[n])
            if (p.cash > cpuBet){
                p.bet = cpuBet
            }
            else{
                p.bet = 1
            }
            
            //p.playerCard.playerBet.text = String(p.bet)// move this outside the loop and delay it - can add animations
            totalAgainst += p.bet
            
        }//Each CPU has made their bets
        
        
        //TODO: Currently using inline values for delay time, try to figure out a way to feed it a value variable

        for p in players{
            if (p.position == 1){
                //trigger onscreen ui popup
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.bettingPopupLabel.text = p.name + " is betting"
                self.bettingPopup.isHidden = false
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                    p.playerCard.playerBet.text = String(p.bet)
                    self.bettingPopup.isHidden = true
                }
            }
            else if (p.position == 2){
                //trigger onscreen ui popup
                DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                    self.bettingPopupLabel.text = p.name + " is betting"
                    self.bettingPopup.isHidden = false
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                    p.playerCard.playerBet.text = String(p.bet)
                    self.bettingPopup.isHidden = true
                }
            }
            else{
                //trigger onscreen ui popup
                DispatchQueue.main.asyncAfter(deadline: .now() + 11) {
                    self.bettingPopupLabel.text = p.name + " is betting"
                    self.bettingPopup.isHidden = false
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 14) {
                    p.playerCard.playerBet.text = String(p.bet)
                    self.bettingPopup.isHidden = true
                }
            }
            //delayTime += delayTime
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 16) {
            self.bettingPopupLabel.text = "Returning uncovered Bets"
            self.bettingPopup.isHidden = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 18) {
        
            //Adjust Banker's bet
            if (bankerBet! > totalAgainst){
                self.banker[0].bet = totalAgainst
                self.banker[0].playerCard.playerBet.text = String(self.banker[0].bet)
            }
            self.bettingPopup.isHidden = true
        }
        
        
    }
    
    func rolling(){
        
    }
    
    func payout(){
            
    }

}

//Mark: KeeperCode

//This will cause a delay of however many seconds, to allow for slower and more fluid UI altering
//DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // change 2 to desired
    // Your code with delay
//}
