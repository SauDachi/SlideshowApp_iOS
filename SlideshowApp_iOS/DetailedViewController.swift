//
//  DetailedViewController.swift
//  SlideshowApp_iOS
//
//  Created by stf02041 on 2019/06/14.
//  Copyright © 2019年 stf02041. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    @IBOutlet weak var UIImageView: UIImageView!
    
    var detailedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UIImageView.image = detailedImage
    }
}
