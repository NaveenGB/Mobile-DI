//
//  SettingiPhone.swift
//  Mobile Di
//
//  Created by Naveen Bannikoppa on 12/11/17.
//  Copyright © 2017 Naveen Bannikoppa. All rights reserved.
//

import Foundation
import UIKit

public class SettingsiPhone {
    // MARK: - Textfield Colors
    
    //Button Color
    public static let buttonTouchColor = UIColor(red: 3/255, green: 169/255, blue: 244/255, alpha: 1)
    public static let buttonReleaseColor = UIColor.blue
    
    public static let statusBackgroundColor = UIColor.white
        //UIColor(red: 19/255, green: 91/255, blue: 121/255, alpha: 1)
    //TextField Corner and Border
    class func textField(textFld:UITextField){
        let myColor : UIColor = UIColor.white
        textFld.layer.borderColor = myColor.cgColor
        textFld.layer.borderWidth = 0.5
        textFld.layer.cornerRadius = CGFloat(15)
        textFld.clipsToBounds = true;
    }
    
    //Button Corner and Border
    class func buttonRadious(button:UIButton){
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 0.8
        button.layer.borderColor = UIColor .clear.cgColor
        button.clipsToBounds = true;
    }
    
    //Status bar color
    class func statusBarColor(col:UIColor){
        UIApplication.shared.statusBarStyle = .lightContent
        
        //Change status bar color
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.backgroundColor = col
    }
}
