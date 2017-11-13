//
//  DetailiPadViewController.swift
//  MobileDi
//
//  Created by Naveen Bannikoppa on 12/11/17.
//  Copyright © 2017 Naveen Bannikoppa. All rights reserved.
//

import UIKit

class DetailiPadViewController: UIViewController {
    @IBOutlet var backBtn: UIButton!
    @IBOutlet var img: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var imgHeightCont: NSLayoutConstraint!
    @IBOutlet var imgWidthCons: NSLayoutConstraint!
    @IBOutlet var dateTopCons: NSLayoutConstraint!
    @IBOutlet var labelTopCons: NSLayoutConstraint!
    
    var nameStr : String = ""
    var imgStr : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        //Profile Img
        img.layoutIfNeeded()
        img.layer.borderWidth = 0.5
        img.layer.masksToBounds = false
        img.layer.borderColor = UIColor.black.cgColor
        img.layer.cornerRadius = img.frame.size.height/2
        img.clipsToBounds = true
        
        if ReachabilityUrl.isConnectedToNetwork() == true{
            img.sd_setImage(with: URL(string: (imgStr as String)), placeholderImage: UIImage(named: " "));
        }
        else{
            self.view.makeToast("No Internet Connection")
        }
        
        name.text = nameStr
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        let navArray:Array = (self.navigationController?.viewControllers)!
        print(navArray.count)
        for  i in (0..<navArray.count).reversed()
        {
            let viewC:UIViewController = navArray[i]
            if viewC.isKind(of: ListiPadViewController.self){
                _  = self.navigationController?.popToViewController(viewC, animated: true)
                break
            }
        }
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
