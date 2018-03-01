//
//  PlayerCard.swift
//  ceelogame
//
//  Created by rr on 2018-02-28.
//  Copyright © 2018 rr. All rights reserved.
//

import UIKit

@IBDesignable class PlayerCard: UIView {

    var view: UIView!
    
    private var playerStats: PlayerStats?
    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerCash: UILabel!
    @IBOutlet weak var playerBet: UILabel!
    @IBOutlet weak var playerPoint: UILabel!
    
    @IBInspectable var pStats: PlayerStats?{
        get{
            return playerStats
        }
        set(pstats){
            playerStats = pstats
        }
    }
    
    @IBInspectable var pName: String?{
        get{
            return playerName.text
        }
        set(pName){
            playerName.text = pName
        }
    }
    @IBInspectable var pCash: Int?{
        get{
            return Int(playerCash.text!)
        }
        set(pCash){
            playerCash.text = String(describing: pCash)
        }
    }
    @IBInspectable var pBet: Int?{
        get{
            return Int(playerBet.text!)
        }
        set(pBet){
            playerBet.text = String(describing: pBet)
        }
    }
    
    @IBInspectable var pPoint: Int?{
        get{
            return Int(playerPoint.text!)
        }
        set(pPoint){
            playerPoint.text = String(describing: pPoint)
        }
    }
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        setup()
    }
    
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
