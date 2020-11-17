//
//  modelAddProduct.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 04/11/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import Foundation





struct modelProduct :Encodable {
    var name:String
    var sku:String
    var qty:Int
    var weight:Int
    var price:Int
    var description:String
    var variant:String
    var condition:Bool
    var accountId:Int
    var images:[String]? = [""]
}

struct imageProduct{
    var urlImage:String
}
