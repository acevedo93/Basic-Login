//
//  LoginPresenter.swift
//  Login
//
//  Created by David Acevedo on 16/03/24.
//

import Foundation

protocol LoginPresenterProtocol {
    func loginButtonTapped(username: String, password: String)
}


class LoginPresenter {
    
    private weak var view: LoginViewProtocol?
    private var model = LoginModel()
    init(view: LoginViewProtocol) {
        self.view = view
        
    }
}

extension LoginPresenter: LoginPresenterProtocol {
    
    func loginButtonTapped(username: String, password: String) {
        //Logic to make login
        view?.showLoader()
        //Do logic
        model.loginUser(credentials: LoginCredentialsModel(username: username, password: password)) { success, error in
            
            
            if success {
                self.view?.loginSuccess()
            } else {
                let errorMessage = error?.localizedDescription ?? "Error desconocido"
                self.view?.loginFailure(msg: errorMessage)
            }
        }
    }
    
}
