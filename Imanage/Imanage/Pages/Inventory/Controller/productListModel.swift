//
//  productListModel.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 03/11/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import Foundation

struct productListModel: Decodable {
    let message:String
    let status:String
    let product: [Produk]
}
