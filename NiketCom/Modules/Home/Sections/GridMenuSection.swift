//
//  GridMenuSection.swift
//  NiketCom
//
//  Created by Agus Cahyono on 05/12/20.
//

import RxSwift

class GridMenuSection: Sections {
    
    var numberOfItems: Int = Constant.GridMenuItems.items.count
    
    var reuseIdentifier: String {
        return GridMenuItemViewCell.reuseIdentifier
    }
    
    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.25),
            heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(120))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(50)
        )
        
        // add header
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: "SectionHeaderElementKind",
            alignment: .top
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    func configureCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell: GridMenuItemViewCell = collectionView.dequeueReusableCell(indexPath: indexPath)
        cell.bindData(Constant.GridMenuItems.items[indexPath.row])
        return cell
    }
    
    func configureHeaderView(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionReusableView {
        
        let header: HeaderSectionTitleReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: .header, forIndexPath: indexPath)
        header.titleSection.text = "Hey kamu, mau kemana ?"
        header.subTitleSection.isHidden = true
        return header
        
    }
    
    
}
