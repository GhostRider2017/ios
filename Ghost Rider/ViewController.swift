//
//  ViewController.swift
//  Ghost Rider
//
//  Created by Youssef Elabd on 2/24/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController{
    
    var array : [Int] = [15,10,40,60,10,100,150,200,300]
    var counter = 0

    @IBOutlet weak var testViwe: UIView!
    @IBOutlet weak var player2View: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onPress(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5) {
            if (Int(self.testViwe.center.y) + self.array[self.counter]) >= 518 {
                  self.testViwe.center.y = 518
                print(self.testViwe.center.y)

            }else{
                self.player2View.center.y += 30
                self.testViwe.center.y += CGFloat(integerLiteral: self.array[self.counter])
                self.counter = self.counter + 1
                print(self.testViwe.center.y)
            }
            
        }
    }
    
}

