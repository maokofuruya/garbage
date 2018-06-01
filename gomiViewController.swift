//
//  GomiViewController.swift
//  garbage
//
//  Created by Maoko Furuya on 2017/12/01.
//  Copyright © 2017年 Maoko Furuya. All rights reserved.
//

import UIKit
import AVFoundation

class GomiViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var table: UITableView!
    
   
    
    var gomiNameArray = [String]()
    var imageNameArray = [String]()
    var selectedText: String?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        
        gomiNameArray = ["可燃ごみ", "不燃ごみ", "資源ごみ", "粗大ごみ", "ボトル類"]
        imageNameArray = ["moeru.png", "moenai.png", "shigen.png", "sodai2.png", "bottle.png"]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   //セルの数
    func tableView(_ tableView: UITableView,  numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = gomiNameArray[indexPath.row]
        cell?.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        
        return cell!
        
    }
    
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toSubViewController") {
            
            let subVC: SubViewController = (segue.destination as? SubViewController)!
            subVC.gomiName = selectedText
        }
        

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedText = gomiNameArray[indexPath.row]
        
        if selectedText != nil {
            
            performSegue(withIdentifier: "toSubViewController", sender: nil)
            
            
        }

    }
}
  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   // override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
   // }
   


