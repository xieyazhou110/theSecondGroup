//
//  loopScrollView.swift
//  theSecondGroup
//
//  Created by 吴明帅 on 16/10/23.
//  Copyright © 2016年 TuHu. All rights reserved.
//

import UIKit

class loopScrollView: UIView,UIScrollViewDelegate {
    let ScreenWidth = UIScreen.mainScreen().bounds.width
    let ScreenHeight = UIScreen.mainScreen().bounds.height
    private var scrollView = UIScrollView()
    private var pageControl = UIPageControl()
    private var collectionView = UICollectionView()
    private var keyWindow = UIWindow()
    class func loopScrollViewWith(frame:CGRect,smallImageUrl:[String],bigImageUrl:[String]) -> UIView{
        let tempLoopScrollView = loopScrollView()
        tempLoopScrollView.frame = frame
        if let window = UIApplication.sharedApplication().keyWindow{
            tempLoopScrollView.keyWindow = window
        }
        
        tempLoopScrollView.addSubview(tempLoopScrollView.createScrollView(frame,imageCount: smallImageUrl.count))
        tempLoopScrollView.showSmallImage(smallImageUrl, height: frame.height)
        tempLoopScrollView.addSubview(tempLoopScrollView.createPageControl(frame,imageCount: smallImageUrl.count))
        return tempLoopScrollView
    }
    
    private func createScrollView(frame:CGRect,imageCount:Int)->UIScrollView{
        scrollView.frame = CGRectMake(0,0,frame.width,frame.height)
        scrollView.backgroundColor = UIColor.whiteColor()
        scrollView.delegate = self
        scrollView.pagingEnabled = true
        scrollView.bounces = true
        scrollView.contentSize = CGSizeMake(ScreenWidth*CGFloat(imageCount),frame.height)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }
    private func showSmallImage(imageArray:[String],height:CGFloat){
        for (i,url) in imageArray.enumerate() {
            let imageView = UIImageView(frame: CGRectMake(CGFloat(i)*ScreenWidth, 0, ScreenWidth, height))
            imageView.sd_setImageWithURL(NSURL(string: url), placeholderImage: UIImage.sd_animatedGIFNamed("failure"))
            imageView.userInteractionEnabled = true
            imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(loopScrollView.imageClick)))
            imageView.tag = i
            scrollView.addSubview(imageView)
        }
    }
    
    private func createPageControl(frame:CGRect,imageCount:Int) -> UIPageControl{
        let pageControlWidth = CGFloat(imageCount) * 15
        pageControl.frame = CGRectMake(ScreenWidth/2 - pageControlWidth/2, frame.height-30,pageControlWidth, 30)
        pageControl.backgroundColor = UIColor.clearColor()
        pageControl.numberOfPages = imageCount
        return pageControl
    }
    
    private func createCollectionView(){
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let currentPage  = scrollView.contentOffset.x/ScreenWidth
        pageControl.currentPage = Int(currentPage)
        
    }
    
    dynamic private func imageClick(tap:UITapGestureRecognizer){
//        keyWindow.hidden = false
    }
    
}
