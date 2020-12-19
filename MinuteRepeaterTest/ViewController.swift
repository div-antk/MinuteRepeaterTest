//
//  ViewController.swift
//  MinuteRepeaterTest
//
//  Created by Takuya Ando on 2020/12/19.
//

import UIKit

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
    
    // 第一ゴング
    while hourCount < hour {
      print(hourCount, "ding")
      hourCount += 1
    }
    
    // 第二ゴング
    while quarterCount < quarter {
      print(quarterCount, "ding-dong")
      quarterCount += 1
    }
    
    // 第二ゴング
    while minuteCount < minute {
      print(minuteCount, "dong")
      minuteCount += 1
    }
  }
}

