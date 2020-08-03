//
//  AnnotatedPhotoCell.swift
//  iOSUICollectionView
//
//  Created by TY J on 2020/08/03.
//  Copyright © 2020 TY J. All rights reserved.
//

import UIKit


internal class AnnotatedPhotoCell : UICollectionViewCell {
 
    @IBOutlet weak var iv_photo: UIImageView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!

    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        
        let attributes = layoutAttributes as! PinterestLayoutAttributes
        
        heightConstraint.constant = attributes.photoHeight
    }
    
}
