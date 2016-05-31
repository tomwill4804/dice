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
        bag.addDice(5, faces: 4, collectionView: collectionView!)
        bag.addDice(6, faces: 6, collectionView: collectionView!)
        bag.addDice(3, faces: 10, collectionView: collectionView!)
        bag.addDice(5, faces: 20, collectionView: collectionView!)

        
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
      
        return bag.facesArray.count

    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return bag.facesArray[section].dice.count
        
    }
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath:NSIndexPath)->UICollectionViewCell
    {
        
        let  cell = collectionView.dequeueReusableCellWithReuseIdentifier("diceCell", forIndexPath: indexPath)
        let label = UILabel(frame: cell.bounds)
        label.textAlignment = .Center
        
        let diceArray = bag.facesArray[indexPath.section].dice
        let dice = diceArray[indexPath.row]
        
        label.text = String(dice.value)
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        cell.contentView.addSubview(label)
        
        cell.backgroundColor = UIColor.whiteColor()
        cell.layer.borderWidth=1.0
        cell.layer.borderColor=UIColor.blueColor().CGColor
        return cell
        
        
    }
    
     override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
    
            let header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "header", forIndexPath: indexPath) as! HeaderView
        
            let faces = bag.facesArray[indexPath.section]
        
            header.descLabel.text = "dice with \(faces.faces) faces"
        
            return header
        
        
    }
    
    override func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        //animateCell(cell)
        //NSThread.sleepForTimeInterval(0.1)
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
        
        bag = Bag()
        collectionView?.reloadData()
        shake()
        
        
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        if motion == .MotionShake {
            rollButtonClicked(self)
        }
    }
    
}
