//
//  modelOrder.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 06/11/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import Foundation

struct orderArray :Encodable,Decodable{
     var order:[modelOrder]
}
struct modelOrder :Encodable,Decodable {
      var invoiceId: String
      var orderDate: String
      var customerName: String
      var shippingTrackingNo: String
      var customerPhone: String
      var customerEmail: String
    var customerAddress:String
    var channelNotes:String? = nil
      var additionalNotes: String? = nil
      var shippingFee: Int
      var totalPrice: Int
      var id: Int
      var productId: Int
      var productsId: Int
      var accountId: Int
    var accountTokpedId:Int? = nil
}


struct addOrders: Encodable,Decodable {
     var invoiceId: String
     var orderDate: String
     var customerName: String
     var shippingTrackingNo: String
     var customerPhone: String
     var customerEmail: String
     var customerAddress: String
     var channelNotes: String
     var additionalNotes: String
     var shippingFee: Int
     var totalPrice: Int
     var productId: Int
     var productsId: Int
     var accountId: Int
}
