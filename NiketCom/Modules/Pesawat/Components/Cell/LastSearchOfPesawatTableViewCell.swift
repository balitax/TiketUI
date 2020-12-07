//
//  LastSearchOfPesawatTableViewCell.swift
//  NiketCom
//
//  Created by Agus Cahyono on 07/12/20.
//

import UIKit

class LastSearchOfPesawatTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: PaggedFlowLayout!
    
    private var space:CGFloat = 12.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setCollectionView()
    }
    
    fileprivate func setCollectionView() {
        
        collectionView.registerReusableCell(LastSearchHistoryOfPesawatCollectionViewCell.self)
        collectionView.backgroundColor = .clear
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: space, bottom: 0, right: space)
        collectionView.isPagingEnabled = false
        collectionView.decelerationRate = .fast
        collectionView.dataSource = self
        
        let itemWidth                               =  UIScreen.main.bounds.size.width * 0.75
        collectionViewFlowLayout.itemSize           = CGSize(width: itemWidth, height: 100)
        collectionViewFlowLayout.minimumLineSpacing = space
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension LastSearchOfPesawatTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: LastSearchHistoryOfPesawatCollectionViewCell = collectionView.dequeueReusableCell(indexPath: indexPath)
        return cell
    }
    
}
