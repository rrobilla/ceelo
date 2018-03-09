//
//  GameSetupViewController.swift
//  ceelogame
//
//  Created by Ryan Robillard on 2018-02-23.
//  Copyright © 2018 Ryan Robillard. All rights reserved.
//

import UIKit

class GameSetupViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var numOfPlayersLabel: UILabel!
    @IBOutlet weak var playersSlider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBOutlet weak var gametypeLabel: UILabel!
    @IBOutlet weak var selectedGametype: UISegmentedControl!
    
    //MARK: Actions
    
    //This function controls setting the number of players for the game setting data to be passed
    @IBAction func sliderChangeValue(_ sender: Any) {
        sliderLabel.text? = String(Int(playersSlider.value))
        
    }
    
    //Cancel button - returns to the LandingView
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Loading Handlers
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /* Prepare segue for passing game setting data to the GameViewController
     * Params: segue - the segue between the views
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "toGame" {
            guard let gameViewController = segue.destination as? GameViewController else {
                fatalError("Unexpected destination \(segue.destination)")
            }
            //insert game settings data in here to pass to GameView
            gameViewController.gameType = selectedGametype.selectedSegmentIndex
            gameViewController.numOfPlayers = Int(playersSlider.value)
        }
    }
    
    //This controls changing data in the view as it loads
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        super.viewDidAppear(animated)
        sliderLabel.text? = String(Int(playersSlider.value))
        //set game data player amount to playerSlider's value
        //set game data game type to 0 (which means banker mode, 1 means no banker), segmented control's banker type which starts out selected
    }
    
    //This limits the view from rotating
    override open var shouldAutorotate: Bool{
        return false
    }
}
