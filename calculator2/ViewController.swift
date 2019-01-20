//
//  ViewController.swift
//  calculator2
//
//  Created by 无敌帅的yyyyy on 2019/1/14.
//  Copyright © 2019年 无敌帅的yyyy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var userisintheMiddleofTyping = false
    
    @IBOutlet weak var label: UILabel!
    private var brain = calculatebrain()
    var labeltitle: Double{
        get{
            return Double(label.text!)!
        }
        set{
            label.text = String(newValue)
        }
    }
    
    @IBAction func touchdigit(_ sender: UIButton) {
        if userisintheMiddleofTyping{
            label.text = label.text!+sender.currentTitle!
        }else{
            label.text = sender.currentTitle
            userisintheMiddleofTyping = true
        }
    }
    
    @IBAction func mathmetical(_ sender: UIButton) {
        if userisintheMiddleofTyping{
            brain.settheoperand(labeltitle)
            userisintheMiddleofTyping = false
        }
        if let currenttitle = sender.currentTitle{
            brain.performoperation(currenttitle)
        }
        if let result = brain.result{
            labeltitle = result
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

