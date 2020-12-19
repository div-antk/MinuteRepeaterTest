//
//  ViewController.swift
//  MinuteRepeaterTest
//
//  Created by Takuya Ando on 2020/12/19.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

//  var soundIdRing:SystemSoundID = 1016
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let soundIdRing:SystemSoundID = 1334
    AudioServicesPlaySystemSound(soundIdRing)
  }

  @IBAction func actionButton(_ sender: UIButton) {
    
    
    let now = Date()
    let time = Calendar.current.dateComponents([.hour, .minute], from: now)
    
    var hour = time.hour!

    if hour > 12 {
      hour -= 12
    }
    
    let quarter = time.minute! / 15
    let minute = time.minute! % 15
    
    var hourCount = 0
    var quarterCount = 0
    var minuteCount = 0
    
    let lowGong:SystemSoundID = 1013
    let highGong:SystemSoundID = 1005

    // 第一ゴング
    while hourCount < hour {
      print(hourCount, "dong")
      
      hourCount += 1
      
      AudioServicesPlaySystemSound(lowGong)
      
      // 0.7秒待つ
      Thread.sleep(forTimeInterval: 0.7)
    }
    
    // 第二ゴング
    while quarterCount < quarter {
      print(quarterCount, "ding-dong")
      quarterCount += 1
      
      AudioServicesPlaySystemSound(highGong)
      
      // 0.7秒待つ
      Thread.sleep(forTimeInterval: 0.5)
      
      AudioServicesPlaySystemSound(lowGong)
      
      // 0.7秒待つ
      Thread.sleep(forTimeInterval: 0.7)    }
    
    // 第三ゴング
    while minuteCount < minute {
      print(minuteCount, "ding")
      minuteCount += 1
      
      AudioServicesPlaySystemSound(highGong)
      // 0.7秒待つ
      Thread.sleep(forTimeInterval: 0.7)    }
  }
}

