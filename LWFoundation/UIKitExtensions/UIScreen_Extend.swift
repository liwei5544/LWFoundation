//
//  UIScreen_Extend.swift


import UIKit

public extension UIScreen {
    static var width : CGFloat  {
        return UIScreen.main.bounds.size.width
    }
    static var height : CGFloat  {
        return UIScreen.main.bounds.size.height
    }
    static var size : CGSize  {
        return UIScreen.main.bounds.size
    }
    static var size_swap : CGSize  {
        return CGSize(width: height, height: width)
    }
}
public extension UIDevice {
    public func isX() -> Bool {
        if UIScreen.main.bounds.height == 812 {
            return true
        }
        
        return false
    }
    
    public func getNavHeight() ->CGFloat {
        if isX() {
            return 88
        } else {
            return 64
        }
    }
}
