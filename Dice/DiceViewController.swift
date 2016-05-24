//
//  DiceViewController.swift
//  Dice
//
//  Created by Tom Williamson on 5/24/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

import UIKit

class DiceViewController: UICollectionViewController {
    
    var bag: Bag!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        shake()
        
    }
    
    func shake() {
        
        bag = Bag()
        bag.addDice(5, faces: 4)
        bag.addDice(6, faces: 6)
        bag.addDice(3, faces: 10)
        bag.addDice(5, faces: 20)
        
        collectionView?.reloadData()
        
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return bag.faces.count
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let diceArray = Array(bag.faces.values)[section]
        return diceArray.count
        
    }
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath:NSIndexPath)->UICollectionViewCell
    {
        
        let  cell = collectionView.dequeueReusableCellWithReuseIdentifier("diceCell", forIndexPath: indexPath)
        let label = UILabel(frame: cell.bounds)
        
        let diceArray = Array(bag.faces.values)[indexPath.section]
        
        let dice = diceArray[indexPath.row]
        label.text = String(dice.value)
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        cell.contentView.addSubview(label)
        
        cell.backgroundColor = UIColor.blueColor()
        return cell
        
    }
    

}
