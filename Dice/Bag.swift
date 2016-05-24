//
//  Bag.swift
//  Dice
//
//  Created by Tom Williamson on 5/24/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

import Foundation

class Bag: AnyObject {
    
    
    var dice : [Die] = []
    var faces: [Int:[Die]] = [:]
    
    //
    //  create dice and add them to the dice array and
    //  also keep an array of dice by number of faces
    //
    func addDice(count: Int, faces: Int) {
        
        for _ in 1...count {
            let newDie = Die(faces: faces)
            self.dice.append(newDie)
            
            if var arr = self.faces[newDie.faces] {
                arr.append(newDie)
                self.faces[newDie.faces] = arr
            }
            else {
                self.faces[newDie.faces] = [newDie]
            }
        }
        
    }
    
    func rollIt() {
        
        for die in dice{
            die.rollIt()
        }
        
    }

    
    
}
