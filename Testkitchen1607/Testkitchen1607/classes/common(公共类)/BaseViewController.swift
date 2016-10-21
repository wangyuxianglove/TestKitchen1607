//
//  BaseViewController.swift
//  Testkitchen1607
//
//  Created by qianfeng on 16/10/21.
//  Copyright © 2016年 zhb. All rights reserved.
//

import UIKit

/*视图控制器的公共父类
 用来封住一些公共的代码
 */

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    view.backgroundColor=UIColor.whiteColor()
       
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
