//
//  ViewController.swift
//  HKLayout
//
//  Created by heke on 16/6/7.
//  Copyright © 2016年 mhk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view1 = UIView()
        view.addSubview(view1)
        
        view1.width.equalTo(view1.height)
        view1.height.equalTo(view.width,amultiplier: 0.1)
        view1.top.equalTo(view.top).offset(100)
        view1.centerX.equalTo(view.centerX)
        view1.backgroundColor = UIColor.redColor()
        
        let label = UILabel()
        label.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.5)
        label.textColor = UIColor.redColor()
        label.numberOfLines = 0
        label.text = "view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)"
        view.addSubview(label)
        label.size.equalTo(CGSizeMake(150, 150))
        label.alCenter.equalTo(view1.alCenter)
        
        let scrollView = UIScrollView()
        let contentView = UIView()
        let label1 = UILabel()
        
        label1.numberOfLines = 0
        contentView.addSubview(label1)
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
        
        scrollView.inset.equalTo(UIEdgeInsetsMake(220, 0, 0, 0))
        
        contentView.inset.equalTo(scrollView.inset)
        contentView.width.equalTo(scrollView.width)
        
        label1.inset.equalTo(UIEdgeInsetsMake(10, 10, 10, 10))
        
        scrollView.backgroundColor  = UIColor.blueColor()
        contentView.backgroundColor = UIColor.grayColor()
        label1.backgroundColor      = UIColor.redColor()
        label1.textColor            = UIColor.blackColor()
        label1.text                 = "view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)view1.bottom.equalTo(view.bottom).offset(0)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

