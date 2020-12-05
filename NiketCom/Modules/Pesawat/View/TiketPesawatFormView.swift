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
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = .clear
        self.tableView.contentInsetAdjustmentBehavior = .never
        self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        self.tableView.separatorStyle = .none
        self.tableView.keyboardDismissMode = .onDrag
        
        var frame = CGRect.zero
        frame.size.height = .leastNormalMagnitude
        self.tableView.tableHeaderView = UIView(frame: frame)
        self.tableView.tableFooterView = UIView(frame: frame)
        
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
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell: DestinationFormInputViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
            
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}

extension TiketPesawatFormView: DestinationFormInputViewDelegate {
    
    func didChoosePulangPergi(_ pp: Bool) {
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
    
}
