//
//  LoginIphoneViewController.swift
//  Mobile Di
//
//  Created by Naveen Bannikoppa on 12/11/17.
//  Copyright © 2017 Naveen Bannikoppa. All rights reserved.
//

import UIKit
import CoreData
import SwiftLoader
import Toast_Swift
import SideMenu

class LoginIphoneViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var logoTopLayout: NSLayoutConstraint!
    @IBOutlet weak var logoHeightLayout: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.delegate = self
        password.delegate = self
        
        SettingsiPhone.textField(textFld: userName)
        SettingsiPhone.textField(textFld: password)
        SettingsiPhone.buttonRadious(button: loginBtn)
        
        //Side Menu Code
        // Define the menus
        let menuLeftNavigationController = UISideMenuNavigationController()
        menuLeftNavigationController.leftSide = true
        SideMenuManager.menuLeftNavigationController = menuLeftNavigationController
        
        let menuRightNavigationController = UISideMenuNavigationController()
        SideMenuManager.menuRightNavigationController = menuRightNavigationController
        
    }
    override func viewWillAppear(_ animated: Bool) {
        SwiftLoader.hide()
        //Status bar color
        SettingsiPhone.statusBarColor(col: SettingsiPhone.statusBackgroundColor)
    }
    override func viewWillLayoutSubviews() {
        switch UIDevices().screenType {
        case .iPhone4:
            // Code for iPhone 4 & iPhone 4s
            break
        case .iPhone5:
            // Code for iPhone 5, 5s & iPhone se
            logoTopLayout.constant = 65
            logoHeightLayout.constant = 20
            break
        case .iPhone6:
            // Code for iPhone 6, 6s & iPhone 7
            logoTopLayout.constant = 85
            break
        case .iPhone6Plus:
            // Code for iPhone 6 Plus, 6s Plus , 7 Plus & iPhone 8 Plus
            logoTopLayout.constant = 100
            break
        case .iPhoneX:
            // Code for iPhoneX
            logoTopLayout.constant = 98
            break
        default:
            break
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginBtnClicked(_ sender: UIButton) {
        self.view.endEditing(true)
        if ReachabilityUrl.isConnectedToNetwork() == true{
            if userName.text! != "" && password.text! != ""{
                SwiftLoader.show(animated: true)
                self.authentication()
            }else if userName.text! == ""{
                self.view.makeToast("Please enter username")
            }else if password.text! == ""{
                self.view.makeToast("Please enter password")
            }
        }
        else{
            self.view.makeToast("No Internet Connection")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func authentication(){
        let appDel:AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
        let context = appDel.persistentContainer.viewContext
       
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Users")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            var username = ""
            var passString = ""
            var checkRecord = false
            print(results)
            for res in results{
                //print("Users", res)
                username = res.value(forKeyPath: "username") as! String
                passString = res.value(forKeyPath: "password") as! String
                if username == userName.text && password.text == passString{
                    checkRecord = true;
                }
            }
            if checkRecord == true{
                //succesfull authenticate
                print("Success")
//                SwiftLoader.hide()
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc  = storyboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else{
                //show the error message
                print("Failed")
                self.view.makeToast("Username & Password is incorrect")
                SwiftLoader.hide()
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
}
