//
//  ViewController.swift
//  Udemy_sec5
//
//  Created by Training on 2020/11/07.
//  Copyright © 2020 training. All rights reserved.
//

import UIKit
//
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
        
        //
        for X in 0..<5 {
            print(X)
            let image = UIImage(named: "\(X)")
            imageArray.append(image!)
            
        }
        
        imageView.image = UIImage(named: "0")
    }
    
    func startTimer(){
        //タイマーを回す　０.２秒毎にTimerUpdateメソッド呼ぶ
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
    //0.2秒毎に呼ばれる
    @objc func timerUpdate() {
        count = count + 1
        //６枚目がない以上countで５が出ないよう、４で抑えられるようにする
        if count > 4 {
            count = 0
        }
        imageView.image = imageArray[count]
        
        //imageArray[]
        
    }
    
    @IBAction func start(_ sender: Any) {
        
        //imageViewのimageに画像反映
        startTimer()
        //start押すと押せなくなる,stopが押せる
        startButton.isEnabled = false
        stopButton.isEnabled = true
    }
    
    @IBAction func stop(_ sender: Any) {
        
        //imageに反映されている画像の流れをストップする
        
        //startボタンが押せるようになる、stopが押せない
        startButton.isEnabled = true
        stopButton.isEnabled = false
        //タイマーストップ
        timer.invalidate()
    }
}

