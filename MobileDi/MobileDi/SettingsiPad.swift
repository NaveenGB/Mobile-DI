//
//  SettingsiPad.swift
//  Mobile Di
//
//  Created by Naveen Bannikoppa on 12/11/17.
//  Copyright © 2017 Naveen Bannikoppa. All rights reserved.
//

import Foundation
import UIKit

public class SettingsiPad {
    // MARK: - Textfield Colors
    
    //Button Color
    public static let buttonTouchColor = UIColor(red: 3/255, green: 169/255, blue: 244/255, alpha: 1)
    public static let buttonReleaseColor = UIColor.blue
    
    //TextField Corner and Border
    class func textField(textFld:UITextField){
        let myColor : UIColor = UIColor.white
        textFld.layer.borderColor = myColor.cgColor
        textFld.layer.borderWidth = 0.5
        textFld.layer.cornerRadius = CGFloat(25)
        textFld.clipsToBounds = true;
    }
    
    //Button Corner and Border
    class func buttonRadious(button:UIButton){
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 0.8
        button.layer.borderColor = UIColor(red: 23/255, green: 179/255, blue: 232/255, alpha: 1).cgColor
        button.clipsToBounds = true;
    }
}
