//
//  ViewController.swift
//  iOSUICollectionView
//
//  Created by TY J on 2020/08/02.
//  Copyright © 2020 TY J. All rights reserved.
//

import UIKit
import AVFoundation

internal class ViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var cv_pinterest: UICollectionView!
    
    private var photos = Photo.allPhotos()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        self.view.backgroundColor = UIColor.gray
        
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
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnnotatedPhotoCell", for: indexPath) as! AnnotatedPhotoCell
        cell.contentView.backgroundColor = UIColor.white
        return cell
    }
}

extension ViewController : PinterestLayoutDelegate {
    func collectioinView(collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        let photo = photos[indexPath.item]
        let boundingRect = CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
        let rect = AVMakeRect(aspectRatio: photo.size, insideRect: boundingRect)
        return rect.height
    }
    
    func collectioinView(collectionView: UICollectionView, heightForAnnotationIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        return 60
    }
}
