//
//  NewGhostViewController.swift
//  Ghost Rider
//
//  Created by Youssef Elabd on 2/25/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import CoreLocation

class NewGhostViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager : CLLocationManager!
    var startLocation:CLLocation!
    var lastLocation: CLLocation!
    var traveledDistance:Double = 0
//    var travelDistance:Temp = 0;

    @IBOutlet weak var testView: UIView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy =  kCLLocationAccuracyBestForNavigation
        locationManager.distanceFilter = 1
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        navigationController?.setNavigationBarHidden(navigationController?.isNavigationBarHidden == false, animated: true)
        
        setTabBarVisible(visible: !tabBarIsVisible(), animated: true)
    }
    
    private func prefersStatusBarHidden() -> Bool {
        return navigationController?.isNavigationBarHidden == true
    }
    
    private func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        return UIStatusBarAnimation.slide
    }
    
    func setTabBarVisible(visible:Bool, animated:Bool) {
        
        if (tabBarIsVisible() == visible) { return }
        
        let frame = self.tabBarController?.tabBar.frame
        let height = frame?.size.height
        let offsetY = (visible ? -height! : height)
        
        let duration:TimeInterval = (animated ? 0.3 : 0.0)
        
        if frame != nil {
            UIView.animate(withDuration: duration) {
                self.tabBarController?.tabBar.frame = frame!.offsetBy(dx: 0, dy: offsetY!)
                return
            }
        }
    }
    
    func tabBarIsVisible() ->Bool {
        return (self.tabBarController?.tabBar.frame.origin.y)! < self.view.frame.maxY
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
//        if startLocation == nil {
//            startLocation = locations.first
//        } else {
//            if let lastLocation = locations.last {
//                let distance = startLocation.distance(from: lastLocation)
//                let lastDistance = lastLocation.distance(from: lastLocation)
//                traveledDistance += lastDistance
//                print( "\(startLocation)")
//                print( "\(lastLocation)")
//                print("FULL DISTANCE: \(traveledDistance)")
//                print("STRAIGHT DISTANCE: \(distance)")
//                label1.text = "FULL DISTANCE: \(traveledDistance)"
//                label2.text = "STRAIGHT DISTANCE: \(distance)"
//            }
//        }
//        lastLocation = locations.last
        
        if lastLocation != nil {
            
            /* this will start adding a distance at the second call of the callback */
            traveledDistance += lastLocation.distance(from: locations.last! as CLLocation)
            
            print("\(traveledDistance)")
            label1.text = "\(traveledDistance)"
            
            let sum = Double(self.testView.center.x) + traveledDistance*10
            
            if traveledDistance != 0.0 {
                UIView.animate(withDuration: 0.5) {
                    print(62 + (sum.truncatingRemainder(dividingBy: 312)))
                    
                    self.testView.center.x = CGFloat(62 + (sum.truncatingRemainder(dividingBy: 312)))
                    
                    //                if (sum) > 312 {
                    //                    let dif = sum - 312
                    //
                    //                    self.testView.center.x = CGFloat(62 + Int(dif))
                    ////                    print(self.testViwe.center.y)
                    //
                    //                }else{
                    //                    self.player2View.center.y += 30
                    //                    self.testViwe.center.y += CGFloat(integerLiteral: self.array[self.counter])
                    //                    self.counter = self.counter + 1
                    //                    print(self.testViwe.center.y)
                    //                }
                    
                }

            }
            
        }
        
        /* here we are saving the current location to our variable for later calculation */
        lastLocation = locations.last! as CLLocation
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
