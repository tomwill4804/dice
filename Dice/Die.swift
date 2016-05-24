//
//  Dice.swift
//  Dice
//
//  Created by Tom Williamson on 5/24/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

import Foundation

class Die: AnyObject {
    
    
    var faces: Int
    var value: Int
    
    
    //
    //  create a die
    //
    init(faces: Int) {
        
        self.faces = faces
        value = 0
        
        rollIt()
        
    }
    
    //
    //  set value
    //
    func rollIt() {
        
        value = Int(arc4random_uniform(UInt32(faces)))
        
    }
    
    
    
}

