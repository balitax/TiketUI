//
//  BXSwitch.swift
//  NiketCom
//
//  Created by Agus Cahyono on 05/12/20.
//

import Foundation
import UIKit

@IBDesignable class BXSwitch: UISwitch {

    @IBInspectable var scale : CGFloat = 1{
        didSet{
            setup()
        }
    }

    //from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    //from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    private func setup(){
        self.transform = CGAffineTransform(scaleX: scale, y: scale)
    }

    override func prepareForInterfaceBuilder() {
        setup()
        super.prepareForInterfaceBuilder()
    }


}
