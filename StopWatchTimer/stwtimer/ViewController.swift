//
//  ViewController.swift
//  stwtimer
//
//  Created by 崎原邦達 on 2020/11/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    //特定の時間感覚が経過した後に起動し、指定したメッセージをターゲットのオブジェクトに送信するタイマー
    var timer: Timer!
    //Timer用　時間カウントする周期：1秒
    let oneSecond: TimeInterval = 1
    //分
    var minute = 0
    //秒
    var second = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //スタートボタンを押された時の動作
    @IBAction func onClickStartButton(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: oneSecond, target: self, selector: #selector(runTime), userInfo: nil, repeats: true)
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        resetButton.isEnabled = true
        
    }
    
    
    //一時停止ボタンの動作
    @IBAction func onClickPauseButton(_ sender: Any) {
        
        timer.invalidate() //時間の停止
      
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        resetButton.isEnabled = true
        
        
    }
    //リセットボタンの動作
    @IBAction func onClickResetButton(_ sender: Any) {
        timer.invalidate()
        minute = 0 //分
        second = 0 //秒
        timeLable.text = "00:00"
        
        
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        resetButton.isEnabled = false
    }
    //
    @objc func runTime() {
        //1秒加算
        second += 1
        //60秒経ったら1分加算して秒を１からスタートさせる
        if second == 60 {
            minute += 1
            second = 0
        }
        //ストップウォッチに入れるテキストを用意
        var tmpM = ""
        var tmpS = ""
        //秒
        if second < 10 {
            tmpS = "0\(second)"
        }else if second >= 10 {
            tmpS = "\(second)"
        }
        //分
        if minute < 10 {
            tmpM = "0\(minute)"
        }else if minute >= 10 {
            tmpM = "\(minute)"
        }
        timeLable.text = "\(tmpM):\(tmpS)"
    }
}

