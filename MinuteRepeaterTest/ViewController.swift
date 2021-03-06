//
//  ViewController.swift
//  MinuteRepeaterTest
//
//  Created by Takuya Ando on 2020/12/19.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
  
  private var isPlaying = false
  
//  var : UIView!
  var animator: UIViewPropertyAnimator!
  
  @IBOutlet weak var button: UIButton!
  @IBOutlet weak var blueView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // アニメーションの設定
    // タイミングカーブを.linearに設定
    let timing = UICubicTimingParameters(animationCurve: .linear)

    // アニメーションの時間を2秒、タイミングパラメータに上で定義したtimingをセット
    animator = UIViewPropertyAnimator(duration: 0.5, timingParameters: timing)
    // アニメーションを追加
    animator.addAnimations {
        self.blueView.center.y += 100
    }
  }
  
  @IBAction func actionButton(_ sender: UIButton) {
    if isPlaying { return }
    isPlaying = true
    
    animator.startAnimation()
    repeater()
  }
  
  
  func repeater() {
    
    DispatchQueue.global().async {
      
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
      
      self.isPlaying = false
    }
  }
}
