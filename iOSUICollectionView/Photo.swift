//
//  Photo.swift
//  iOSUICollectionView
//
//  Created by TY J on 2020/08/02.
//  Copyright © 2020 TY J. All rights reserved.
//

import Foundation
import UIKit


internal struct Photo {
    
    var size = CGSize(width: 100, height: 100)
    
    init(size: CGSize = CGSize(width: 100, height: 100)) {
        self.size = size
    }
    
    static func allPhotos() -> [Photo] {
        return [
            Photo(size: CGSize(width: 200, height: 300)), Photo(size: CGSize(width: 300, height: 100)),
            Photo(), Photo(),
            Photo(), Photo(),
            Photo(), Photo(),
            Photo(), Photo(),
            Photo(), Photo(),
            Photo(), Photo(),
            Photo(), Photo(),
            Photo(), Photo(),
            Photo(), Photo(),
            Photo(), Photo(),
        ]
    }
    
}

