//
//  LoginViewController.swift
//  Hack Challenge
//
//  Created by Cameron Hamidi on 12/1/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    var loginTitle: UILabel!
    var emailTextField: UITextField!
    var passwordTextField: UITextField!
    var loginButton: UIButton!
    var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        loginTitle = UILabel()
        loginTitle.textColor = .black
        loginTitle.textAlignment = .center
        loginTitle.font = UIFont.systemFont(ofSize: 17)
        loginTitle.text = "Login"
        loginTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginTitle)
        
        emailTextField = UITextField()
        emailTextField.borderStyle = .roundedRect
        emailTextField.font = UIFont.systemFont(ofSize: 15)
        emailTextField.textColor = .black
        emailTextField.placeholder = "Enter your email address"
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailTextField)
        
        passwordTextField = UITextField()
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.font = UIFont.systemFont(ofSize: 15)
        passwordTextField.textColor = .black
        passwordTextField.placeholder = "Enter your password"
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        
        loginButton = UIButton()
        loginButton.backgroundColor = .green
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel!.font = UIFont.systemFont(ofSize: 17)
        loginButton.layer.cornerRadius = 15
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        loginButton.setTitleColor(.green, for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        
        createAccountButton = UIButton()
        createAccountButton.setTitle("Create Account", for: .normal)
        createAccountButton.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        createAccountButton.setTitleColor(.black, for: .normal)
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(createAccountButton)
        
        setupConstraints()
    }
    
    @objc func login() {
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            loginTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            
            emailTextField.topAnchor.constraint(equalTo: loginTitle.bottomAnchor, constant: 15),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 30),
            
            createAccountButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 25),
            createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
    }

}
