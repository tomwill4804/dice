//
//  Layout.swift
//  Dice
//
//  Created by Tom Williamson on 5/24/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

import UIKit

class Layout: UICollectionViewFlowLayout {

    override func initialLayoutAttributesForAppearingItemAtIndexPath(itemIndexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
    
        let attr = self.layoutAttributesForItemAtIndexPath(itemIndexPath)
        
        attr!.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(0.2, 0.2), CGFloat(M_PI))
        
        attr!.center = CGPointMake(CGRectGetMidX(self.collectionView!.bounds), CGRectGetMaxY(self.collectionView!.bounds))
        
        return attr;
        
    }
    

}
