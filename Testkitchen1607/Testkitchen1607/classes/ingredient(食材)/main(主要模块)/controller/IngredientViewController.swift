//
//  IngredientViewController.swift
//  Testkitchen1607
//
//  Created by qianfeng on 16/10/21.
//  Copyright © 2016年 zhb. All rights reserved.
//

import UIKit

class IngredientViewController: BaseViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()

       view.backgroundColor=UIColor.redColor()
        
        automaticallyAdjustsScrollViewInsets=false
        //下载首页数据
        //methodName=SceneHome&token=&user_id=&version=4.5
        downloadRecommendData()
    }
    func downloadRecommendData(){
        let params=["methodName":"SceneHome","token":"","user_id":"","version":"4.5"]
        let downloader=KTCDownloader()
        downloader.delegate=self
        downloader.postWithUrl(kHostUrl, params: params)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK:KTCDownloaderDelegate代理方法
extension IngredientViewController:KTCDownloaderDelegate{
    func downloader(downloader: KTCDownloader, didFailWithError error: NSError) {
        print(error)
    }

    func downloader(downloader: KTCDownloader, didFinishWithData data: NSData?) {
        
//        let str = NSString(data: data!, encoding: NSUTF8StringEncoding)
//        print(str!)
        if let tmpData = data {
            //1.json解析
        let recommendModel=IngreRcommend.parseData(tmpData)
          //2.显示ui
            //print(NSThread.currentThread())
            let recommendView=IngreRecommendView(frame: CGRectZero)
            recommendView.model=recommendModel
            view.addSubview(recommendView)
            
            //点击食材的推荐界面跳转后面界面
            //var jumpClosure:IngreJumpClourse?
            recommendView.jumpClosure={
                jumUrl in
                print(jumUrl)
            }
            //约束
            recommendView.snp_makeConstraints(closure: { (make) in
                make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(64, 0, 49, 0))
            })
            
        }
        

    }
   }






