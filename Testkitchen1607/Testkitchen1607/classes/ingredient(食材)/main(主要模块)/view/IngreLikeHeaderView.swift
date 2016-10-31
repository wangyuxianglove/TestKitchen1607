//
//  IngreLikeHeaderView.swift
//  Testkitchen1607
//
//  Created by qianfeng on 16/10/26.
//  Copyright © 2016年 zhb. All rights reserved.
//

import UIKit

class IngreLikeHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        //设置背景颜色
        backgroundColor=UIColor(white: 0.9, alpha: 1.0)
        
        //文本输入框
        
        let textField=UITextField(frame: CGRect(x: 40, y: 4, width: bounds.size.width-40*2, height: 36))
        textField.placeholder="输入菜名或食材"
        textField.borderStyle = .RoundedRect
      addSubview(textField)
        //设置搜索图片
        let image=UIImage(named: "search1")
        let imageView=UIImageView(image: image)
        imageView.frame=CGRectMake(0, 0, 25, 25)
        
        textField.leftView=imageView
      textField.leftViewMode = .Always
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
