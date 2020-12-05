//
//  DestinationFormInputViewCell.swift
//  NiketCom
//
//  Created by Agus Cahyono on 05/12/20.
//

import UIKit
import RxSwift

protocol DestinationFormInputViewDelegate: class {
    func didChoosePulangPergi(_ pp: Bool)
}

class DestinationFormInputViewCell: BaseTableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var ppSwitch: UISwitch!
    @IBOutlet weak var pulangViewContainer: UIView!
    @IBOutlet weak var btnCheckboxFlexi: UIButton!
    
    weak var delegate: DestinationFormInputViewDelegate?
    private var isFlexiSelected = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        containerView.addShadow(offset: CGSize(width: 0, height: 2), color: Constant.AppTheme.shadowColor, borderColor: Constant.AppTheme.shadowColor, radius: 4, opacity: 1)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        ppSwitch
            .rx.controlEvent(.valueChanged)
            .withLatestFrom(ppSwitch.rx.value)
            .subscribe(onNext: { [unowned self] pp in
                self.showPulangPergi(pp)
                self.delegate?.didChoosePulangPergi(pp)
            }).disposed(by: disposeBag)
        
        
        btnCheckboxFlexi.rx
            .tap
            .subscribe(onNext: { [unowned self] _ in
                self.isFlexiSelected.toggle()
                self.btnCheckboxFlexi.isCheckboxTapped(self.isFlexiSelected)
            }).disposed(by: disposeBag)
        
    }
    
    private func showPulangPergi(_ show: Bool) {
        UIView.animate(withDuration: 0.5) {
            self.pulangViewContainer.isHidden = !show
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
