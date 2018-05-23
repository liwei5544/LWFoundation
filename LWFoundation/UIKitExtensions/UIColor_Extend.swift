//
//  UIColor_Layout.swift
//  <https://github.com/snail-z/OverlayController-Swift.git>
//
//  Created by zhanghao on 2017/2/24.
//  Copyright © 2017年 zhanghao. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init?(hex:String) {
        guard hex.count>=6 else {
            return nil
        }
        
        var hexTemp = hex.uppercased()
        if hexTemp.hasPrefix("0X") || hexTemp.hasPrefix("##"){
            hexTemp = (hexTemp as NSString).substring(from: 2)
        }
        
        if hexTemp.hasPrefix("#"){
            hexTemp = (hexTemp as NSString).substring(from: 1)
        }
        
        var range = NSRange(location: 0, length: 2)
        let rHex = (hexTemp as NSString).substring(with: range)
        range.location = 2
        let gHex = (hexTemp as NSString).substring(with: range)
        range.location = 4
        let bHex = (hexTemp as NSString).substring(with: range)
        
        var r : UInt32 = 0
        var g : UInt32 = 0
        var b : UInt32 = 0
        
        Scanner(string: rHex).scanHexInt32(&r)
        Scanner(string: gHex).scanHexInt32(&g)
        Scanner(string: bHex).scanHexInt32(&b)
        
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
    }
    static var random : UIColor  {
        let aRedValue   = (CGFloat)(arc4random() % 255),
            aGreenValue = (CGFloat)(arc4random() % 255),
            aBlueValue  = (CGFloat)(arc4random() % 255)
        return UIColor(red: aRedValue / 255.0, green: aGreenValue / 255.0, blue: aBlueValue / 255.0, alpha: 1.0)
    }
    
    static func rgba(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a / 255.0)
    }
    
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return rgba(r: r, g: g, b: b, a: 0xff)
    }
    
    static func colorWithHexString (hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
