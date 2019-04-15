//
//  SharpImageView.swift
//  jasper
//
//  Created by User16 on 2019/4/15.
//  Copyright © 2019 User16. All rights reserved.
//

import UIKit

class SharpImageView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 200, height: 200))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        layer.mask = shapeLayer
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
