//
//  Bag.swift
//  Dice
//
//  Created by Tom Williamson on 5/24/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

import Foundation
import UIKit

class Bag: AnyObject {
    
    
    var dice: [Die] = []
    var facesArray:[(faces: Int, dice: [Die])] = []
    
    //
    //  create dice and add them to the dice array and
    //  also keep an array of dice by number of faces
    //
    func addDice(count: Int, faces: Int, collectionView: UICollectionView?) {
        
        facesArray.append((faces: faces, dice: []))
        var diceArray:[Die] = []
        
        for _ in 1...count {
            
            let newDie = Die(faces: faces)
            self.dice.append(newDie)
            diceArray.append(newDie)
            
            facesArray[facesArray.count-1].dice = diceArray
            
            if collectionView != nil {
                
                if dice.count == 1000 {
                    collectionView?.reloadData()
                }
                else {
                    let section = facesArray.count-1
                    let row = diceArray.count-1
                    collectionView!.performBatchUpdates({
                        collectionView!.insertItemsAtIndexPaths([NSIndexPath(forRow: row, inSection: section)])
                        }, completion: nil)
                }
            }
        }
    }
    
    
    //
    //  roll all the dice in the bag
    //
    func rollIt() {
        
        for die in dice{
            die.rollIt()
        }
        
    }

    
    
}
