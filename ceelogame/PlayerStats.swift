//
//  PlayerStats.swift
//  ceelogame
//
//  Created by rr on 2018-02-28.
//  Copyright © 2018 rr. All rights reserved.
//

import UIKit
class PlayerStats: NSObject {
    var cash: Int!
    var bet: Int!
    var point: Int!
    var name: String!
    var position: Int!
    //var tiltPercentage: Int? //Use this to affect the betting paterns of the cpu
    
/*
     var a2bFunc: (_ a: Decimal, _ name: String, _ s: String, _ c: Decimal)-> String = {a,name,s,c in
        var rndFormat = "%.3f"
        if var value = Decimal(string: s){
            
            if name == "Temperature"{
                value = value - c
                rndFormat = "%.1f"
            }
            
            value = value * a
            
            let text = String(format: rndFormat, Double(String(describing: value))!)
            return text
        }
        else{
            return "Error!"
        }
    }
    var b2aFunc: (_ b: Decimal, _ name: String, _ s: String, _ c: Decimal)-> String = {b,name,s,c in
        var rndFormat = "%.3f"
        if var value = Decimal(string: s){
            
            value = value * b
            
            if name == "Temperature"{
                value = value + c
                rndFormat = "%.1f"
            }
            
            let text = String(format: rndFormat, Double(String(describing: value))!)
            return text
        }
        else{
            return "Error!"
        }
    }
*/
    
    init(name: String = "Computer", position: Int = -1) {
        self.cash = 10000
        self.bet = 0
        self.point = 0
        self.position = position
    }
}
