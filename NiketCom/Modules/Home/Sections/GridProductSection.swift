//
//  CovidSection.swift
//  NiketCom
//
//  Created by Agus Cahyono on 05/12/20.
//

import Foundation
import RxSwift

enum ProductType {
    case covid
    case hotpromo
    case inspiration
    case escape
    case offers
    case other
    
    var title: String {
        switch self {
        case .covid:
            return "COVID-19 Test"
        case  .hotpromo:
            return "Belum Kesamber Harga Gledek?"
        case .inspiration:
            return "Inspirasi Buat Liburan Akhir Tahun"
        case .escape:
            return "Short Escape di Jabodetabek"
        case .offers:
            return "Penawaran Special 2020"
        default:
            return ""
        }
    }
    
    var subtitle: String {
        switch self {
        case .covid:
            return "Sebelum melakukan perjalanan, lakukan Rapid & Swab Test COVID-19 dengan partner kesehatan tiket.com!"
        case  .hotpromo:
            return "Tenang! Masih ada promo buatmu. Diskon s.d 60% dan ada diskon tambahan s.d IDR 1.000.000."
        case .inspiration:
            return "Penghujung tahun 2020 udah dekat! Mau kemana akhir tahun ini?"
        case .escape:
            return "Usai jalanin rutinitas padat, saatnya kami liburan singkat. Cek pilihan hotelnya disini, yuk!"
        case .offers:
            return "Penawaran special khusus buat kamu lo!"
        default:
            return ""
        }
    }
    
}

class GridProductSection: Sections {
    
    var numberOfItems: Int = 6
    private var productType = ProductType.covid
    
    init(_ type: ProductType) {
        self.productType = type
    }
    
    var reuseIdentifier: String {
        GridMenuItemViewCell.reuseIdentifier
    }
    
    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        
        var widthColumn: CGFloat = 0.5
        
        if productType == .inspiration || productType == .offers {
            widthColumn = 0.8
        } else {
            widthColumn = 0.38
        }
        
        var heightGroup: CGFloat = 200
        if productType == .inspiration {
            heightGroup = 190
        } else {
            heightGroup = 210
        }
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(widthColumn),
            heightDimension: .estimated(heightGroup))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        if productType != .offers {
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
        }
        
        var heightHeader: CGFloat = 76
        if productType == .offers {
            heightHeader = 60
        } else {
            heightHeader = 76
        }
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(heightHeader)
        )
        
        // add header
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: "SectionHeaderElementKind",
            alignment: .top
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        if productType == .inspiration {
            section.orthogonalScrollingBehavior = .groupPaging
        } else if productType == .offers {
            section.orthogonalScrollingBehavior = .groupPaging
        } else {
            section.orthogonalScrollingBehavior = .continuous
        }
        
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    func configureCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        if productType == .offers {
            let cell: GridCardStyleCollectionViewCell = collectionView.dequeueReusableCell(indexPath: indexPath)
            return cell
        } else {
            let cell: GridProductListCollectionViewCell = collectionView.dequeueReusableCell(indexPath: indexPath)
            return cell
        }
    }
    
    func configureHeaderView(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionReusableView {
        
        let header: HeaderSectionTitleReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: .header, forIndexPath: indexPath)
        header.titleSection.text = productType.title
        header.subTitleSection.isHidden = false
        header.subTitleSection.text = productType.subtitle
        return header
        
    }
    
}
