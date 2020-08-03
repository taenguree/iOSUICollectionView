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
            for i in 0..<20 {
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
        
        self.view.backgroundColor = UIColor.gray
        
        cv_pinterest.delegate = self
        cv_pinterest.dataSource = self
        
        let layout = PinterestLayout()

        layout.cellPadding = 5
        layout.delegate = self
        layout.numberOfColumns = 2

        cv_pinterest.collectionViewLayout = layout
    }

}

extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnnotatedPhotoCell", for: indexPath) as! AnnotatedPhotoCell
        cell.contentView.backgroundColor = UIColor.white
        return cell
    }
}

extension ViewController : PinterestLayoutDelegate {
    func collectioinView(collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        let random = arc4random_uniform(4) + 1
        return CGFloat(random * 100)
    }
    
    func collectioinView(collectionView: UICollectionView, heightForAnnotationIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        return 60
    }
}
