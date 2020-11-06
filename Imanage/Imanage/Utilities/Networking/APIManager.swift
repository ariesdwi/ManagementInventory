//
//  APIManager.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 02/11/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import Foundation
import Alamofire

let baseUrl     = "http://104.248.98.179/api/v1"
let loginUrl    = "\(baseUrl)/Accounts/login"
let registerUrl = "\(baseUrl)/Accounts"
let addproductUrl = "http://128.199.175.160/api/v1/Products"



class APIManager{
    static let shareInstance = APIManager()

    //key for UserDefaults
    let userTokenKey = "apiToken"
    let accIdKey = "apiAccountId"
    let userEmail = "userSavedEmail"
    
     
    
    func callingRegisterAPI(registerModel: ModelRegister, completionHandler:@escaping (Bool, String)->() )
    {
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        AF.request(registerUrl, method: .post, parameters: registerModel ,encoder: JSONParameterEncoder.default, headers: headers).response{
            response in debugPrint(response)
            switch response.result{
                case .success(let data):
                    do {
                        let json =  try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]
                        //print("API Manager :\n\(json)\n")
                        if response.response?.statusCode == 200
                        {
                            completionHandler(true, "Register Success")
                        }
                        else {
                            var errMessage = "Please Try Again"
                            let errorJson = json?["error"] as? [String : Any]
                            let statusCode = errorJson?["statusCode"] as! Int
                            if statusCode == 422 { errMessage = "Email already registered" }
                            completionHandler(false, errMessage)
                        }
                        
                    } catch  {
                        completionHandler(false, "Please Try Again")
                        //print(error.localizedDescription)
                }
                case .failure(let err):
                    completionHandler(false, "Please Try Again")
                    //print(err.localizedDescription)
                }
        }
        
    }
    
    func callingLoginAPI(login: ModelLogin, completionHandler:@escaping (Bool, String)->() )
    {
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        AF.request(loginUrl, method: .post, parameters: login ,encoder: JSONParameterEncoder.default, headers: headers).response{
            response in debugPrint(response)
            switch response.result{
                case .success(let data):
                    do {
                        let json =  try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]
                        //print("API Manager :\n\(json)\n")
                        if response.response?.statusCode == 200
                        {
                            
                            let valueAccId = json?["accountId"] as? Int
                            let valueToken = json?["id"] as! String
                            //set data ke userDefaults
                            UserDefaults.standard.set(valueToken, forKey: self.userTokenKey)
                            UserDefaults.standard.set(valueAccId, forKey: self.accIdKey)
                            UserDefaults.standard.set(login.email, forKey: self.userEmail)
                            completionHandler(true, "Login Success")
                            /*//example
                             {
                                 accountId = 3;
                                 id = l09BCdTTyBSwDKUWSwT5xXxHDcmr9NjTUYSlPqueflGHgz9vudxBj2FK5s6BbaW1;
                                 login = 1;
                                 message = success;
                                 realm = string;
                                 status = success;
                             },
                             [ ["Nama Product" : "Pensil"], ]
                             
                             
                             */
                        }
                        else {
                           
                            let errorJson = json?["error"] as? [String : Any]
                            //let valueErrCode = errorJson?["code"] as! String
                            let valueMessage = errorJson?["message"] as! String
                            completionHandler(false, valueMessage)
                            /* //example
                             API Manager :
                              {
                                 error =     {
                                     code = "USERNAME_EMAIL_REQUIRED";
                                     message = "username or email is required";
                                     name = Error;
                                     stack = "Error: username or email is required......;
                                     statusCode = 400;
                                 };
                                 statusCode = "abc"
                             }
                            */
                        }
                        
                        //UserDefaults.standard.set("1234", forKey: self.apiKey)
                        //cara ambil user defaults
                        //var apiToken = UserDefaults.standard.string(forKey: self.apiKey)
                        // var apiToken = UserDefaults.standard.string(forKey: APIManager.shareInstance.userTokenKey) ?? ""
                        
                        
                    } catch  {
                        completionHandler(false, "Please Try Again")
                        //print(error.localizedDescription)
                }
                case .failure(let err):
                    completionHandler(false, "Please Try Again")
                    //print(err.localizedDescription)
                }
        }
        
    }
    
    //other example closure function, buat di lempar balik ke depan biar bisa di execute
    //tinggal tambahin function yang akan di eksekusi dan passing variabel yang dibutuhkan
    //contoh passing function with multiple parameter : onFailure:@escaping(String, Int, AnyModel)->Void
    
    /*
    func callingLoginAPI2(login: ModelLogin, onSuccess: @escaping(Int, String)->Void, onFailure: @escaping(Int, String)->Void ) {
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        AF.request("\(baseUrl)/Accounts/login", method: .post, parameters: login, encoder: JSONParameterEncoder.default, headers: headers).response{
            response in debugPrint(response)
            switch response.result{
                case .success(let data):
                    do {
                        let json =  try JSONSerialization.jsonObject(with: data!, options: [])
                        print(json)
                        onSuccess(1, "Success Login")
                    } catch  {
                        print(error.localizedDescription)
                        onFailure(2, "Failed To Login (2)")
                }
                case .failure(let err):
                    print(err.localizedDescription)
                    onFailure(3, "Failed To Login (3)")
                }
        }
        
    }
     */
    
    func getInventoryProduct(completion: @escaping(Result<[productDetail], Error>) -> Void){
    
        let jsonUrlString = "http://128.199.175.160/api/v1/Products/getMyItem?access_token=\(UserDefaults.standard.string(forKey: APIManager.shareInstance.userTokenKey) ?? "")"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do {
                
                let products = try JSONDecoder().decode(Products.self, from: data)
                let productsDetail = products.product
                completion(.success(productsDetail))
                print(products)
                print(productsDetail)
                
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
        }.resume()
    }
    
    
    func addProductAPI(addProduct: modelAddProduct){
           let headers: HTTPHeaders = [
           .contentType("application/json")
           ]
           
           AF.request(addproductUrl, method: .post, parameters: addProduct ,encoder: JSONParameterEncoder.default, headers: headers).response{
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
    
    func deleteProduct(productID: Int) {
        AF.request("http://104.248.98.179/api/v1/Products/\(productID)", method: .delete, parameters: productID, encoder: JSONParameterEncoder.default, headers: nil).response{
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
    

    func getProfile()
    {
        let headers: HTTPHeaders = [
        .contentType("application/json")
        ]
        let tokenKey = UserDefaults.standard.string(forKey: self.userTokenKey) ?? ""
        
        //AF.request("http://104.248.98.179/api/v1/Accounts", method: .get, parameters: params, encoder: JSONParameterEncoder.default, headers: headers)
        AF.request("http://104.248.98.179/api/v1/Accounts?access_token=\(tokenKey)", method: .get, headers: headers).response{
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
