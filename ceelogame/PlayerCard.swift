//
//  PlayerCard.swift
//  ceelogame
//
//  Created by Ryan Robillard on 2018-02-23.
//  Copyright © 2018 Ryan Robillard. All rights reserved.
//

import UIKit

@IBDesignable class PlayerCard: UIView {

    var view: UIView!
    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerCash: UILabel!
    @IBOutlet weak var playerBet: UILabel!
    @IBOutlet weak var playerPoint: UILabel!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        setup()
    }
    
    /* Two functions that handles loading each individual player card UI element from a nib file onto the screen
     */
    func setup(){
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = UIViewAutoresizing.flexibleWidth.union(UIViewAutoresizing.flexibleHeight)
        //view.autoresizingMask = [.flexibleWidth|.flexibleHeight]
        addSubview(view)
    }
    
    func loadViewFromNib()-> UIView{
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PlayerCard", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }

}
