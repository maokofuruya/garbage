//
//  gameViewController.swift
//  garbage
//
//  Created by Maoko Furuya on 2018/01/26.
//  Copyright © 2018年 Maoko Furuya. All rights reserved.
//

import UIKit

class gameViewController: UIViewController {
    
    var timer : Timer = Timer()
    var point : Int = 0
    
    
    @IBOutlet var pointLabel : UILabel!
    @IBOutlet var timeLabel : UILabel!
    
    var timeCount : Float = 6.0
    
    var snowTimer: Timer = Timer()
    
    
    
    @IBAction func start() {
        
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            
            self.timeCount = self.timeCount - 0.05
            self.timeLabel.text = String(format: "%.2f",self.timeCount)
            if self.timeCount < 0 {
                self.performSegue(withIdentifier: "toResult", sender: nil)
                self.timer.invalidate()
            }
            
        }
        
        snowTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            
            
            self.createSnow()
        }
    }
    
    
    func pluspoint() {
        point = point + 1
        pointLabel.text = String(point)
    }
    
    
    func createSnow() {
        
        let snowImageView: UIImageView = UIImageView(frame: CGRect(x: CGFloat(arc4random_uniform(UInt32(UIScreen.main.bounds.width))), y: 0, width: 50, height: 50))
        snowImageView.image = UIImage(named: "snow.png")
        self.view.addSubview(snowImageView)
        
        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { fallTimer in
            
            snowImageView.frame.origin.y += 2
            
            
            
            if self.yukidarumaImageView.frame.contains(snowImageView.frame) {
                print("当たった")
                snowImageView.removeFromSuperview()
                fallTimer.invalidate()
                
                self.pluspoint()
            }
            
            
            
            
            if snowImageView.frame.origin.y > UIScreen.main.bounds.height {
                snowImageView.removeFromSuperview()
                fallTimer.invalidate()
                
                
                
            }
        }
    }
    
    @IBOutlet var yukidarumaImageView: UIImageView!
    
    @IBAction func moveLeft() {
        yukidarumaImageView.frame.origin.x -= 20
        
    }
    
    @IBAction func moveRight() {
        
        yukidarumaImageView.frame.origin.x += 20
    }
    
    @IBAction func moveLeft2() {
        yukidarumaImageView.frame.origin.x -= 50
        
    }
    
    @IBAction func moveRight2() {
        yukidarumaImageView.frame.origin.x += 50
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let resultViewController = segue.destination as! ResultViewController
        
        
        resultViewController.snowPoint = self.point
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



