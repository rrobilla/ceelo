//
//  RulesViewController.swift
//  ceelogame
//
//  Created by Ryan Robillard on 2018-02-23.
//  Copyright © 2018 Ryan Robillard. All rights reserved.
//

import UIKit

class RulesViewController: UIViewController {
    
    //MARK: Properties
    private let bankerRules = "One person is established as the banker, and all other players make even money bets against the bank. If a player makes a $10 bet, then they stand to either win or lose $10 depending on the roll of the dice\n\nWhen a player is established as the banker, they put up an initial stake known as the bank, or center bet. Once they have placed their stake, and announced the amount, the other players have a chance to cover or 'fade' their bet. Starting with the player to the banker's left, and proceeding clockwise around the circle, each player in turn can fade a portion of the bank, as much as they like, until the entire bank is covered or every player has had a chance to make a bet.\n\nIf the initial stake is $100, the first player might choose to fade $20, the next player $20, and the next player $60. Then the entire bank is covered and no more bets are placed this round. Or, if the initial stake is $100, six players choose to fade $10 each, and no one else wishes to bet, then the banker pockets the unfaded portion of the bank ($40) and plays for only the stakes that were covered.\n\nBanker Rolls\nWhen all the bets have been established, the banker rolls the dice. There are four outcomes: automatic win, automatic loss, set point, re-roll\n\nAutomatic Win: If the banker rolls 4-5-6, 'triples' (all three dice show the same number), or a pair (of non-6s) with a 6 then he/she instantly wins all bets.\n\nAutomatic Loss: If the banker rolls 1-2-3, or a pair (of non-1s) with a 1, he/she instantly loses all bets (the players break the bank).\n\nSet Point: If the banker rolls a pair and a single (2, 3, 4, or 5), then the single becomes the banker's 'point.' E.g. a roll of 2-2-4 gives the banker a point of 4. Note that you can not set a point of 1 or 6, as those would result in an automatic loss or win, respectively (see above).\n\nRe-roll: If the dice dont show any of the above combinations, then the banker rolls again and keeps rolling until he/she gets an instant win or an instant loss, or sets a point.\n\nPlayers Roll\nIf the banker does not roll an automatic win or loss, they will have rolled a point of 2, 3, 4, or 5. Each player then rolls the dice to settle his individual bet against the banker. The player wins with a 4-5-6, triple, or any point higher than the Banker's. They lose with a 1-2-3, or any point lower than the banker's. If they tie the banker's point, then it's a 'push', no winner or loser, and the player pockets his stake. If they don't roll win, loss, or point, they continue to roll the dice until they do so."
    
    private let nobankerRules = "This game type has not yet been implemented"
    
    @IBOutlet weak var gametypeSelector: UISegmentedControl!
    @IBOutlet weak var textBlock: UILabel!
    @IBOutlet weak var rulesScrollView: UIScrollView!
    
    //MARK: Actions
    
    //Handles changing the sets of rules
    @IBAction func changeRules(_ sender: Any) {
        if (gametypeSelector.selectedSegmentIndex == 0){
            textBlock.frame.size = CGSize.init(width: 343, height: 1437)
            textBlock.text? = bankerRules
        }
        if (gametypeSelector.selectedSegmentIndex == 1){
            textBlock.text? = nobankerRules
            textBlock.sizeToFit()
        }
        
    }
    
    //Done button - returns you to LandingView
    @IBAction func done(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Loading Handlers
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidLayoutSubviews() {
        rulesScrollView.contentSize = textBlock.frame.size
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        super.viewDidAppear(animated)
        
        textBlock.text? = bankerRules
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Stops screen from rotating
    override open var shouldAutorotate: Bool{
        return false
    }
}
