//
//  UiDevices.swift
//  Mobile Di
//
//  Created by Naveen Bannikoppa on 12/11/17.
//  Copyright © 2017 Naveen Bannikoppa. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration

class UIDevices: NSObject {
    enum ScreenType: String {
        case iPhone4
        case iPhone5
        case iPhone6
        case iPhone6Plus
        case iPhoneX
        case iPad2
        case iPadPro
        case iPadPro12
        case Unknown
    }
    var screenType: ScreenType {
        switch UIScreen.main.nativeBounds.height {
        case 960:
            return .iPhone4
        case 1136:
            return .iPhone5
        case 1334:
            return .iPhone6
        case 2208:
            return .iPhone6Plus
        case 2436:
            return .iPhoneX
        case 1024:
            return .iPad2
        case 2048:
            return .iPadPro
        case 2732:
            return .iPadPro12
        default:
            return .Unknown
        }
    }
    
}
