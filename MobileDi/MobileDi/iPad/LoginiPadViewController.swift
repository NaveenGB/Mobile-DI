//
//  LoginiPadViewController.swift
//  Mobile Di
//
//  Created by Naveen Bannikoppa on 12/11/17.
//  Copyright © 2017 Naveen Bannikoppa. All rights reserved.
//

import UIKit
import SwiftLoader
import Toast_Swift
import CoreData
import SideMenu

class LoginiPadViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var userNameTxtFld: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var logoTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var textfieldWidthCons: NSLayoutConstraint!
    @IBOutlet weak var logoHeightConst: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userNameTxtFld.delegate = self
        passwordTxtFld.delegate = self
        
        SettingsiPad.textField(textFld: userNameTxtFld)
        SettingsiPad.textField(textFld: passwordTxtFld)
        SettingsiPad.buttonRadious(button: loginBtn)
        
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
       
        case .iPad2:
            // Code for iPad2
            textfieldWidthCons.constant = 515
            logoTopConstraint.constant = 100
            logoHeightConst.constant = 70
            break
        case .iPadPro:
            // Code for iPad Air, iPad Air2, iPad Retina & iPad pro 9.7
            textfieldWidthCons.constant = 530
            logoTopConstraint.constant = 115
            logoHeightConst.constant = 85
            break
        case .iPadPro12:
            // Code for iPad pro 12.9
            textfieldWidthCons.constant = 600
            logoTopConstraint.constant = 180
            logoHeightConst.constant = 95
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
            if userNameTxtFld.text! != "" && passwordTxtFld.text! != ""{
                SwiftLoader.show(animated: true)
                self.authentication()
            }else if userNameTxtFld.text! == ""{
                self.view.makeToast("Please enter username")
            }else if passwordTxtFld.text! == ""{
                self.view.makeToast("Please enter password")
            }
        }
        else{
            self.view.makeToast("No Internet Connection")
        }
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
                print("Users", res)
                username = res.value(forKeyPath: "username") as! String
                passString = res.value(forKeyPath: "password") as! String
                if username == userNameTxtFld.text && passwordTxtFld.text == passString{
                    checkRecord = true;
                }
            }
            if checkRecord == true{
                //succesfull authenticate
                print("Success")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc  = storyboard.instantiateViewController(withIdentifier: "ListiPadViewController") as! ListiPadViewController
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
