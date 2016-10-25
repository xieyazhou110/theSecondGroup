//
//  showBigPictureVC.swift
//  theSecondGroup
//
//  Created by 吴明帅 on 16/10/25.
//  Copyright © 2016年 TuHu. All rights reserved.
//

import UIKit

class showBigPictureVC: UIViewController {
    fileprivate let ScreenWidth = UIScreen.main.bounds.width
    fileprivate let ScreenHeight = UIScreen.main.bounds.height

    fileprivate var modelArray = [ImageModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let closeButton = UIButton(frame: CGRect(x: ScreenWidth-40,y: 20,width: 40,height: 20))
        closeButton.backgroundColor = UIColor.red
        closeButton.setTitle("关闭", for: UIControlState())
        closeButton.addTarget(self, action: #selector(showBigPictureVC.close), for: .touchUpInside)
        self.view.addSubview(closeButton)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    class func showBigPictureWithUrl(_ smallImageUrl:[String],bigImageUrl:[String]){
        let tempshowBigPictureVC = showBigPictureVC()
        guard smallImageUrl.count == bigImageUrl.count else {
            return
        }
        for url in smallImageUrl {
            let model = ImageModel()
            model.smallImageUrl = url
            tempshowBigPictureVC.modelArray.append(model)
        }
        for (idx,bigUrl) in bigImageUrl.enumerated() {
            tempshowBigPictureVC.modelArray[idx].bigImageUrl = bigUrl
        }
        tempshowBigPictureVC.showBigPicture(tempshowBigPictureVC.modelArray)
    }
    
    class func showBigPictureOnlyBigWithUrl(_ bigImageUrl:[String]){
        let tempshowBigPictureVC = showBigPictureVC()
        for url in bigImageUrl {
            let model = ImageModel()
            model.bigImageUrl = url
            tempshowBigPictureVC.modelArray.append(model)
        }
        tempshowBigPictureVC.showBigPicture(tempshowBigPictureVC.modelArray)
    }

//    class func showBigPictureWithUIImage(){
//        
//    }
    
    fileprivate func showBigPicture(_ imageModelArray:[ImageModel]){
        
    }
   
    
    func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
