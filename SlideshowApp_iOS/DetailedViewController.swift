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
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    var detailedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UIImageView.image = detailedImage
    }
    
    //前の状態を保持したまま戻る
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
