//
//  PromoBannerSection.swift
//  NiketCom
//
//  Created by Agus Cahyono on 05/12/20.
//

import RxSwift

class PromoBannerSection: Sections {
    
    var numberOfItems: Int = 1
    
    var reuseIdentifier: String {
        return PromoBannerCollectionViewCell.reuseIdentifier
    }
    
    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(230))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
    func configureCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PromoBannerCollectionViewCell = collectionView.dequeueReusableCell(indexPath: indexPath)
        return cell
    }
    
}
