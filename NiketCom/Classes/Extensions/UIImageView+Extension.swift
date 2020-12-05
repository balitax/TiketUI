//
//  UIImageView+Extension.swift
//  MiniPedia
//
//  Created by Agus Cahyono on 19/10/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImageFromNetwork(url: String) {
        self.kf.setImage(with: URL(string: url), options: [.cacheMemoryOnly, .transition(.fade(0.5))])
    }
    
}
