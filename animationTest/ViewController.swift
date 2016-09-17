//
//  ViewController.swift
//  animationTest
//
//  Created by 太田麻莉子 on 2016/09/17.
//  Copyright © 2016年 太田麻莉子. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var redButton: UIButton!
    
    @IBOutlet weak var blueButton: UIButton!
    
    @IBOutlet weak var greenButton: UIButton!
    
    @IBOutlet weak var yellowButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // テンプレートとしてbackgroundImageViewを描画する
        backgroundImageView.image = backgroundImageView.image?.imageWithRenderingMode(.AlwaysTemplate)
        // 初期表示は背景の色が緑
        backgroundImageView.tintColor = ConstColor().green()
        
        // 色ボタンを配列に入れる
        let buttons = [redButton, blueButton, greenButton, yellowButton]
        
        for button in buttons {
            // アクションの設定
            button.addTarget(self, action: #selector(ViewController.tapButton(_:)), forControlEvents: .TouchUpInside)
        }
    }
    
    // 色ボタンがタップされると呼び出される
    func tapButton(sender: UIButton) {
        if let button = sender as? UIButton{
            // 各色ボタンが押された時の指定
            if(button == redButton){
               backgroundImageView.tintColor = ConstColor().red()
            }
            else if(button == blueButton){
                backgroundImageView.tintColor = ConstColor().blue()
            }
            else if(button == greenButton){
                backgroundImageView.tintColor = ConstColor().green()
            }
            else{
                backgroundImageView.tintColor = ConstColor().yellow()
            }
        }
    }
    
    class ConstColor{
        func red() -> UIColor {
            return UIColor.rgb(219, g: 94, b: 67, alpha: 1.0)
        }
        func green() -> UIColor {
            return UIColor.rgb(88, g: 178, b: 150, alpha: 1.0)
        }
        func blue() -> UIColor {
            return UIColor.rgb(82, g: 146, b: 207, alpha: 1.0)
        }
        func yellow() -> UIColor {
            return UIColor.rgb(234, g: 206, b: 75, alpha: 1.0)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// RGBカラーを3桁で扱えるようにする
extension UIColor {
    class func rgb(r: Int, g: Int, b: Int, alpha: CGFloat) -> UIColor{
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
}
