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
        
        let layout = Layout()
    
        layout.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0)
        layout.headerReferenceSize = CGSizeMake(collectionView!.frame.size.width, 35.0);
        collectionView?.collectionViewLayout = layout
        
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
        label.textAlignment = .Center
        
        let diceArray = Array(bag.faces.values)[indexPath.section]
        
        let dice = diceArray[indexPath.row]
        label.text = String(dice.value)
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        cell.contentView.addSubview(label)
        
        cell.backgroundColor = UIColor.blueColor()
        return cell
        
    }
    
     override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
    
            let header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "header", forIndexPath: indexPath) as! HeaderView
        
            let diceArray = Array(bag.faces.values)[indexPath.section]
            let faces = Array(bag.faces.keys)[indexPath.section]
        
            header.descLabel.text = "\(diceArray.count) dice with \(faces) faces"
        
            return header
        
        
    }
    
    override func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        animateCell(cell)
    }
    
    func animateCell(cell: UICollectionViewCell) {
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.fromValue = 200
        cell.layer.cornerRadius = 0
        animation.toValue = 0
        animation.duration = 1
        cell.layer.addAnimation(animation, forKey: animation.keyPath)
    }
    
    
    @IBAction func rollButtonClicked(sender: AnyObject) {
        
        bag.rollIt()
        
        collectionView?.reloadData()
        
        
    }
    
}
