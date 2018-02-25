//
//  ViewController.swift
//  ceelogame
//
//  Created by rr on 2018-02-23.
//  Copyright © 2018 rr. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var rulesButton: UIButton!
    
    //MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "toRules" {
            guard segue.destination is RulesViewController else {
                fatalError("Unexpected destination \(segue.destination)")
            }
        }
        if segue.identifier == "toSetup" {
            guard segue.destination is GameSetupViewController else {
                fatalError("Unexpected destination \(segue.destination)")
            }
        }
    }
    override open var shouldAutorotate: Bool{
        return false
    }


}

