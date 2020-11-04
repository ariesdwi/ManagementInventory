//
//  modelRegister.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 02/11/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import Foundation

struct ModelRegister:Encodable {
    let fullname         : String
    let email            : String
    let storeName        : String
    let phoneNumber      : String
    let storePhoneNumber : String
    let password         : String
    let username         : String
    
}
