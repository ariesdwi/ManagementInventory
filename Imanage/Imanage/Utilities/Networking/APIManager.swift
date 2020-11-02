//
//  APIManager.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 02/11/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import Foundation
import Alamofire

class APIManager{
    static let shareInstance = APIManager()
    
    func callingRegisterAPI(register: modelRegister){
        let headers: HTTPHeaders = [
        .contentType("application/json")
        ]
        
        AF.request("http://128.199.175.160/api/v1/Accounts", method: .post, parameters: register,encoder: JSONParameterEncoder.default, headers: headers).response{
            response in debugPrint(response)
            switch response.result{
                case .success(let data):
                    do {
                        let json =  try JSONSerialization.jsonObject(with: data!, options: [])
                        print(json)
                    } catch  {
                        print(error.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func callingLoginAPI(login: ModelLogin){
        let headers: HTTPHeaders = [
        .contentType("application/json")
        ]
        
        AF.request("http://128.199.175.160/api/v1/Accounts/login", method: .post, parameters: login ,encoder: JSONParameterEncoder.default, headers: headers).response{
            response in debugPrint(response)
            switch response.result{
                case .success(let data):
                    do {
                        let json =  try JSONSerialization.jsonObject(with: data!, options: [])
                        print(json)
                    } catch  {
                        print(error.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
        
    }
}
