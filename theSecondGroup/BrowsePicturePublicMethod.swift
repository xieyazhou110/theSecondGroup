//
//  BrowsePicturePublicMethod.swift
//  theSecondGroup
//
//  Created by 吴明帅 on 16/10/25.
//  Copyright © 2016年 TuHu. All rights reserved.
//

import UIKit

class BrowsePicturePublicMethod: NSObject {
    
    fileprivate var modelArray = [ImageModel]()
    //传进来大小图url的数组
    class func showBigPictureWithUrl(smallImageUrl:[String],bigImageUrl:[String],rect:CGRect,index:Int,controller:UIViewController,completion: ((Int) -> Void)?){
        let tempBrowsePicturePublicMethod = BrowsePicturePublicMethod()
        //当两个数组都有值，但是数量不一致直接retrun,防止出现数组越界
        if smallImageUrl.count > 0 && bigImageUrl.count > 0 && smallImageUrl.count != bigImageUrl.count {
            return
        }
        
        //当小图的数组为空，但是大图的数组有值，直接调用不传小图的方法
        if smallImageUrl.count == 0 && bigImageUrl.count > 0{
            BrowsePicturePublicMethod.showBigPictureOnlyBigWithUrl(bigImageUrl: bigImageUrl,rect: rect,index: index, controller: controller)
            return
        }
        
        //当大小图都有且数量一致
        for url in smallImageUrl {
            let model = ImageModel()
            model.smallImageUrl = url
            
//            let image = UIImage.init(data: (NSData(contentsOf: NSURL(string: url) as! URL)as? Data)!)
//            model.smallImage = image
            tempBrowsePicturePublicMethod.modelArray.append(model)
        }
        for (idx,bigUrl) in bigImageUrl.enumerated() {
            tempBrowsePicturePublicMethod.modelArray[idx].bigImageUrl = bigUrl
        }
        tempBrowsePicturePublicMethod.showBigPicture(imageModelArray:tempBrowsePicturePublicMethod.modelArray,rect: rect,index: index,controller: controller)
        if let completion = completion {
            completion(5)
        }
    }
    //只传进来大图的url
    class func showBigPictureOnlyBigWithUrl(bigImageUrl:[String],rect:CGRect,index:Int,controller:UIViewController){
        let tempBrowsePicturePublicMethod = BrowsePicturePublicMethod()
        for url in bigImageUrl {
            let model = ImageModel()
            model.bigImageUrl = url
            tempBrowsePicturePublicMethod.modelArray.append(model)
        }
        tempBrowsePicturePublicMethod.showBigPicture(imageModelArray:tempBrowsePicturePublicMethod.modelArray,rect: rect,index: index,controller: controller)
    }
    
    //直接过来大小UIImage
    class func showBigPictureWithImage(smallImage:[UIImage],bigImage:[UIImage],rect:CGRect,index:Int,controller:UIViewController,completion: ((Int) -> Void)?) {
        let tempBrowsePicturePublicMethod = BrowsePicturePublicMethod()
        //当两个数组都有值，但是数量不一致直接retrun,防止出现数组越界
        if smallImage.count > 0 && bigImage.count > 0 && smallImage.count != bigImage.count {
            return
        }
        //当小图的数组为空，但是大图的数组有值，直接调用不传小图的方法
        if smallImage.count == 0 && bigImage.count > 0{
            BrowsePicturePublicMethod.showBigImagePictureOnlyBigImage(imageArray: bigImage,rect:rect,index: index,controller: controller)
            return
        }
        
        //当大小图都有且数量一致
        for image in smallImage {
            let model = ImageModel()
            model.smallImage = image
            tempBrowsePicturePublicMethod.modelArray.append(model)
        }
        for (idx,image) in bigImage.enumerated() {
            tempBrowsePicturePublicMethod.modelArray[idx].bigImage = image
        }
        tempBrowsePicturePublicMethod.showBigPicture(imageModelArray: tempBrowsePicturePublicMethod.modelArray,rect: rect,index: index, controller: controller)

    }
    
    
    //只传过来只有大图的数组
    class func showBigImagePictureOnlyBigImage(imageArray:[UIImage],rect:CGRect,index:Int,controller:UIViewController) {
        let tempBrowsePicturePublicMethod = BrowsePicturePublicMethod()
        for image in imageArray{
            let model = ImageModel()
            model.bigImage = image
            tempBrowsePicturePublicMethod.modelArray.append(model)
        }
        tempBrowsePicturePublicMethod.showBigPicture(imageModelArray: tempBrowsePicturePublicMethod.modelArray, rect: rect,index: index,controller: controller)
    }
    
    
    
    //
    fileprivate func showBigPicture(imageModelArray:[ImageModel],rect:CGRect,index:Int,controller:UIViewController){
        let vc = showBigPictureVC()
        controller.present(vc, animated: true, completion: nil)
        
    }

    
    

}
