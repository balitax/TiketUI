//
//  PesawatListView.swift
//  NiketCom
//
//  Created by Agus Cahyono on 07/12/20.
//

import UIKit

class PesawatListView: BaseView {
    
    @IBOutlet weak var breadcrumbFilterContainer: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Jakarta - Surabaya"
        breadcrumbFilterContainer.backgroundColor = Constant.AppTheme.mainBlue
        breadcrumbFilterContainer.addBottomRoundedEdge(0.5)
        addCustomNaviewTitle()
        setupTableView()
    }
    
    private func setupTableView() {
        self.tableView.registerReusableCell(PesawatListTableViewCell.self)
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = .clear
        self.tableView.contentInsetAdjustmentBehavior = .never
        self.tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        self.tableView.separatorStyle = .none
        self.tableView.keyboardDismissMode = .onDrag
        self.view.showAnimatedGradientSkeleton()
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

extension PesawatListView: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PesawatListTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.selectionStyle = .none
        return cell
    }
}
