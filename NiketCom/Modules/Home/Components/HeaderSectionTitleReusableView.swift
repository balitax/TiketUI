//
//  HeaderSectionTitleReusableView.swift
//  NiketCom
//
//  Created by Agus Cahyono on 05/12/20.
//

import UIKit
import SkeletonView

class HeaderSectionTitleReusableView: UICollectionReusableView, Reusable {
    
    @IBOutlet weak var titleSection: UILabel!
    @IBOutlet weak var subTitleSection: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
