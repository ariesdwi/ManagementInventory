//
//  Helper.swift
//  Imanage
//
//  Created by Grace Cindy on 03/11/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import Foundation
import UIKit



class FontHelper {
    public static func getCompactRoundedFont(fontSize : CGFloat, fontWeight : UIFont.Weight) -> UIFont
    {
        
        let systemFont = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        let customFont: UIFont
        
        if let descriptor = systemFont.fontDescriptor.withDesign(.rounded)
        {
            customFont = UIFont(descriptor: descriptor, size: fontSize)
        }
        else
        {
            customFont = systemFont
        }
        
        return customFont
        
    }
}

class ShowAlert {
    public static func showSimpleAlert(vc : UIViewController, alert_title:String, alert_message:String)
    {
        // create the alert
        let alert = UIAlertController(title: alert_title, message: alert_message, preferredStyle: UIAlertController.Style.alert)
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        // show the alert
        vc.present(alert, animated: true, completion: nil)
    }

}



