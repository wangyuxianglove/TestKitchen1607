//
//  KTCDownloader.swift
//  Testkitchen1607
//
//  Created by qianfeng on 16/10/24.
//  Copyright © 2016年 zhb. All rights reserved.
//

import UIKit
import Alamofire

protocol KTCDownloaderDelegate:NSObjectProtocol {
    //下载失败
    func downloader(downloader:KTCDownloader,didFailWithError error:NSError)
    
    //下载成功
      func downloader(downloader:KTCDownloader,didFinishWithData data:NSData?)
}
class KTCDownloader: NSObject {
    //代理属性
    weak var delegate:KTCDownloaderDelegate?
    
       // POST请求数据
    func postWithUrl(urlString:String,params:Dictionary<String,AnyObject>)
    {
        Alamofire.request(.POST, urlString, parameters: params, encoding: ParameterEncoding.URL, headers:nil).responseData { (reaponse) in
        switch reaponse.result{
            //出错
        case.Failure(let error):
            self.delegate?.downloader(self, didFailWithError: error)
            //成功
        case.Success:
            self.delegate?.downloader(self, didFinishWithData: reaponse.data)
            
        }
        }
        
        
        
        }
    }

