//
//  PromoBannerCollectionViewCell.swift
//  NiketCom
//
//  Created by Agus Cahyono on 05/12/20.
//

import UIKit

class PromoBannerCollectionViewCell: BaseCollectionViewCell {
    
    @IBOutlet weak var bannerSlide: ZCycleView!
    @IBOutlet weak var currentPositionCount: UILabel!
    @IBOutlet weak var lastCount: UILabel!
    
    private var tiketBanners = [
        "https://m.tiket.com/home-ms/assets/banner_ind.png",
        "https://blog.tiket.com/wp-content/uploads/TEASERSALEPRISE_HOTEL_Blog-900x570.jpg",
        "https://m.tiket.com/home-ms/assets/banner_ind.png",
        "https://blog.tiket.com/wp-content/uploads/TEASERSALEPRISE_HOTEL_Blog-900x570.jpg",
        "https://m.tiket.com/home-ms/assets/banner_ind.png",
        "https://blog.tiket.com/wp-content/uploads/TEASERSALEPRISE_HOTEL_Blog-900x570.jpg",
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bannerSetup()
    }
    
    private func bannerSetup() {
        bannerSlide.delegate = self
        bannerSlide.backgroundColor = .lightGray
        bannerSlide.itemSize = CGSize(width: UIScreen.main.bounds.size.width, height: 300)
        bannerSlide.itemSpacing = 0
        bannerSlide.timeInterval = 4
        bannerSlide.setUrlsGroup(tiketBanners)
        
        currentPositionCount.text = "1"
        lastCount.text = "\(tiketBanners.count)"
        
    }
    
}

extension PromoBannerCollectionViewCell: Reusable { }

extension PromoBannerCollectionViewCell: ZCycleViewProtocol {
    
    func cycleViewConfigureDefaultCellImage(_ cycleView: ZCycleView, imageView: UIImageView, image: UIImage?, index: Int) {
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 0
        imageView.clipsToBounds = true
    }
    
    func cycleViewConfigureDefaultCellImageUrl(_ cycleView: ZCycleView, imageView: UIImageView, imageUrl: String?, index: Int) {
        imageView.setImageFromNetwork(url: imageUrl ?? "")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
    }
    
    func cycleViewConfigureDefaultCellText(_ cycleView: ZCycleView, titleLabel: UILabel, index: Int) {
        titleLabel.isHidden = true
    }
    
    func cycleViewConfigurePageControl(_ cycleView: ZCycleView, pageControl: ZPageControl) {
        pageControl.alignment = .left
        pageControl.isHidden = true
    }
    
    func cycleViewDidScrollToIndex(_ cycleView: ZCycleView, index: Int) {
        self.currentPositionCount.text = "\(index + 1)"
    }
    
    
}
