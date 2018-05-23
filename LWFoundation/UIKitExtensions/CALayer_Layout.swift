//
//  CALayer_Layout.swift


import UIKit

public extension CALayer {
    var x : CGFloat {
        get{ return self.frame.origin.x }
        set(x) {
            self.frame.origin = CGPoint(x: x, y: self.frame.origin.y)
        }
    }
    var y : CGFloat {
        get{ return self.frame.origin.y }
        set(y) {
            self.frame.origin = CGPoint(x: self.x, y: y)
        }
    }
    var width : CGFloat {
        get{ return self.frame.size.width }
        set(width) {
            self.frame.size = CGSize(width: width, height: self.frame.height)
        }
    }
    var height : CGFloat {
        get{ return self.frame.size.height }
        set(height) {
            self.frame.size = CGSize(width: self.width, height: height)
        }
    }
    var right : CGFloat {
        get{ return self.frame.origin.x + self.frame.size.width }
        set(right) {
            var frame = self.frame
            frame.origin.x = right - frame.size.width
            self.frame = frame
        }
    }
    var bottom: CGFloat {
        get { return self.frame.origin.y + self.frame.size.height }
        set(bottom) {
            var frame = self.frame
            frame.origin.y = bottom - frame.size.height
            self.frame = frame
        }
    }
    var center: CGPoint {
        get { return CGPoint(x: self.frame.origin.x + self.frame.size.width * 0.5,
                             y: self.frame.origin.y + self.frame.size.height * 0.5) }
        set(center) {
            var frame = self.frame
            frame.origin.x = center.x - frame.size.width * 0.5
            frame.origin.y = center.y - frame.size.height * 0.5
            self.frame = frame
        }
    }
    var centerX: CGFloat {
        get { return self.frame.origin.x + self.frame.size.width * 0.5 }
        set(centerX) {
            var frame = self.frame
            frame.origin.x = centerX - frame.size.width * 0.5
            self.frame = frame
        }
    }
    var centerY: CGFloat {
        get { return self.frame.origin.y + self.frame.size.height * 0.5 }
        set(centerY) {
            var frame = self.frame
            frame.origin.y = centerY - frame.size.height * 0.5
            self.frame = frame
        }
    }
    var origin: CGPoint {
        get { return self.frame.origin }
        set(origin) {
            var frame = self.frame
            frame.origin = origin
            self.frame = frame
        }
    }
    var frameSize: CGSize {
        get { return self.frame.size }
        set(frameSize) {
            var frame = self.frame
            frame.size = frameSize
            self.frame = frame
        }
    }
    func addBorder(_ edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: thickness)
            
        case UIRectEdge.bottom:
            border.frame = CGRect(x: 0, y: self.frame.height - thickness, width: self.frame.width, height: thickness)
            
        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: self.frame.height)
            
        case UIRectEdge.right:
            border.frame = CGRect(x: self.frame.width - thickness, y: 0, width: thickness, height: self.frame.height)
            
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        self.addSublayer(border)
        
        
    }
    // 解决约束问题
    func addBorderWithLine(_ top: Bool = false, color: UIColor, thickness: CGFloat){
        let border = CALayer()
        var y = self.frame.height - thickness
        
        if top {
            y = 0
        }
        border.frame = CGRect(x: 0, y: y, width: self.frame.width/600*UIScreen.width, height: thickness)
        border.backgroundColor = color.cgColor
        self.addSublayer(border)
    }
}
