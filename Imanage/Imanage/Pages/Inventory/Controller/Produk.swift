//
//  Produk.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 03/11/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import Foundation


struct Produk: Codable {
    
    var name:String?
    var sku:String?
    var qty:Int?
    var weight:Int?
    var weightType:Int?
    var variant:String?
    var image:[productImage]?
    var condition:Bool?
    var description:String?
    var disabled:Bool?
    var pinned:Bool?
    var qtySold:Int?
    var active:Bool?
    var id:Int
    var orderId:Int?
    var accountId:Int?
    
}
