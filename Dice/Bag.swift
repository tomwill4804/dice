//
//  Bag.swift
//  Dice
//
//  Created by Tom Williamson on 5/24/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

import Foundation

class Bag: AnyObject {
    
    
    var dice : [Dice] = []
    var faces: [Int:[Dice]] = [:]
    
    func addDice(count: Int, faces: Int) {
        
        for _ in 1...count {
            let newDice = Dice(faces: faces)
            self.dice.append(newDice)
            
            if var arr = self.faces[newDice.faces] {
                arr.append(newDice)
                self.faces[newDice.faces] = arr
            }
            else {
                self.faces[newDice.faces] = [newDice]
            }
        }
        
    }

    
    
}
