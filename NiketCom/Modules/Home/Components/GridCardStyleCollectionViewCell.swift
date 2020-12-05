//
//  GridCardStyleCollectionViewCell.swift
//  NiketCom
//
//  Created by Agus Cahyono on 05/12/20.
//

import UIKit

class GridCardStyleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        containerView.addShadow(offset: CGSize(width: 0, height: 1), color: Constant.AppTheme.shadowColor, borderColor: Constant.AppTheme.shadowColor, radius: 2, opacity: 0.8)
        containerView.layer.cornerRadius = 4
        
        
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 4
        imageView.layer.maskedCorners =  [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        imageView.layoutIfNeeded()
        
    }

}

extension GridCardStyleCollectionViewCell: Reusable { }
