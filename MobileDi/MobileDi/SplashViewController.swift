//
//  SplashViewController.swift
//  Mobile Di
//
//  Created by Naveen Bannikoppa on 12/11/17.
//  Copyright © 2017 Naveen Bannikoppa. All rights reserved.
//

import UIKit
import Toast_Swift
import CoreData

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if ReachabilityUrl.isConnectedToNetwork() == true{
            
            //SaveData
            let appDel:AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
            let context = appDel.persistentContainer.viewContext
            let usersInfoObject = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context) as NSManagedObject
            usersInfoObject.setValue("vamsi", forKey: "username")
            usersInfoObject.setValue("vamsi@123", forKey: "password")
            
            let usersInfoObject1 = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context) as NSManagedObject
            usersInfoObject1.setValue("naveen", forKey: "username")
            usersInfoObject1.setValue("naveen@123", forKey: "password")
            do
            {
                try context.save()
                print("saved")
                print("Inserted Data",usersInfoObject)
            }
            catch
            {
                
            }
            
            
            //Check Screen
            switch UIDevice.current.userInterfaceIdiom {
            case .phone:
                // It's an iPhone
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc  = storyboard.instantiateViewController(withIdentifier: "LoginIphoneViewController") as! LoginIphoneViewController
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case .pad:
                // It's an iPad
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc  = storyboard.instantiateViewController(withIdentifier: "LoginiPadViewController") as! LoginiPadViewController
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case .unspecified:
                // Uh, oh! What could it be?
                break
            default:
                break
            }
        }
        else{
            self.view.makeToast("No Internet Connection")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
