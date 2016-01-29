//
//  AppDelegate.swift
//  For100
//
//  Created by 董兴斌 on 16/1/9.
//  Copyright © 2016年 董兴斌. All rights reserved.
//

import Foundation
import UIKit

var allLevels = [1, 0, 0, 0, 0, 0]

func writeAllLevels() {
    let ud = NSUserDefaults.standardUserDefaults()
    for i in 0..<6 {
        ud.setInteger(allLevels[i], forKey:"Level\(i+1)")
    }
}

func readAllLevels() {
    let ud = NSUserDefaults.standardUserDefaults()
    for i in 0..<6 {
        allLevels[i] = ud.integerForKey("Level\(i+1)")
    }
}

class ChooseViewController: UIViewController {
    @IBOutlet var button1 : UIButton!
    
    @IBOutlet var button2 : UIButton!
    
    @IBOutlet var button3 : UIButton!
    
    @IBOutlet var button4 : UIButton!
    
    @IBOutlet var button5 : UIButton!
    
    @IBOutlet var button6 : UIButton!
    
    var allButtons = [UIButton]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        allButtons.append(button1);
        allButtons.append(button2);
        allButtons.append(button3);
        allButtons.append(button4);
        allButtons.append(button5);
        allButtons.append(button6);
        readAllLevels()
        allLevels[0] = 1;
        let str = NSTemporaryDirectory()
        print(str)
    }
    
    @IBAction func turnAnswerVC(sender : AnyObject) {
        let btn = sender as! UIButton
        let tag = btn.tag
        if allLevels[tag-1] == 1 {
            let vc = AnswerViewController()
            vc.currentLevel = tag;
            self.presentViewController(vc, animated: true, completion: nil)
        }
        else {
            let alert = UIAlertController(title: "提示", message: "亲，你上一关还没过呢！", preferredStyle: .Alert)
            let actionYes = UIAlertAction(title: "YES", style: .Default, handler: nil)
            alert.addAction(actionYes)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    //blog.sina.com.cn/jamszhy
    //weibo.com/jamszhy
    
    override func viewWillAppear(animated: Bool) {
        for i in 0..<6 {
            if allLevels[i] == 1 {
                allButtons[i].setImage(UIImage(named:"suo_kai.png"), forState:.Normal)
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
