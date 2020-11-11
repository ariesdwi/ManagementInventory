//
//  ModelTokpedLogin.swift
//  Imanage
//
//  Created by Grace Cindy on 11/11/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import Foundation

struct TokpedLoginPhone: Encodable {
    let phone : String
    let password : String
}

struct TokpedLoginEmail: Encodable {
    let email : String
    let password : String
    let userId : Int //user id dari login app
}

struct TokpedLoginVerif: Encodable {
    let tokpedAccID : Int
    let pin : Int
    let type : String
    let userId : Int //user id dari login app
}
