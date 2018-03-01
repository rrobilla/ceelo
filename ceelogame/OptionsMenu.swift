//
//  OptionsMenu.swift
//  ceelogame
//
//  Created by rr on 2018-03-01.
//  Copyright © 2018 rr. All rights reserved.
//

import UIKit

        
@IBDesignable class OptionsMenu: UIView {
    
    
        
    var view: UIView!

        
    @IBAction func exitGame(_ sender: Any) {
        
    }

    @IBAction func closeMenu(_ sender: Any) {
        self.isHidden = true
    }
        

        
        
        override init(frame: CGRect){
            //anything you need to init can go here
            super.init(frame: frame)
            
            setup()
        }
        
        required init?(coder aDecoder: NSCoder){
            //anything you need to init can go here
            
            super.init(coder: aDecoder)
            setup()
        }
        
        func setup(){
            view = loadViewFromNib()
            view.frame = bounds
            view.autoresizingMask = UIViewAutoresizing.flexibleWidth.union(UIViewAutoresizing.flexibleHeight)
            //view.autoresizingMask = [.flexibleWidth|.flexibleHeight]
            
            //can set labels here
            addSubview(view)
        }
        
        func loadViewFromNib()-> UIView{
            let bundle = Bundle(for: type(of: self))
            let nib = UINib(nibName: "OptionsMenu", bundle: bundle)
            let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
            return view
        }
        
    

}
