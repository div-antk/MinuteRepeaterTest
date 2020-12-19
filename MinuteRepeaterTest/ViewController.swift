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
    
    let now = Date()
    let time = Calendar.current.dateComponents([.hour, .minute], from: now)

    let hour = time.hour!
    let quarter = time.minute! / 15
    let minute = time.minute! % 15

    print(hour)
    print(quarter)
    print(minute)
  }


}

