//
//  GameViewController.swift
//  ceelogame
//
//  Created by rr on 2018-02-23.
//  Copyright © 2018 rr. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    //MARK: Properties
    var numOfPlayers: Int?
    var gameType: Int?
    var players = [PlayerStats]()
    
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
    
    //Options menu gear button
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
        alertPopup()
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
        initializeGameSettings()
        
        //set game data player amount to playerSlider's value
        //set game data game type to 0 (which means banker mode, 1 means no banker), segmented control's banker type which starts out selected
        
        
    }
    //Stops screen from rotating
    override open var shouldAutorotate: Bool{
        return false
    }
    
    //MARK: Game Functions
    
    //Adjust the game values and screens associated during the view load
    func initializeGameSettings(){
        //Adjust UI component visability during load
        optionsMenu.isHidden = true
        
        //Create the array of players
        var statsp0 = PlayerStats(name: "You", cash: 10000, bet: 0, point: 0, position: 0, pcard: p0)
        players.append(statsp0)
        
        var statsp1 = PlayerStats(name: "CPU 1", cash: 10000, bet: 0, point: 0, position: 0, pcard: p1)
        players.append(statsp1)
        
        if (numOfPlayers! == 3){
            p3.isHidden = true
            var statsp2 = PlayerStats(name: "CPU 2", cash: 10000, bet: 0, point: 0, position: 0, pcard: p2)
            players.append(statsp2)
 
        }
        else{
            var statsp3 = PlayerStats(name: "CPU 2", cash: 10000, bet: 0, point: 0, position: 0, pcard: p3)
            players.append(statsp3)

            var statsp2 = PlayerStats(name: "CPU 3", cash: 10000, bet: 0, point: 0, position: 0, pcard: p2)
            players.append(statsp2)
 
            
        }
        //Anything else to initialize game? Current Player icon
        
    }

}
