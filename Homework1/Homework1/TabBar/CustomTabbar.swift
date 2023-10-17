//
//  File.swift
//  Homework1
//
//  Created by Eken Özlü on 17.10.2023.
//

import UIKit


class CustomTabbar: UITabBar {
    
    private var shapeLayer : CALayer?
    
    override func draw(_ rect: CGRect) {
        self.addShape()
        self.unselectedItemTintColor = UIColor(named: "SecondaryFont")
        self.tintColor = UIColor(named:"AppOrange")
    }
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 0
        
        shapeLayer.shadowOffset = CGSize(width: 0, height: 0)
        shapeLayer.shadowRadius = 10
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOpacity = 0.3
        
        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }
    
    func createPath() -> CGPath {
        let radius : CGFloat = 40
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: centerWidth - radius - 10, y: 0))
        
        path.addArc(withCenter: CGPoint(x: centerWidth - radius - 10, y: 10), radius: 10,
                    startAngle: 90 * .pi / 180, endAngle: 0 * .pi / 180, clockwise: true)
        
        path.addArc(withCenter: CGPoint(x: centerWidth, y: 10), radius: radius,
                    startAngle: 180 * .pi / 180, endAngle: 0 * .pi / 180, clockwise: false)
        
        path.addArc(withCenter: CGPoint(x: centerWidth + radius + 10, y: 10), radius: 10,
                    startAngle: 180 * .pi / 180, endAngle: 270 * .pi / 180, clockwise: true)
        
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        
        return path.cgPath
    }
}
