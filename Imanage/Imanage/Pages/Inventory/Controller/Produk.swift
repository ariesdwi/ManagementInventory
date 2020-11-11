//
//  Produk.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 03/11/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import Foundation



struct Products:Encodable,Decodable {
    var status: String
    var message: String
    var product:[productDetail]
}


struct productDetail:Encodable,Decodable {
    var name:String
    var qty:Int
    let price:Int
    var id:Int
    var description:String
    var variant:String? = nil
    var weight:Int
    var condition:Bool
    var accountId:Int
}

struct imageUrl:Decodable {
    var imageurl:String
}
