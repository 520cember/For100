//
//  AppDelegate.swift
//  For100
//
//  Created by 董兴斌 on 16/1/9.
//  Copyright © 2016年 董兴斌. All rights reserved.
//

import Foundation
import UIKit

class AnswerViewController: UIViewController {
    
    var currentLevel = 0
    var currentQuestion = 0;
//    let allQuestions = [
//        ["什么鱼不能吃？", "A 鳄鱼", "B 鲨鱼", "C 木鱼", "D 飞鱼"],
//        ["什么东西越洗越脏？", "A 抹布", "B 衣服", "C 白菜", "D 大狗"],
//        ["鸟不会得什么病？", "A 痔疮", "B 恐高症", "C 感冒", "D 发烧"],
//        ["你孤单时会想谁？", "A 汽水", "B 老师", "C 小伙伴", "D 宠物"]]
    
    var allQuesAns = [[String]]()
    
    var first = 0
    var second = 0
    var third = 0
    var a=0
    var b=0
    var c=0
    var d=0
    var rightAnswer = [Int]()
    
    func randomInRange(range: Range<Int>) -> Int {
        let count = UInt32(range.endIndex - range.startIndex)
        return  Int(arc4random_uniform(count)) + range.startIndex
    }
    
    //随机数生成器函数
    func createRandomMan(start: Int, end: Int) ->() ->Int! {
        //根据参数初始化可选值数组
        var nums = [Int]();
        for i in start...end{
            nums.append(i)
        }
        
        func randomMan() -> Int! {
            if !nums.isEmpty {
                //随机返回一个数，同时从数组里删除
                let index = Int(arc4random_uniform(UInt32(nums.count)))
                return nums.removeAtIndex(index)
            }else {
                //所有值都随机完则返回nil
                return nil
            }
        }
        
        return randomMan
    }
    
    func randomResult(range1: Range<Int>) -> Int {
         return randomInRange(range1)
        }
    
//    func Ques() -> String
//    {
//        print("=====\(first)")
//        print("=====\(second)")
//        print("=====\(third)")
//        print("\(first) + \(second) = ?")
//        return "\(first) + \(second) = ?"
//    }
    
    func oneQueAdd(m: Int,n: Int) -> [String]
    {
        var oneQuesAns = [String]()
        first = randomResult(m...n)
        second = randomResult(m...n)
        third = first + second
        
        print("=====\(first)")
        print("=====\(second)")
        print("=====\(third)")
        print("\(first) + \(second) = ?")
        
        let random1 = createRandomMan(third - 1,end: third + 2)
        
        a = random1()
        b = random1()
        c = random1()
        d = random1()
        
        if(a == third)
        {
            rightAnswer.append(1)
        }
        else if(b == third)
        {
            rightAnswer.append(2)
        }else if(c == third)
        {
            rightAnswer.append(3)
        }else
        {
            rightAnswer.append(4)
        }
        
        print("====\(rightAnswer)")
        
        oneQuesAns.append("\(first) + \(second) = ?")
        oneQuesAns.append("A \(a)")
        oneQuesAns.append("B \(b)")
        oneQuesAns.append("C \(c)")
        oneQuesAns.append("D \(d)")
        return oneQuesAns
    }
    
    func oneQueMinus(m: Int,n: Int) -> [String]
    {
        var oneQuesAns = [String]()
        first = randomResult(m...n)
        second = randomResult(m...n)
        if(first > second)
        {
            third = first - second
            oneQuesAns.append("\(first) - \(second) = ?")
        }
        else
        {
            third = second - first
            oneQuesAns.append("\(second) - \(first) = ?")
        }
        
        print("=====\(first)")
        print("=====\(second)")
        print("=====\(third)")
        
        let random1 = createRandomMan(third - 1,end: third + 2)
        
        a = random1()
        b = random1()
        c = random1()
        d = random1()
        
        if(a == third)
        {
            rightAnswer.append(1)
        }
        else if(b == third)
        {
            rightAnswer.append(2)
        }else if(c == third)
        {
            rightAnswer.append(3)
        }else
        {
            rightAnswer.append(4)
        }
        
        print("====\(rightAnswer)")
        
        oneQuesAns.append("A \(a)")
        oneQuesAns.append("B \(b)")
        oneQuesAns.append("C \(c)")
        oneQuesAns.append("D \(d)")
        return oneQuesAns
    }
    
    func oneQueTimes(m: Int,n: Int) -> [String]
    {
        var oneQuesAns = [String]()
        first = randomResult(m...n)
        second = randomResult(m...n)
        third = first * second
        
        print("=====\(first)")
        print("=====\(second)")
        print("=====\(third)")
        
        let random1 = createRandomMan(third - 1,end: third + 2)
        
        a = random1()
        b = random1()
        c = random1()
        d = random1()
        
        if(a == third)
        {
            rightAnswer.append(1)
        }
        else if(b == third)
        {
            rightAnswer.append(2)
        }else if(c == third)
        {
            rightAnswer.append(3)
        }else
        {
            rightAnswer.append(4)
        }
        
        print("====\(rightAnswer)")
        oneQuesAns.append("\(first) X \(second) = ?")
        oneQuesAns.append("A \(a)")
        oneQuesAns.append("B \(b)")
        oneQuesAns.append("C \(c)")
        oneQuesAns.append("D \(d)")
        return oneQuesAns
    }
    
    func oneQueAddFirst(m: Int,n: Int) -> [String]
    {
        var oneQuesAns = [String]()
        first = randomResult(m...n)
        second = randomResult(m...n)
        third = first + second
        
        print("=====\(first)")
        print("=====\(second)")
        print("=====\(third)")
        
        let random1 = createRandomMan(first - 1,end: first + 2)
        
        a = random1()
        b = random1()
        c = random1()
        d = random1()
        
        if(a == first)
        {
            rightAnswer.append(1)
        }
        else if(b == first)
        {
            rightAnswer.append(2)
        }else if(c == first)
        {
            rightAnswer.append(3)
        }else
        {
            rightAnswer.append(4)
        }
        
        print("====\(rightAnswer)")
        
        oneQuesAns.append("? + \(second) = \(third)")
        
        oneQuesAns.append("A \(a)")
        oneQuesAns.append("B \(b)")
        oneQuesAns.append("C \(c)")
        oneQuesAns.append("D \(d)")
        return oneQuesAns
    }

    
    func oneQueAddSecond(m: Int,n: Int) -> [String]
    {
        var oneQuesAns = [String]()
        first = randomResult(m...n)
        second = randomResult(m...n)
        third = first + second
        
        print("=====\(first)")
        print("=====\(second)")
        print("=====\(third)")
        
        let random1 = createRandomMan(second - 1,end: second + 2)
        
        a = random1()
        b = random1()
        c = random1()
        d = random1()
        
        if(a == second)
        {
            rightAnswer.append(1)
        }
        else if(b == second)
        {
            rightAnswer.append(2)
        }else if(c == second)
        {
            rightAnswer.append(3)
        }else
        {
            rightAnswer.append(4)
        }
        
        print("====\(rightAnswer)")
        
        oneQuesAns.append("\(first) + ? = \(third)")
        
        oneQuesAns.append("A \(a)")
        oneQuesAns.append("B \(b)")
        oneQuesAns.append("C \(c)")
        oneQuesAns.append("D \(d)")
        return oneQuesAns
    }
    
    func oneQueMinusFirst(m: Int,n: Int) -> [String]
    {
        var oneQuesAns = [String]()
        first = randomResult(m...n)
        second = randomResult(m...n)
        if(first > second)
        {
            third = first - second
            oneQuesAns.append("? - \(second) = \(third)")
        }
        else
        {
            third = second - first
            oneQuesAns.append("? - \(second) = \(third)")
        }
        
        print("=====\(first)")
        print("=====\(second)")
        print("=====\(third)")
        
        let random1 = createRandomMan(first - 1,end: first + 2)
        
        a = random1()
        b = random1()
        c = random1()
        d = random1()
        
        if(a == first)
        {
            rightAnswer.append(1)
        }
        else if(b == first)
        {
            rightAnswer.append(2)
        }else if(c == first)
        {
            rightAnswer.append(3)
        }else
        {
            rightAnswer.append(4)
        }
        
        print("====\(rightAnswer)")
        
        oneQuesAns.append("A \(a)")
        oneQuesAns.append("B \(b)")
        oneQuesAns.append("C \(c)")
        oneQuesAns.append("D \(d)")
        return oneQuesAns
    }

    func oneQueMinusSecond(m: Int,n: Int) -> [String]
    {
        var oneQuesAns = [String]()
        first = randomResult(m...n)
        second = randomResult(m...n)
        if(first > second)
        {
            third = first - second
            oneQuesAns.append("\(first) - ? = \(third)")
        }
        else
        {
            third = second - first
            oneQuesAns.append("\(first) - ? = \(third)")
        }
        
        print("=====\(first)")
        print("=====\(second)")
        print("=====\(third)")
        
        let random1 = createRandomMan(second - 1,end: second + 2)
        
        a = random1()
        b = random1()
        c = random1()
        d = random1()
        
        if(a == second)
        {
            rightAnswer.append(1)
        }
        else if(b == second)
        {
            rightAnswer.append(2)
        }else if(c == second)
        {
            rightAnswer.append(3)
        }else
        {
            rightAnswer.append(4)
        }
        
        print("====\(rightAnswer)")
        
        oneQuesAns.append("A \(a)")
        oneQuesAns.append("B \(b)")
        oneQuesAns.append("C \(c)")
        oneQuesAns.append("D \(d)")
        return oneQuesAns
    }
    
    func oneQueTimesFirst(m: Int,n: Int) -> [String]
    {
        var oneQuesAns = [String]()
        first = randomResult(m...n)
        second = randomResult(m...n)
        third = first * second
        
        print("=====\(first)")
        print("=====\(second)")
        print("=====\(third)")
        
        let random1 = createRandomMan(first - 1,end: first + 2)
        
        a = random1()
        b = random1()
        c = random1()
        d = random1()
        
        if(a == first)
        {
            rightAnswer.append(1)
        }
        else if(b == first)
        {
            rightAnswer.append(2)
        }else if(c == first)
        {
            rightAnswer.append(3)
        }else
        {
            rightAnswer.append(4)
        }
        
        print("====\(rightAnswer)")
        oneQuesAns.append("? X \(second) = \(third)")
        oneQuesAns.append("A \(a)")
        oneQuesAns.append("B \(b)")
        oneQuesAns.append("C \(c)")
        oneQuesAns.append("D \(d)")
        return oneQuesAns
    }

    func oneQueTimesSecond(m: Int,n: Int) -> [String]
    {
        var oneQuesAns = [String]()
        first = randomResult(m...n)
        second = randomResult(m...n)
        third = first * second
        
        print("=====\(first)")
        print("=====\(second)")
        print("=====\(third)")
        
        let random1 = createRandomMan(second - 1,end: second + 2)
        
        a = random1()
        b = random1()
        c = random1()
        d = random1()
        
        if(a == second)
        {
            rightAnswer.append(1)
        }
        else if(b == second)
        {
            rightAnswer.append(2)
        }else if(c == second)
        {
            rightAnswer.append(3)
        }else
        {
            rightAnswer.append(4)
        }
        
        print("====\(rightAnswer)")
        oneQuesAns.append("\(first) X ? = \(third)")
        oneQuesAns.append("A \(a)")
        oneQuesAns.append("B \(b)")
        oneQuesAns.append("C \(c)")
        oneQuesAns.append("D \(d)")
        return oneQuesAns
    }


    
    func allQueLevel1(c: Int,m: Int, n: Int) -> [[String]]
    {
        for i in 0..<c {
            if(randomResult(0...i)%3==0)
            {
                allQuesAns.append(oneQueAdd(m,n: n))
            }
            else if(randomResult(0...i)%3==1)
            {
                allQuesAns.append(oneQueAddFirst(m,n: n))
            }
            else
            {
                allQuesAns.append(oneQueAddSecond(m,n: n))
            }
           
            print("=====+++\(allQuesAns)")
        }
        
        print("====\(allQuesAns)")
        return allQuesAns
    }
    
    func allQueLevel2(c: Int,m: Int, n: Int) -> [[String]]
    {
        for i in 0..<c {
            if(randomResult(0...i)%6==0)
            {
                allQuesAns.append(oneQueAdd(m,n: n))
            }
            else if(randomResult(0...i)%6==1)
            {
                allQuesAns.append(oneQueAddFirst(m,n: n))
            }
            else if(randomResult(0...i)%6==2)
            {
                allQuesAns.append(oneQueAddSecond(m,n: n))
            }
            else if(randomResult(0...i)%6==3)
            {
                allQuesAns.append(oneQueMinusFirst(m,n: n))
            }
            else if(randomResult(0...i)%6==4)
            {
                allQuesAns.append(oneQueMinusSecond(m,n: n))
            }
            else
            {
                allQuesAns.append(oneQueMinus(m,n: n))
            }
           
            print("=====+++\(allQuesAns)")
        }
        
        print("====\(allQuesAns)")
        return allQuesAns
    }
    
    func allQueLevel3(c: Int,m: Int, n: Int) -> [[String]]
    {
        for i in 0..<c {
            if(randomResult(0...i)%9==0)
            {
                allQuesAns.append(oneQueAdd(m,n: n))
            }
            else if(randomResult(0...i)%9==1)
            {
                allQuesAns.append(oneQueAddFirst(m,n: n))
            }
            else if(randomResult(0...i)%9==2)
            {
                allQuesAns.append(oneQueAddSecond(m,n: n))
            }
            else if(randomResult(0...i)%9==3)
            {
                allQuesAns.append(oneQueMinusFirst(m,n: n))
            }
            else if(randomResult(0...i)%9==4)
            {
                allQuesAns.append(oneQueMinusSecond(m,n: n))
            }
            else if(randomResult(0...i)%9==5)
            {
                allQuesAns.append(oneQueMinus(m,n: n))
            }
            else if(randomResult(0...i)%9==6)
            {
                allQuesAns.append(oneQueTimesFirst(m,n: n))
            }
            else if(randomResult(0...i)%9==7)
            {
                allQuesAns.append(oneQueTimesSecond(m,n: n))
            }
            else
            {
                allQuesAns.append(oneQueTimes(m,n: n))
            }
            print("=====+++\(allQuesAns)")
        }
        
        print("====\(allQuesAns)")
        return allQuesAns
    }
    
    var buttonA = UIButton()
    var buttonB = UIButton()
    var buttonC = UIButton()
    var buttonD = UIButton()
    var buttonALabel = UILabel()
    var buttonBLabel = UILabel()
    var buttonCLabel = UILabel()
    var buttonDLabel = UILabel()
    var questionLabel = UILabel()
    
    var questionUpdateTimer:NSTimer?
    var countDownTimer:NSTimer?
    var timeNum = 60
    var timeLabel = UILabel()
    var totalNum = 20
    var levelNumm = 0
    var levelNumn = 10
    var rightNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("AnswerViewController->viewDidLoad")
        
        if(currentLevel==1)
        {
            totalNum=20;
            levelNumm=0
            levelNumn=10
            allQueLevel1(totalNum,m:levelNumm,n: levelNumn)
        }
        else if(currentLevel==2)
        {
            totalNum=20;
            levelNumm=10
            levelNumn=20
            allQueLevel2(totalNum,m:levelNumm,n: levelNumn)
        }
        else if(currentLevel==3)
        {
            totalNum=20;
            levelNumm=20
            levelNumn=30
            allQueLevel3(totalNum,m:levelNumm,n: levelNumn)
        }
        else if(currentLevel==4)
        {
            totalNum=20;
            levelNumm=30
            levelNumn=50
            allQueLevel3(totalNum,m:levelNumm,n: levelNumn)
        }
        else if(currentLevel==5)
        {
            totalNum=20;
            levelNumm=50
            levelNumn=100
            allQueLevel3(totalNum,m:levelNumm,n: levelNumn)
        }
        else
        {
            totalNum=20;
            levelNumm=100
            levelNumn=1000
            allQueLevel3(totalNum,m:levelNumm,n: levelNumn)
        }
        
        print("====allQuesAns\(allQuesAns)")
        
        let backImageview = UIImageView()
        backImageview.frame = CGRectMake(0,0,480,320)
        let image = UIImage(named:"b16.png")
        backImageview.image = image
        self.view.addSubview(backImageview)
        
        let backButton = UIButton()
        backButton.frame = CGRectMake(5,140,50,50)
        backButton.setImage(UIImage(named:"left_arrow.png"),forState:.Normal)
        self.view.addSubview(backButton)
        backButton.addTarget(self, action:"turnBack",forControlEvents:.TouchUpInside)
        
        questionLabel.frame = CGRectMake(80,100,320,60)
        questionLabel.text = allQuesAns[0][0]
        questionLabel.textAlignment = .Center
        self.view.addSubview(questionLabel)
        
        buttonA.frame = CGRectMake(30,210,220,40)
        buttonA.setImage(UIImage(named:"平时状态@2x.png"),forState:.Normal)
        self.view.addSubview(buttonA)
        buttonA.addTarget(self, action:"judgeResult:",forControlEvents:.TouchUpInside)
        buttonA.tag = 1
        
        buttonALabel.frame = CGRectMake(30,210,220,40)
        buttonALabel.text = allQuesAns[0][1]
        buttonALabel.textColor = UIColor.whiteColor()
        buttonALabel.textAlignment = .Center
        self.view.addSubview(buttonALabel)
        
        buttonB.frame = CGRectMake(230,210,220,40)
        buttonB.setImage(UIImage(named:"平时状态@2x.png"),forState:.Normal)
        self.view.addSubview(buttonB)
        buttonB.tag = 2
        buttonB.addTarget(self, action:"judgeResult:",forControlEvents:.TouchUpInside)
        
        buttonBLabel.frame = CGRectMake(230,210,220,40)
        buttonBLabel.text = allQuesAns[0][2]
        buttonBLabel.textColor = UIColor.whiteColor()
        buttonBLabel.textAlignment = .Center
        self.view.addSubview(buttonBLabel)
        
        buttonC.frame = CGRectMake(30,260,220,40)
        buttonC.setImage(UIImage(named:"平时状态@2x.png"),forState:.Normal)
        self.view.addSubview(buttonC)
        buttonC.tag = 3
        buttonC.addTarget(self, action:"judgeResult:",forControlEvents:.TouchUpInside)
        
        buttonCLabel.frame = CGRectMake(30,260,220,40)
        buttonCLabel.text = allQuesAns[0][3]
        buttonCLabel.textColor = UIColor.whiteColor()
        buttonCLabel.textAlignment = .Center
        self.view.addSubview(buttonCLabel)
        
        buttonD.frame = CGRectMake(230,260,220,40)
        buttonD.setImage(UIImage(named:"平时状态@2x.png"),forState:.Normal)
        buttonD.tag = 4
        self.view.addSubview(buttonD)
        buttonD.addTarget(self, action:"judgeResult:",forControlEvents:.TouchUpInside)
        
        buttonDLabel.frame = CGRectMake(230,260,220,40)
        buttonDLabel.text = allQuesAns[0][4]
        buttonDLabel.textColor = UIColor.whiteColor()
        buttonDLabel.textAlignment = .Center
        self.view.addSubview(buttonDLabel)
        
        
        timeLabel.frame = CGRectMake(20,15,80,30)
        timeLabel.text = "00:\(timeNum)"
        timeLabel.backgroundColor = UIColor.blueColor()
        timeLabel.textColor = UIColor.whiteColor()
        timeLabel.textAlignment = .Center
        self.view.addSubview(timeLabel)
    }
    
    func setOriginState() {
        timeNum = 60
        currentQuestion = 0
        rightNum = 0
        buttonA.setImage(UIImage(named:"平时状态@2x.png"),forState:.Normal)
        buttonB.setImage(UIImage(named:"平时状态@2x.png"),forState:.Normal)
        buttonC.setImage(UIImage(named:"平时状态@2x.png"),forState:.Normal)
        buttonD.setImage(UIImage(named:"平时状态@2x.png"),forState:.Normal)
        
        buttonA.enabled = true
        buttonB.enabled = true
        buttonC.enabled = true
        buttonD.enabled = true
        
        questionLabel.text = allQuesAns[currentQuestion][0]
        buttonALabel.text = allQuesAns[currentQuestion][1]
        buttonBLabel.text = allQuesAns[currentQuestion][2]
        buttonCLabel.text = allQuesAns[currentQuestion][3]
        buttonDLabel.text = allQuesAns[currentQuestion][4]
        
    }
    func updateTimer() {
        timeNum--;
        if timeNum <= 0 {
            countDownTimer?.invalidate()
            timeNum = 60
            //弹出一个警告框：UIAlertView
            let alert = UIAlertController(title: "提示", message: "亲，时间已到！", preferredStyle: .Alert)
            let actionYes = UIAlertAction(title: "重做", style: .Default, handler: {act in
                self.countDownTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector:"updateTimer", userInfo: nil, repeats: true)
                })
            let actionNo = UIAlertAction(title: "不重做", style: .Default, handler: {act in
                let rvc = ResultViewController()
                rvc.totalNum = self.totalNum
                rvc.rightNum = self.rightNum
                rvc.wrongNum = self.totalNum - self.rightNum
                rvc.timeNum = 60
                if self.rightNum > self.totalNum/2 {
                    allLevels[self.currentLevel] = 1
                    writeAllLevels()
                }
                self.presentViewController(rvc, animated: true, completion: nil)
                })
            alert.addAction(actionYes)
            alert.addAction(actionNo)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        if timeNum < 10 {
            timeLabel.text = "00:0\(timeNum)"
        }
        else {
            timeLabel.text = "00:\(timeNum)"
        }
        
    }
    
    func judgeResult(sender:UIButton){
        if sender.tag == rightAnswer[currentQuestion] {
            sender.setImage(UIImage(named:"答对@2x.png"),forState:.Normal)
            rightNum++
        }
        else {
            sender.setImage(UIImage(named:"答错@2x.png"),forState:.Normal)
        }
        buttonA.enabled = false
        buttonB.enabled = false
        buttonC.enabled = false
        buttonD.enabled = false
        
        //过1秒钟，你去更新题目和选项
        //performSelector()
        questionUpdateTimer?.invalidate()
        questionUpdateTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector:"updateQuestion", userInfo: sender, repeats: false)
    }
    
    func updateQuestion() {
        currentQuestion++
        if currentQuestion >= totalNum {
            //跳到结果界面
            let rvc = ResultViewController()
            rvc.totalNum = self.totalNum
            rvc.rightNum = self.rightNum
            rvc.wrongNum = self.totalNum - self.rightNum
            rvc.timeNum = 60 - self.timeNum
            if self.rightNum > self.totalNum/2 {
                allLevels[currentLevel] = 1
                writeAllLevels()
            }
            self.presentViewController(rvc, animated: true, completion: nil)
            return
        }
        
        buttonA.enabled = true
        buttonB.enabled = true
        buttonC.enabled = true
        buttonD.enabled = true
        
        questionLabel.text = allQuesAns[currentQuestion][0]
        buttonALabel.text = allQuesAns[currentQuestion][1]
        buttonBLabel.text = allQuesAns[currentQuestion][2]
        buttonCLabel.text = allQuesAns[currentQuestion][3]
        buttonDLabel.text = allQuesAns[currentQuestion][4]
        
        let sender = questionUpdateTimer?.userInfo as! UIButton
        sender.setImage(UIImage(named:"平时状态@2x.png"),forState:.Normal)
    }
    
    
    func turnBack() {
        self.dismissViewControllerAnimated(true, completion:nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool){
        print("AnswerViewController->viewWillAppear")
        countDownTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector:"updateTimer", userInfo: nil, repeats: true)
        setOriginState()
    }
    
    override func viewDidAppear(animated: Bool){
        print("AnswerViewController->viewDidAppear")
    }
    
    override func viewWillDisappear(animated: Bool){
        print("AnswerViewController->viewWillDisappear")
        countDownTimer?.invalidate()
    }
    
    override func viewDidDisappear(animated: Bool){
        print("AnswerViewController->viewDidDisappear")
    }
    
}
