
//
//  TKRequest.swift
//  SpellingChecker
//
//  Created by 玮 李 on 2017/4/6.
//  Copyright © 2017年 玮 李. All rights reserved.
//


import UIKit
import Alamofire
import ObjectMapper
class NetRequest: NSObject {
    
    /// 封装带获取Token的网络请求
    ///
    /// - Parameters:
    ///   - url: 网络请求地址
    ///   - par: 包体
    ///   - method: 请求方式
    ///   - completeHandle: 成功报200-300后向外传值value
    ///   - message: 失败向外传值msg
    ///   - failed: 超时等不返回statuscode的情况
    class func tkAndRequest(_ url:String, par:Any?, method:HTTPMethod,completeHandle:@escaping (_ JSONString: Any?)->Void,failed:@escaping (_ error: Error?) ->()){
        //超时时间
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        let sesionManager = Alamofire.SessionManager(configuration: configuration)
        sesionManager.request(url, method: method, parameters: par as? [String:Any],headers:["Content-Type":"application/x-www-form-urlencoded"]).responseJSON { (response) in
            sesionManager.session.invalidateAndCancel()
            
            switch response.result {
            //成功
            case .success(let valued):
                
                completeHandle(valued) //response.result.value
                break
                
            case .failure(let error):
                failed(error)
                if error._code == NSURLErrorTimedOut {
                    
                }
            }
        }
        
    }
    //========以上是请求========//
    class func tkAndRequestHtml(_ url:String, par:Any?, method:HTTPMethod,completeHandle:@escaping (_ JSONString: Any?)->Void,failed:@escaping (_ error: Error?) ->()){
        //超时时间
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest =  10
        let sesionManager = Alamofire.SessionManager(configuration: configuration)
        sesionManager.request(url, method: method, parameters: par as? [String:Any]).responseString { (response) in
            sesionManager.session.invalidateAndCancel()
            switch response.result {
            case .success(let valued):
                if valued.contains("用户名密码错误") {
                    completeHandle("用户名密码错误")
                } else if valued.contains("项目管理系统"){
                     NetRequest.saveCookies(url: response.response!.url!)
                     completeHandle("成功")
                }
               
                //UserDefaults.standard.set(url, forKey: "urlKey")
              
               
                break
            case .failure(let error):
                failed(error)
                if error._code == NSURLErrorTimedOut {
                    
                }
            }
        }
        
        
        
    }
    
    class func saveCookies(url:URL) {
        if let cookies = HTTPCookieStorage.shared.cookies(for: url) {
            let data = NSKeyedArchiver.archivedData(withRootObject: cookies)
            UserDefaults.standard.set(data, forKey: "HttpCookies")
            
        }
        
    }
    

}




