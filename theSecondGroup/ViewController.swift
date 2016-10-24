//
//  ViewController.swift
//  theSecondGroup
//
//  Created by 吴明帅 on 16/10/23.
//  Copyright © 2016年 TuHu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let smallImageArray = ["http://p1.bqimg.com/4851/1cd9adb87fe173ab.png","http://i1.piimg.com/4851/60bc2453426cb1de.png","http://i1.piimg.com/4851/e163fb922bb1095f.png","http://i1.piimg.com/4851/ac117321df20c609.png","http://p1.bqimg.com/4851/12b153801d96e921.png","http://i1.piimg.com/4851/dfa3305821c72de6.png"]
        let bigImageArray = ["http://p1.bqimg.com/4851/40b42fcf1d12a0f6.png","http://i1.piimg.com/4851/ae8d058ad9dd248a.png","http://i1.piimg.com/4851/7a6d02e5bf2b8099.png","http://i1.piimg.com/4851/34bf31cb38c83d2c.png","http://p1.bqimg.com/4851/a9696a035f6774f3.png","http://i1.piimg.com/4851/9b9d8970c9c8e4a2.png"]
        let temp = loopScrollView.loopScrollViewWith(CGRectMake(0,20,UIScreen.mainScreen().bounds.width,UIScreen.mainScreen().bounds.width/2), smallImageUrl: smallImageArray, bigImageUrl: bigImageArray)
        self.view.addSubview(temp)
    }
    
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

