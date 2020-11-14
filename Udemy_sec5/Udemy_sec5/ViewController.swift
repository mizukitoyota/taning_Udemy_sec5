//
//  ViewController.swift
//  Udemy_sec5
//
//  Created by Training on 2020/11/07.
//  Copyright © 2020 training. All rights reserved.
//

import UIKit
//継承 , weak、弱参照（相互参照解決）
class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    //var timer:Timer
    var timer = Timer()
    var count = Int()
    var imageArray = [UIImage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        count = 0
        //stopボタンを押せないようにする、プロパティ
        stopButton.isEnabled = false
        
        //   \
        for X in 0..<5 {
            print(X)
            let image = UIImage(named: "\(X)")
            imageArray.append(image!)
            
        }
        
        imageView.image = UIImage(named: "0")
    }
    
    func startTimer(){
        //タイマーを回す　０.２秒毎にTimerUpdateメソッド呼ぶ,Timer省略可能,scheduledTimer
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
    //0.2秒毎に呼ばれる、@objc （）
    @objc func timerUpdate() {
        count = count + 1
        //６枚目がない以上countで５が出ないよう、４で抑えられるようにする
        if count > 4 {
            count = 0
        }
        imageView.image = imageArray[count]
        
        //imageArray[]
        
    }
    //sender(送信者、押されたボタンの判別),@IBAction（UI部品をメソッドとして接続する。ここを押すことで可能な動作をここに）
    @IBAction func start(_ sender: Any) {
        
        //imageViewのimageに画像反映
        startTimer()
        //start押すと押せなくなる,stopが押せる
        startButton.isEnabled = false
        stopButton.isEnabled = true
    }
    
    @IBAction func stop(_ sender: Any) {
        
        //imageに反映されている画像の流れをストップする
        
        //startボタンが押せるようになる、stopが押せない、isEnabled（有効である）
        startButton.isEnabled = true
        stopButton.isEnabled = false
        //タイマーストップ,invalidate（無効にする、）(タイマー破棄、停止)
        timer.invalidate()
    }
}

