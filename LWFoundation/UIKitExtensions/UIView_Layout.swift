//
//  UIView_Layout.swift


import UIKit

public extension UIView {
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
    var centerX: CGFloat {
        get { return self.center.x }
        set(centerX) {
            self.center = CGPoint(x: centerX, y: self.center.y)
        }
    }
    var centerY: CGFloat {
        get { return self.center.y }
        set(centerY) {
            self.center = CGPoint(x: self.centerX, y: centerY)
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
    var size: CGSize {
        get { return self.frame.size }
        set(size) {
            var frame = self.frame
            frame.size = size
            self.frame = frame
        }
    }
    func  viewSetting(_ image:UIImage) -> UIView {
        let   leftView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        let  imageView = UIImageView (frame:(CGRect(x: 10, y: 5, width: 20, height: 20)))
        imageView.image = image
        leftView.addSubview(imageView)
        
        return leftView
    }
    
    @IBInspectable
    var borderColor:UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    @IBInspectable
    var borderWidth:CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var cornerRadius:CGFloat {
        get {
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
        }
    }
    
}
