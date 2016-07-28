//
//  ViewController.swift
//  ETimer
//
//  Created by Stephen on 28/07/2016.
//  Copyright © 2016 luminator.technology.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let startTime = 524
    var currentTimeNum = 0
    var timer = Timer()
    
    @IBOutlet weak var currentTime: UILabel!
    
    @IBAction func start(_ sender: AnyObject) {
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func pause(_ sender: AnyObject) {
        timer.invalidate()
    }
    
    @IBAction func plus10(_ sender: AnyObject) {
        currentTimeNum += 10
        updateDisplay()
    }
    
    @IBAction func minus10(_ sender: AnyObject) {
        if currentTimeNum > 10 {
            currentTimeNum -= 10
            updateDisplay()
        }
    }
    
    @IBAction func reset(_ sender: AnyObject) {
        currentTimeNum = startTime
        updateDisplay()
    }
    
    func processTimer() {
        currentTimeNum -= 1
        if currentTimeNum == 0 {
            timer.invalidate()
        }
        updateDisplay()
    }
    
    func updateDisplay() {
        currentTime.text = String(currentTimeNum)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        currentTimeNum = startTime
        updateDisplay()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

