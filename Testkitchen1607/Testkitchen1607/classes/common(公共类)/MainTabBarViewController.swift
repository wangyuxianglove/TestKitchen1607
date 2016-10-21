//
//  MainTabBarViewController.swift
//  Testkitchen1607
//
//  Created by qianfeng on 16/10/21.
//  Copyright © 2016年 zhb. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    //tabbar的背景
    private var bgView:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //createViewControllers()
        //自定制tabbar
        view.backgroundColor=UIColor.whiteColor()
        tabBar.hidden=true
        creatMyTabBar()
        
        
        
    }
    //自定制tabbar
    func creatMyTabBar(){
        createViewControllers()
        // 1创建背景视图
        bgView = UIView.creatView()
        bgView?.backgroundColor=UIColor.init(white: 0.9, alpha: 1.0)
        //设置边框
        //        bgView?.layer.borderColor=UIColor.blackColor().CGColor
        //        bgView?.layer.borderWidth=1
        view.addSubview(bgView!)
        
        bgView?.snp_makeConstraints(closure: {[weak self] (make) in
            make.left.right.bottom.equalTo(self!.view)
            make.height.equalTo(49)
            })
        
        //图片名字
        let imageNames=["home","community","shop","shike","mine"]
        //标题
        let titles=["食材","社区","商城","食课","我的"]
        
        //循坏创建按钮
        let width=kscreenW/CGFloat(imageNames.count)
        
        for i in 0..<imageNames.count{
            //2.1按钮
            let imageName=imageNames[i]+"_normal"
            let selectName=imageNames[i]+"_select"
            let btn=UIButton.creatBtn(nil, bgImageName: imageName, highlightImageName: nil, selectImageName: selectName, target: self, action: #selector(clickBtn(_:)))
            btn.tag=300+i
            bgView?.addSubview(btn)
            
            //设置位置
            btn.snp_makeConstraints(closure: { [weak self](make) in
                make.top.bottom.equalTo(self!.bgView!)
                make.width.equalTo(width)
                make.left.equalTo(width*CGFloat(i))
                
                
                })
            
            //2.2显示标题
            let titleLabel=UILabel.creatLabel(titles[i], textAlignmet: .Center, font: UIFont.systemFontOfSize(12))
            btn.addSubview(titleLabel)
            
            //设置位置
            titleLabel.snp_makeConstraints(closure: { (make) in
                make.left.right.bottom.equalTo(btn)
                make.height.equalTo(20)
                
            })
        }
        
    }
    
    func clickBtn(curbtn:UIButton){
        let index=curbtn.tag-300
        if selectedIndex != index {
            //1.1 取消之前选中的按钮
            let lastBtn = bgView?.viewWithTag(300+selectedIndex)as! UIButton
            lastBtn.selected=false
            lastBtn.userInteractionEnabled=true
            
            //1.2选中当前的按钮
            curbtn.selected=true
            lastBtn.userInteractionEnabled=true
            
            
            
            //1.3切换视图控制器
            selectedIndex=index
        }
    }
    //创建视图控制器
    func createViewControllers()  {
        let nameArray=["IngredientViewController","CommunityViewController","MallViewController","FoodClassViewController","ProfileViewController"]
        //视图控制器对象的数组
        var ctrlArray=Array<UINavigationController>()
        for i in 0..<nameArray.count{
            let name="Testkitchen1607."+nameArray[i]
            //使用类名创建类名对象
            let ctrl = NSClassFromString(name)as! UIViewController.Type
            let vc=ctrl.init()
            //导航
            let navCtrl=UINavigationController(rootViewController: vc)
            ctrlArray.append(navCtrl)
        }
        viewControllers=ctrlArray
        }
    
    /* //创建视图控制器
     func createViewControllers()  {
     let nameArray=["IngredientViewController","CommunityViewController","MallViewController","FoodClassViewController","ProfileViewController"]
     //图片名字
     let imageNames=["home","community","shop","shike","mine"]
     //标题
     let titles=["食材","社区","商城","食课","我的"]
     //视图控制器对象的数组
     var ctrlArray=Array<UINavigationController>()
     for i in 0..<nameArray.count{
     let name="Testkitchen1607."+nameArray[i]
     //使用类名创建类名对象
     let ctrl = NSClassFromString(name)as! UIViewController.Type
     
     let vc=ctrl.init()
     //设置图片文字
     vc.tabBarItem.title=titles[i]
     let imageName=imageNames[i]+"_normal"
     vc.tabBarItem.image=UIImage(named: imageName)
     
     let selectName=imageNames[i]+"_select"
     vc.tabBarItem.selectedImage=UIImage(named: selectName)
     
     
     //导航
     let navCtrl=UINavigationController(rootViewController: vc)
     ctrlArray.append(navCtrl)
     }
     viewControllers=ctrlArray
     
     }
     */
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
