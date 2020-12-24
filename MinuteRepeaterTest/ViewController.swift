//
//  ViewController.swift
//  MinuteRepeaterTest
//
//  Created by Takuya Ando on 2020/12/19.
//

import UIKit
import AudioToolbox
import AVFoundation



class ViewController: UIViewController {
  
  var player:AVAudioPlayer?

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let today = Date()
    let date = DateFormatter()

    // DateFormatter を使用して書式とロケールを指定する
    date.dateFormat = DateFormatter.dateFormat(fromTemplate: "Md", options: 0, locale: Locale(identifier: "ja_JP"))

    
    if date.string(from: today) == "12/24" {
      
      let url = Bundle.main.url(forResource: "marusound", withExtension: "mp3")
      player = try AVAudioPlayer(contentsOf: url)
      // 例外処理
      do {
        try player = AVAudioPlayer(contentsOf: url)
      } catch {
        print("ファイルがありません")
      }
      player?.play()
    }
  }
  
//  func playSound() {
//    // ファイル名と形式を指定して再生する
//
//    // 例外処理
//    do {
//      try player = AVAudioPlayer(contentsOf: soundURL)
//    } catch {
//      print("ファイルがありません")
//    }
//    player?.play()
//
//  }
  
  @IBAction func actionButton(_ sender: UIButton) {
    
    let now = Date()
    let time = Calendar.current.dateComponents([.hour, .minute], from: now)
    
    // hour を12時間で丸める
    let hour = time.hour! % 12
    let quarter = time.minute! / 15
    let minute = time.minute! % 15

    // 低音ゴング
    let lowGong:SystemSoundID = 1054
    // 高音ゴング
    let highGong:SystemSoundID = 1013
    
    // 第一ゴング
    for _ in 0 ..< hour {
      print("dong")
      AudioServicesPlaySystemSound(lowGong)
      
      // 0.5秒待つ
      Thread.sleep(forTimeInterval: 0.5)
    }
    
    // 第二ゴングが鳴る場合遅延処理
    if quarter > 0 {
      Thread.sleep(forTimeInterval: 0.7)
    }
    
    // 第二ゴング
    for _ in 0 ..< quarter {
      print("ding-dong")
      AudioServicesPlaySystemSound(highGong)
      // 0.4秒待つ
      Thread.sleep(forTimeInterval: 0.4)
      AudioServicesPlaySystemSound(lowGong)
      
      // 0.5秒待つ
      Thread.sleep(forTimeInterval: 0.5)
    }
    
    // 第三ゴングが鳴る場合遅延処理
    if minute > 0 {
      Thread.sleep(forTimeInterval: 0.7)
    }
    
    // 第三ゴング
    for _ in 0 ..< minute {
      print("ding")
      AudioServicesPlaySystemSound(highGong)

      // 0.5秒待つ
      Thread.sleep(forTimeInterval: 0.5)
    }
  }
}
