//
//  BaseView.swift
//  NiketCom
//
//  Created by Agus Cahyono on 05/12/20.
//

import UIKit
import RxSwift

open class BaseView: UIViewController {
    
    public var disposeBag = DisposeBag()
    public var observeMsgButtonItem = PublishSubject<Void>()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    internal func addNavigationLogo() {
        let logoImage = UIImage.init(named: "applogo")
        let logoImageView = UIImageView.init(image: logoImage)
        logoImageView.contentMode = .scaleAspectFit
        let imageItem = UIBarButtonItem.init(customView: logoImageView)
        navigationItem.leftBarButtonItems = [imageItem]
    }
    
    internal func addRightMenuItems() {
        
        let pointImage = UIImage.init(named: "poinIcon")
        let pointImageView = UIImageView.init(image: pointImage)
        pointImageView.contentMode = .scaleAspectFit
        let pointImageItem = UIBarButtonItem.init(customView: pointImageView)
        
        let pointLabel = UILabel()
        pointLabel.text = "1.558"
        pointLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        pointLabel.textColor = .white
        pointLabel.textAlignment = .center
        let pointLabelItem = UIBarButtonItem.init(customView: pointLabel)
        
        let addBadgeToButton = BadgedButtonItem()
        let msgImage = UIButton(type: .custom)
        msgImage.frame = CGRect(x: 0, y: 0, width: 25.0, height: 25.0)
        msgImage.addTarget(self, action: #selector(self.didTapMsgButtonItem(_:)), for: .touchUpInside)
        msgImage.setImage(UIImage(named: "mgsIcon"), for: .normal)
        
        addBadgeToButton.setup(customButton: msgImage)
        
        addBadgeToButton.badgeValue = "3"
        addBadgeToButton.badgeOriginX = 15.0
        addBadgeToButton.badgeOriginY = -5.0
        
        
        navigationItem.rightBarButtonItems = [addBadgeToButton, pointLabelItem, pointImageItem ]
    }
    
    @objc func didTapMsgButtonItem(_ sender: UIButton) {
        self.observeMsgButtonItem.onNext(())
    }
    
}
