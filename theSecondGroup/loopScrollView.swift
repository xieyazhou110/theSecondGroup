//
//  loopScrollView.swift
//  theSecondGroup
//
//  Created by 吴明帅 on 16/10/23.
//  Copyright © 2016年 TuHu. All rights reserved.
//

import UIKit

class loopScrollView: UIView,UIScrollViewDelegate {
    let ScreenWidth = UIScreen.main.bounds.width
    let ScreenHeight = UIScreen.main.bounds.height
    fileprivate var scrollView = UIScrollView()
    fileprivate var pageControl = UIPageControl()
    //private var collectionView = UICollectionView()
    fileprivate var keyWindow = UIWindow()
    class func loopScrollViewWith(_ frame:CGRect,smallImageUrl:[String],bigImageUrl:[String]) -> UIView{
        let tempLoopScrollView = loopScrollView()
        tempLoopScrollView.frame = frame
        if let window = UIApplication.shared.keyWindow{
            tempLoopScrollView.keyWindow = window
        }
        
        tempLoopScrollView.addSubview(tempLoopScrollView.createScrollView(frame,imageCount: smallImageUrl.count))
        tempLoopScrollView.showSmallImage(smallImageUrl, height: frame.height)
        tempLoopScrollView.addSubview(tempLoopScrollView.createPageControl(frame,imageCount: smallImageUrl.count))
        return tempLoopScrollView
    }
    
    fileprivate func createScrollView(_ frame:CGRect,imageCount:Int)->UIScrollView{
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
    fileprivate func showSmallImage(_ imageArray:[String],height:CGFloat){
        for (i,url) in imageArray.enumerated() {
            let imageView = UIImageView(frame: CGRect(x: CGFloat(i)*ScreenWidth, y: 0, width: ScreenWidth, height: height))
            imageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage.sd_animatedGIFNamed("failure"))
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(loopScrollView.imageClick)))
            imageView.tag = i
            scrollView.addSubview(imageView)
        }
    }
    
    fileprivate func createPageControl(_ frame:CGRect,imageCount:Int) -> UIPageControl{
        let pageControlWidth = CGFloat(imageCount) * 15
        pageControl.frame = CGRect(x: ScreenWidth/2 - pageControlWidth/2, y: frame.height-30,width: pageControlWidth, height: 30)
        pageControl.backgroundColor = UIColor.clear
        pageControl.numberOfPages = imageCount
        return pageControl
    }
    
    fileprivate func createCollectionView(){
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage  = scrollView.contentOffset.x/ScreenWidth
        pageControl.currentPage = Int(currentPage)
        
    }
    
    dynamic fileprivate func imageClick(_ tap:UITapGestureRecognizer){
//        keyWindow.hidden = false
    }
    
}
