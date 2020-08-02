//
//  ViewController.swift
//  iOSUICollectionView
//
//  Created by TY J on 2020/08/02.
//  Copyright © 2020 TY J. All rights reserved.
//

import UIKit

internal class ViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var cv_pinterest: UICollectionView!
    
    var colors: [UIColor] {
        get {
            var colors = [UIColor]()
            let palette = [UIColor.red, UIColor.green, UIColor.blue, UIColor.orange, UIColor.purple, UIColor.yellow]
            var paletteIndex = 0
            for i in 0..<60 {
                colors.append(palette[paletteIndex])
                
                if paletteIndex == (palette.count - 1) {
                    paletteIndex = 0
                } else {
                    paletteIndex = paletteIndex + 1
                }
            }
            return colors
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cv_pinterest.delegate = self
        cv_pinterest.dataSource = self
        
        let layout = PinterestLayout()
//        layout.itemSpacing = 10
//        layout.rowSpacing = 10
        layout.delegate = self
        layout.numberOfColumns = 2

        cv_pinterest.collectionViewLayout = layout
//
//        let layout = cv_pinterest.collectionViewLayout as! PinterestLayout
//
//        layout.delegate = self
//        layout.numberOfColumns = 2
    }

}

extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 60
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnnotatedPhotoCell", for: indexPath) as UICollectionViewCell
        cell.contentView.backgroundColor = colors[indexPath.item]
        return cell
    }
}

extension ViewController : PinterestLayoutDelegate {
    func collectioinView(collectionView: UICollectionView, heightForItemAtIndexPath indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
