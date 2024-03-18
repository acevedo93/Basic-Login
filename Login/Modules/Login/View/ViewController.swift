//
//  ViewController.swift
//  Login
//
//  Created by David Acevedo on 16/03/24.
//

import UIKit

protocol LoginViewProtocol: AnyObject {
    func showLoader()
    func hideLoader()
    func loginSuccess()
    func loginFailure(msg: String)
}

class ViewController: UIViewController {
    
    private var presenter: LoginPresenter?
    
    private let userNameTextField: UITextField = {
        let textField =  UITextField()
        textField.placeholder = "Nombre de usuario"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder =  "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Iniciar Session", for: .normal)
        button.tintColor = .yellow
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
        
    }()
    
    private let loader: UIActivityIndicatorView = {
        let activiyIndicator = UIActivityIndicatorView()
        activiyIndicator.color = .yellow
        activiyIndicator.transform = CGAffineTransform(scaleX: 2, y: 2)
        return activiyIndicator
        
    }()
    
    private let  errorMessage : UIAlertController = {
       let alertController = UIAlertController()
        return alertController
        
    }()
    
    
    @objc private func loginButtonTapped() {
        
        presenter?.loginButtonTapped(username: userNameTextField.text ?? ""  , password: passwordTextField.text ?? "")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = LoginPresenter(view: self)
        addToMainView()
        setupLayout()
    }
    
    private func addToMainView() {
        
        view.backgroundColor = .purple
        
        view.addSubview(userNameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
    }
    
    
    
    private func setupLayout() {
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userNameTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        userNameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200).isActive = true
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: userNameTextField.widthAnchor).isActive = true
        
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    }

}

extension ViewController: LoginViewProtocol {
    
    func showLoader() {
        view.addSubview(loader)
        loader.center = view.center
        loader.startAnimating()
    }
    
    func hideLoader() {
        loader.stopAnimating()
        loader.removeFromSuperview()
    }
    
    func loginSuccess() {
        print("ENTRO ACA")
        hideLoader()
        navigationController?.pushViewController(UsersViewController(), animated: true)
    }
    
    func loginFailure(msg: String) {
        hideLoader()
        errorMessage.title = msg
        errorMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(errorMessage, animated: true, completion: nil)
        
        
    }
    
    
}

