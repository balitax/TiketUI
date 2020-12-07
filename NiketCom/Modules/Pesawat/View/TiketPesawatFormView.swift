//
//  TiketPesawatFormView.swift
//  NiketCom
//
//  Created by Agus Cahyono on 05/12/20.
//

import UIKit

class TiketPesawatFormView: BaseView {
    
    @IBOutlet weak var curvedHeader: UIView! {
        didSet {
            self.curvedHeader.backgroundColor = Constant.AppTheme.mainBlue
            self.curvedHeader.addBottomRoundedEdge(0.5)
        }
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Pesawat"
        setupTableView()
    }
    
    private func setupTableView() {
        self.tableView.registerReusableCell(DestinationFormInputViewCell.self)
        self.tableView.registerReusableCell(InfoTerbaruTableViewCell.self)
        self.tableView.registerReusableCell(LastSearchOfPesawatTableViewCell.self)
        self.tableView.registerReusableHeaderFooterView(HeaderSectionView.self)
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = .clear
        self.tableView.contentInsetAdjustmentBehavior = .never
        self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        self.tableView.separatorStyle = .none
        self.tableView.keyboardDismissMode = .onDrag
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

extension TiketPesawatFormView: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: DestinationFormInputViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
            
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell: InfoTerbaruTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
            
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell: LastSearchOfPesawatTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
            
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderSectionView.reuseIdentifier) as! HeaderSectionView
        
        if section == 1 {
            header.sectionLabel.text = "Info Terbaru COVID-19!"
            header.sectionRightButton.isHidden = true
            return header
        } else if section == 2 {
            header.sectionLabel.text = "Pencarian Terakhir"
            header.sectionRightButton.isHidden = false
            return header
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 || section == 2 {
            return 30.0
        } else {
            return CGFloat.leastNonzeroMagnitude
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
}

extension TiketPesawatFormView: DestinationFormInputViewDelegate {
    
    func didChoosePulangPergi(_ pp: Bool) {
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
    
    func didCariPenerbangan(_ data: String) {
        let penerbangan = PesawatListView()
        self.navigationController?.pushViewController(penerbangan, animated: true)
    }
    
}
