//
//  SubViewController.swift
//  garbage
//
//  Created by Maoko Furuya on 2017/12/15.
//  Copyright © 2017年 Maoko Furuya. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {
    
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    
    var selectedImg: UIImage!
    var gomiName: String!
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        imageView.image = selectedImg
        // 画像のアスペクト比を維持しUIImageViewサイズに収まるように表示
        imageView.contentMode = UIViewContentMode.scaleAspectFit
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
      if gomiName == "可燃ごみ"{
            label1.text = "可燃ごみ"
            label2.text = "紙類・生ごみ・革製品・\n木類・布類・カード類・\n貝殻・ゴム・花火"
            imageView.image = UIImage(named:"kami.png")
        }
        
        if gomiName == "不燃ごみ"{
            label1.text = "不燃ごみ"
            label2.text = "金属類・ガラス類・刃物類・\n陶器類・アルミホイル・傘・\n電球・❇︎スプレー缶 ガスボンベ\n❇︎は他の不燃ごみとは違う袋で出す"
            imageView.image = UIImage(named:"604129.png")
            
        }
        if gomiName == "資源ごみ"{
            label1.text = "資源ごみ"
            label2.text = "包装紙・ダンボール・アルミ缶・\n折込チラシ"
            imageView.image = UIImage(named:"danbo.png")
        }
        if gomiName == "ボトル類"{
            label1.text = "ペットボトル"
            label2.text = "キャップ・ラベルを外し潰して出す"
            imageView.image = UIImage(named:"petbottle.png")
        }
        if gomiName == "粗大ごみ"{
            label1.text = "粗大ごみ"
            label2.text = "一辺が30センチを超えるごみ\n"
            imageView.image = UIImage(named:"sodai.png")
        }
        
        
       //  SubViewController.text1 = textField1.text

        // Do any additional setup after loading the view.
    }

   
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
