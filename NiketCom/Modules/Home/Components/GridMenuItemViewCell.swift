//
//  GridMenuItemViewCell.swift
//  NiketCom
//
//  Created by Agus Cahyono on 05/12/20.
//

import UIKit
import SkeletonView

class GridMenuItemViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var iconMenu: UIImageView!
    @IBOutlet weak var titleMenu: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        containerView.addShadow(offset: CGSize(width: 0, height: 6), color: Constant.AppTheme.shadowColor, borderColor: Constant.AppTheme.shadowColor, radius: 9, opacity: 1)
        iconMenu.layer.cornerRadius = 24
        titleMenu.layoutIfNeeded()
    }
    
    func bindData(_ data: Constant.GridMenuItems) {
        self.iconMenu.image = data.icon
        self.titleMenu.text =  data.title
    }

}

extension GridMenuItemViewCell: Reusable { }
