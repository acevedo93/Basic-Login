//
//  LoginModel.swift
//  Login
//
//  Created by David Acevedo on 16/03/24.
//

import Foundation
import Alamofire



struct LoginCredentialsModel: Codable {
    let username: String
    let password: String
}

protocol LoginModelProtocol {
    func loginUser(credentials:LoginCredentialsModel,completion: @escaping (Bool, Error?) -> Void)
}

class LoginModel {}



extension LoginModel : LoginModelProtocol {
    func loginUser(credentials: LoginCredentialsModel, completion: @escaping (Bool, Error?) -> Void) {
        
        let urlString = "https://dummyjson.com/auth/login"
        
        AF.request(urlString, method: .post, parameters: credentials, encoder: JSONParameterEncoder.default).response { response in
            
            switch response.result {
            case .success(_) :
                    completion(true, nil)
            case .failure(let error):
                    completion(false, error)
            }
        }
        
    }
}
