//
//  GridProductListCollectionViewCell.swift
//  NiketCom
//
//  Created by Agus Cahyono on 05/12/20.
//

import UIKit
import SkeletonView

class GridProductListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var imageProductHeight: NSLayoutConstraint!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.showAnimatedGradientSkeleton()
    }

}

extension GridProductListCollectionViewCell: Reusable { }
