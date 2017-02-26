//
//  HomeScreenViewController.swift
//  Ghost Rider
//
//  Created by Youssef Elabd on 2/25/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import GradientView

class HomeScreenViewController: UIViewController {
    
    let gradientView = GradientView()

    
    override func loadView() {
        view = gradientView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .lightContent
        
        gradientView.colors = [
            UIColor(red:0.33, green:0.71, blue:0.94, alpha:1.0),
            .white
                ]
        
        gradientView.locations = [0.05,0.95]
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
        
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
