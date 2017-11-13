//
//  MenuViewController.swift
//  MobileDi
//
//  Created by Naveen Bannikoppa on 12/11/17.
//  Copyright © 2017 Naveen Bannikoppa. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet var logoutBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        //Status bar color
        SettingsiPhone.statusBarColor(col: UIColor.white)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutBtnClicked(_ sender: UIButton) {
        
        switch UIDevices().screenType {
        case .iPhone4:
            // Code for iPhone 4 & iPhone 4s
            logoutiPhone()
            break
        case .iPhone5:
            // Code for iPhone 5, 5s & iPhone se
           logoutiPhone()
            break
        case .iPhone6:
            // Code for iPhone 6, 6s & iPhone 7
            logoutiPhone()
            break
        case .iPhone6Plus:
            // Code for iPhone 6 Plus, 6s Plus , 7 Plus & iPhone 8 Plus
            logoutiPhone()
            break
        case .iPhoneX:
            // Code for iPhoneX
            logoutiPhone()
            break
        case .iPad2:
            // Code for iPad2
            logoutiPad()
            break
        case .iPadPro:
            // Code for iPad Air, iPad Air2, iPad Retina & iPad pro 9.7
            logoutiPad()
            break
        case .iPadPro12:
            // Code for iPad pro 12.9
            logoutiPad()
            break
        default:
            break
        }
        
        
       
    }
    func logoutiPhone(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc  = storyboard.instantiateViewController(withIdentifier: "LoginIphoneViewController") as! LoginIphoneViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func logoutiPad(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc  = storyboard.instantiateViewController(withIdentifier: "LoginiPadViewController") as! LoginiPadViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
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
