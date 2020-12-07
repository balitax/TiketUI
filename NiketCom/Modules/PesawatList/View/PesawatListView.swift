//
//  PesawatListView.swift
//  NiketCom
//
//  Created by Agus Cahyono on 07/12/20.
//

import UIKit

class PesawatListView: BaseView {
    
    @IBOutlet weak var breadcrumbFilterContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Jakarta - Surabaya"
        breadcrumbFilterContainer.backgroundColor = Constant.AppTheme.mainBlue
        breadcrumbFilterContainer.addBottomRoundedEdge(0.5)
        addCustomNaviewTitle()
    }
    
    func addCustomNaviewTitle() {
        let imageView = UIImageView()
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 20)
        ])
        imageView.tintColor = .white
        imageView.image = UIImage(systemName: "arrow.right")
        
        let originText = UILabel()
        originText.textColor = .white
        originText.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        originText.text = "Jakarta"
        
        let destinationText = UILabel()
        destinationText.textColor = .white
        destinationText.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        destinationText.text = "Surabaya"
        
        self.createCustomNavigationViewTitle([originText, imageView, destinationText])
    }
    
    override var wx_navigationBarBackgroundColor: UIColor? {
        return Constant.AppTheme.mainBlue
    }
    
    override var wx_barTintColor: UIColor? {
        return .white
    }
    
    override var wx_titleTextAttributes: [NSAttributedString.Key : Any]? {
        return [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
    }
    
}
