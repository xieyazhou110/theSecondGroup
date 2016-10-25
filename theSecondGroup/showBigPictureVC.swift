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

    
    func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
