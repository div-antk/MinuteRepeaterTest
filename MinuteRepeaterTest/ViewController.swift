//
//  ViewController.swift
//  MinuteRepeaterTest
//
//  Created by Takuya Ando on 2020/12/19.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
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
    //    候補1008, 1054
    let highGong:SystemSoundID = 1054

    // 第一ゴング
    while hourCount < hour {
      print(hourCount + 1, "dong")
      
      hourCount += 1
      
      AudioServicesPlaySystemSound(lowGong)
      
      // 0.7秒待つ
      Thread.sleep(forTimeInterval: 0.7)
    }
    
    // 第二ゴング
    if quarter > 0 {
      while quarterCount < quarter {
        print(quarterCount + 1, "ding-dong")
        quarterCount += 1
        
        AudioServicesPlaySystemSound(highGong)
        
        // 0.7秒待つ
        Thread.sleep(forTimeInterval: 0.5)
        
        AudioServicesPlaySystemSound(lowGong)
        
        // 0.7秒待つ
        Thread.sleep(forTimeInterval: 0.7)
      }
    }
    
    // 第三ゴング
    if minute > 0 {
      while minuteCount < minute {
        print(minuteCount + 1, "ding")
        minuteCount += 1
        
        AudioServicesPlaySystemSound(highGong)
        // 0.7秒待つ
        Thread.sleep(forTimeInterval: 0.7)
      }
    }
  }
}
