//
//  ViewController.swift
//  SlideshowApp_iOS
//
//  Created by stf02041 on 2019/06/14.
//  Copyright © 2019年 stf02041. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slideImage: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var slideButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    //前画面へ戻る
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }
    
    //画像のindex番号
    var imageIndex = 0
    //タイマー
    var timer: Timer!
    //タイマー用の時間のための変数
    var timer_sec: Float = 0
    //再生/停止ボタンをタップした回数
    var tapCount:Int = 0
    //画像を配列に格納
    let images = [UIImage(named: "image1"), UIImage(named: "image2"), UIImage(named: "image3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let showImage = images[0]
        //imageViewに初期画像を設定
        slideImage.image = showImage
    }
    
    //進むボタン
    @IBAction func nextImage(_ sender: Any) {
        //画像番号が0だった場合
        if imageIndex == 0 {
            //最後の画像を表示する
            imageIndex = images.count - 1
        }
            //そうでないなら画像番号をデクリメント
        else {
            imageIndex -= 1
        }
        //画像表示
        slideImage.image = images[imageIndex]
    }
    
    //戻るボタン
    @IBAction func backImage(_ sender: Any) {
        //画像番号が最後だった場合
        if imageIndex == images.count - 1 {
            //配列の0番目の画像を表示する
            imageIndex = 0
        }
            //そうでないなら画像番号をインクリメント
        else {
            imageIndex += 1
        }
        //画像表示
        slideImage.image = images[imageIndex]
    }
    
    //スライドボタン
    @IBAction func slideImage(_ sender: Any) {
        if self.timer == nil {
            //再生ボタンを押すとタイマー作成、始動
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector (onTimer(_:)), userInfo: nil, repeats: true)
            
            //ボタンのテキスト変更
            slideButton.setTitle("停止", for: .normal)
            
            //他２つのボタンを無効化
            self.backButton.isEnabled = false
            self.nextButton.isEnabled = false
        }
        else {
            stop()
        }
    }
    
    //スライド中の画像表示
    @objc func onTimer(_ timer: Timer){
        //画像番号が最後だった場合
        if imageIndex == images.count - 1 {
            //配列の0番目の画像を表示する
            imageIndex = 0
        }
            //そうでないなら画像番号をインクリメント
        else {
            imageIndex += 1
        }
        //画像表示
        slideImage.image = images[imageIndex]
    }
    
    //画像渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //遷移先取得
        let detailedViewController:DetailedViewController = segue.destination as! DetailedViewController
        //遷移先の変数へsenderの内容渡す
        detailedViewController.detailedImage = sender as? UIImage
    }
    
    //segue
    @IBAction func onTapImage(_ sender: Any) {
        performSegue(withIdentifier: "showImage", sender: images[imageIndex])
        
        //タイマー動いてたら止める
        if timer != nil{
            stop()
        }
    }
    
    //スライド停止
    func stop(){
        // タイマーを停止する
        self.timer.invalidate()
        self.timer = nil
        
        //ボタンのテキスト変更
        slideButton.setTitle("再生", for: .normal)
        
        //他２つのボタンを有効化
        self.backButton.isEnabled = true
        self.nextButton.isEnabled = true
    }
}

