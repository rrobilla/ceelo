//
//  GameViewController.swift
//  ceelogame
//
//  Created by rr on 2018-02-23.
//  Copyright © 2018 rr. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    var numOfPlayers: Int?
    var gameType: Int?
    private var players: [PlayerCard?]
    
    @IBOutlet weak var p0: PlayerCard!
    @IBOutlet weak var p1: PlayerCard!
    @IBOutlet weak var p2: PlayerCard!
    @IBOutlet weak var p3: PlayerCard!
    
    
    func alertPopup(){
        // create the alert
        let alert = UIAlertController(title: "Error:", message: "The element you selected is not implemented yet", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        

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
        if (numOfPlayers! > 0){
            p3.isHidden = true
            players.append(p0)
            players.append(p1)
            players.append(p2)
        }
        //set game data player amount to playerSlider's value
        //set game data game type to 0 (which means banker mode, 1 means no banker), segmented control's banker type which starts out selected
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
