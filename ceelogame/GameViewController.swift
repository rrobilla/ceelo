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
    var players = [PlayerCard?]()
    
    
    @IBOutlet weak var p0: PlayerCard!
    @IBOutlet weak var p1: PlayerCard!
    @IBOutlet weak var p2: PlayerCard!
    @IBOutlet weak var p3: PlayerCard!
    @IBOutlet weak var optionsMenu: OptionsMenu!
    
    
    func alertPopup(){
        // create the alert
        let alert = UIAlertController(title: "Error:", message: "The element you selected is not implemented yet", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func openMenu(_ sender: Any) {
        optionsMenu.isHidden = false
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Delegates
    override open var shouldAutorotate: Bool{
        return false
    }
    
    //This controls changing data in the view as it loads
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        super.viewDidAppear(animated)
        initializeGameSettings()
        
        //set game data player amount to playerSlider's value
        //set game data game type to 0 (which means banker mode, 1 means no banker), segmented control's banker type which starts out selected
        
        
    }
    
    //MARK: Game Functions
    func initializeGameSettings(){
        optionsMenu.isHidden = true
        players.append(p0)
        players.append(p1)
        players[1]?.playerName.text = "Computer 1"
        if (numOfPlayers! == 3){
            p3.isHidden = true
            players.append(p2)
            players[2]?.playerName.text = "Computer 2"
        }
        else{
            players.append(p3)
            players[2]?.playerName.text = "Computer 2"
            players.append(p2)
            players[3]?.playerName.text = "Computer 3"
            
        }

        
    }

}
