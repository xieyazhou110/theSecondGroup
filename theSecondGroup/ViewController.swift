//
//  ViewController.swift
//  theSecondGroup
//
//  Created by 吴明帅 on 16/10/23.
//  Copyright © 2016年 TuHu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    let ScreenWidth = UIScreen.main.bounds.width
    let ScreenHeight = UIScreen.main.bounds.height
    fileprivate var scrollView = UIScrollView()
    fileprivate var pageControl = UIPageControl()
    fileprivate var smallImageArray = [String]()
    fileprivate var bigImageArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        smallImageArray = ["http://p1.bqimg.com/4851/1cd9adb87fe173ab.png","http://i1.piimg.com/4851/60bc2453426cb1de.png","http://i1.piimg.com/4851/e163fb922bb1095f.png","http://i1.piimg.com/4851/ac117321df20c609.png","http://p1.bqimg.com/4851/12b153801d96e921.png","http://i1.piimg.com/4851/dfa3305821c72de6.png"]
        bigImageArray = ["http://p1.bqimg.com/4851/40b42fcf1d12a0f6.png","http://i1.piimg.com/4851/ae8d058ad9dd248a.png","http://i1.piimg.com/4851/7a6d02e5bf2b8099.png","http://i1.piimg.com/4851/34bf31cb38c83d2c.png","http://p1.bqimg.com/4851/a9696a035f6774f3.png","http://i1.piimg.com/4851/9b9d8970c9c8e4a2.png"]
        let backView = UIView(frame: CGRect(x: 0,y: 20,width: ScreenWidth,height: ScreenWidth/2))
        let scrollView = self.createScrollView(frame:CGRect(x: 0,y: 20,width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.width/2), imageCount: smallImageArray.count)
        backView.addSubview(scrollView)
        backView.addSubview(self.createPageControl(backView.frame, imageCount: smallImageArray.count))
        self.showSmallImage(imageArray:smallImageArray, height: backView.frame.height)
        self.view.addSubview(backView)
    }
    
    fileprivate func createPageControl(_ frame:CGRect,imageCount:Int) -> UIPageControl{
        let pageControlWidth = CGFloat(imageCount) * 15
        pageControl.frame = CGRect(x: ScreenWidth/2 - pageControlWidth/2, y: frame.height-30,width: pageControlWidth, height: 30)
        pageControl.backgroundColor = UIColor.clear
        pageControl.numberOfPages = imageCount
        return pageControl
    }

    fileprivate func createScrollView(frame:CGRect,imageCount:Int)->UIScrollView{
        scrollView.frame = CGRect(x: 0,y: 0,width: frame.width,height: frame.height)
        scrollView.backgroundColor = UIColor.white
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.bounces = true
        scrollView.contentSize = CGSize(width: ScreenWidth*CGFloat(imageCount),height: frame.height)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }
    fileprivate func showSmallImage(imageArray:[String],height:CGFloat){
        for (i,url) in imageArray.enumerated() {
            let imageView = UIImageView(frame: CGRect(x: CGFloat(i)*ScreenWidth, y: 0, width: ScreenWidth, height: height))
            imageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage.sd_animatedGIFNamed("failure"))
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.imageClick)))
            imageView.tag = i
            scrollView.addSubview(imageView)
        }
    }
    
    
    //到此处调用展示大图的方法
    dynamic fileprivate func imageClick(tap:UITapGestureRecognizer){        
        BrowsePicturePublicMethod.showBigPictureWithUrl(smallImageUrl: [], bigImageUrl: bigImageArray,controller: self)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage  = scrollView.contentOffset.x/ScreenWidth
        pageControl.currentPage = Int(currentPage)
        
    }


    
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

