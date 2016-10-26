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
    class func showBigPictureWithUrl(smallImageUrl:[String],bigImageUrl:[String],controller:UIViewController){
        let tempBrowsePicturePublicMethod = BrowsePicturePublicMethod()
        //当两个数组都有值，但是数量不一致直接retrun,防止出现数组越界
        if smallImageUrl.count > 0 && bigImageUrl.count > 0 && smallImageUrl.count != bigImageUrl.count {
            return
        }
        
        //当小图的数组为空，但是大图的数组有值，直接调用不传小图的方法
        if smallImageUrl.count == 0 && bigImageUrl.count > 0{
            BrowsePicturePublicMethod.showBigPictureOnlyBigWithUrl(bigImageUrl: bigImageUrl, controller: controller)
            return
        }
        
        //当大小图都有且数量一致
        for url in smallImageUrl {
            let model = ImageModel()
            model.smallImageUrl = url
            tempBrowsePicturePublicMethod.modelArray.append(model)
        }
        for (idx,bigUrl) in bigImageUrl.enumerated() {
            tempBrowsePicturePublicMethod.modelArray[idx].bigImageUrl = bigUrl
        }
        tempBrowsePicturePublicMethod.showBigPicture(imageModelArray:tempBrowsePicturePublicMethod.modelArray,controller: controller)
    }
    //只传进来大图的url
    class func showBigPictureOnlyBigWithUrl(bigImageUrl:[String],controller:UIViewController){
        let tempBrowsePicturePublicMethod = BrowsePicturePublicMethod()
        for url in bigImageUrl {
            let model = ImageModel()
            model.bigImageUrl = url
            tempBrowsePicturePublicMethod.modelArray.append(model)
        }
        tempBrowsePicturePublicMethod.showBigPicture(imageModelArray:tempBrowsePicturePublicMethod.modelArray,controller: controller)
    }
    
    
    //
    fileprivate func showBigPicture(imageModelArray:[ImageModel],controller:UIViewController){
        
        let vc = showBigPictureVC()
        controller.present(vc, animated: true, completion: nil)
        
    }

    
    

}
