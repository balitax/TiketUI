//
//  HomeView.swift
//  NiketCom
//
//  Created by Agus Cahyono on 05/12/20.
//

import UIKit
import RxSwift
import RxCocoa
import CRRefresh
import SkeletonView

class HomeView: BaseView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var sections : [Sections] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNavigationLogo()
        addRightMenuItems()
        setupCollectionView()
        
        self.collectionView.showAnimatedGradientSkeleton()
        
        self.observeMsgButtonItem
            .subscribe(onNext: { [unowned self] _ in
                self.printData()
            }).disposed(by: disposeBag)
        
        collectionView.cr.addHeadRefresh(animator: FastAnimator()) { [unowned self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                self.collectionView.cr.endHeaderRefresh()
                self.collectionView.cr.resetNoMore()
                self.collectionView.reloadData()
                
            })
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.collectionView.hideSkeleton()
            self.collectionView.reloadData()
            
        })
        
        collectionView.rx.itemSelected
            .subscribe(onNext: { [unowned self] indexPath in
                self.route(indexPath.section, row: indexPath.row)
            }).disposed(by: disposeBag)
        
    }
    
    fileprivate func setupCollectionView() {
        collectionView.collectionViewLayout = self.collectionViewLayout()
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        collectionView.backgroundColor = .white
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.registerReusableCell(PromoBannerCollectionViewCell.self)
        collectionView.registerReusableCell(GridMenuItemViewCell.self)
        collectionView.registerReusableCell(GridProductListCollectionViewCell.self)
        collectionView.registerReusableCell(GridCardStyleCollectionViewCell.self)
        collectionView.register(view: HeaderSectionTitleReusableView.self, asSupplementaryViewKind: .header)
        
        self.sections = [
            PromoBannerSection(),
            GridMenuSection(),
            GridProductSection(.covid),
            GridProductSection(.hotpromo),
            GridProductSection(.inspiration),
            GridProductSection(.escape),
            GridProductSection(.offers)
        ]
        
        collectionView.performBatchUpdates {
            self.collectionView.reloadData()
        } completion: { _ in
            
        }
        
    }
    
    fileprivate func collectionViewLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout{(sectionIndex, environment) -> NSCollectionLayoutSection? in
            
            let section = self.sections[sectionIndex].layoutSection()
            
            if sectionIndex != 0 {
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 16, trailing: 8)
            } else {
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            }
            
            return section
            
        }
        return layout
    }
    
    func printData() {
        print("LIHAT NOTIF")
    }
    
    override var wx_navigationBarBackgroundColor: UIColor? {
        return Constant.AppTheme.mainBlue
    }
    
    func route(_ section: Int, row: Int) {
        if section == 1 {
            if row == 0 {
                let pesawat = TiketPesawatFormView()
                self.navigationController?.pushViewController(pesawat, animated: true)
            }
        }
    }
    
}

extension HomeView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[indexPath.section].configureCell(collectionView, indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        sections[indexPath.section].configureHeaderView(collectionView, indexPath: indexPath)
    }
    
}


extension HomeView: SkeletonCollectionViewDataSource {
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        
        sections[indexPath.section].reuseIdentifier
        
    }
    
    func numSections(in collectionSkeletonView: UICollectionView) -> Int {
        4
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItems
    }
    
    
}
