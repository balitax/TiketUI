//
//  BXDashView.swift
//  NiketCom
//
//  Created by Agus Cahyono on 05/12/20.
//

import Foundation
import UIKit

enum LineStyle {
    case horizontal
    case vertical
}

@IBDesignable class BXDashView: UIView {
    
    @IBInspectable var dashColor: UIColor = UIColor.lightGray
    @IBInspectable var horizontalLine: Bool = true {
        didSet {
            if horizontalLine {
                self.lineStyle = .horizontal
            } else {
                self.lineStyle = .vertical
            }
        }
    }
    
    private var lineStyle: LineStyle = .horizontal
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if lineStyle == .horizontal {
            let lineLayer = CAShapeLayer()
            lineLayer.strokeColor = dashColor.cgColor
            lineLayer.lineWidth = 2
            lineLayer.lineDashPattern = [3,2]
            let path = CGMutablePath()
            path.addLines(between: [CGPoint(x: 0, y: 0),
                                    CGPoint(x: 0, y: self.frame.height)])
            lineLayer.path = path
            self.layer.addSublayer(lineLayer)
        } else {
            let fullHeight = bounds.size.height
            let width = bounds.size.width

            let path = UIBezierPath()

            path.move(to: CGPoint(x: 0, y: fullHeight/2))
            path.addLine(to: CGPoint(x: width, y: fullHeight/2))

            path.lineWidth = 2

            let dashes: [CGFloat] = [3, 2]
            path.setLineDash(dashes, count: dashes.count, phase: 0)

            dashColor.setStroke()
            path.stroke()
        }
    }
    
}
