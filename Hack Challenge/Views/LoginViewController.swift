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

    var defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        view.backgroundColor = .white

        loginTitle = UILabel()
        loginTitle.textColor = .black
        loginTitle.textAlignment = .center
        loginTitle.font = UIFont.systemFont(ofSize: 17)
//        loginTitle.text = "Login" //Having the login show up twice is repetitive
        loginTitle.text = "Welcome" //maybe we could display our app's name here
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
        loginButton.backgroundColor = UIColor(displayP3Red: 126/255, green: 211/255, blue: 33/255, alpha: 1.0)
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel!.font = UIFont.boldSystemFont(ofSize: 17)
        loginButton.layer.cornerRadius = 10
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)

        createAccountButton = UIButton()
        createAccountButton.setTitle("Create Account", for: .normal)
        createAccountButton.titleLabel!.font = UIFont.boldSystemFont(ofSize: 17)
        createAccountButton.setTitleColor(.white, for: .normal)
        createAccountButton.backgroundColor = .black
        createAccountButton.layer.cornerRadius = 10
        //createAccountButton.addTarget(self, action: #selector(showCreateProfileView), for: .touchUpInside)
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        createAccountButton.addTarget(self, action: #selector(createAccount), for: .touchUpInside)
        view.addSubview(createAccountButton)

        if let email = defaults.string(forKey: "email"), let password = defaults.string(forKey: "password") {
            emailTextField.text = email
            passwordTextField.text = password
//            login()
        }

        setupConstraints()
    }

    @objc func createAccount() {
        requestCreateAccount { (responseData) in
            DispatchQueue.main.async {
                if responseData == "" {
                    var newView = EditProfileViewController()
                    self.navigationController?.pushViewController(newView, animated: true)
                } else {
                    let alert = UIAlertController(title: "Error", message: responseData, preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true)
                }
            }
        }
    }

    func requestCreateAccount(completion: @escaping(String) -> Void) {
        if emailTextField.text! != "" && passwordTextField.text! != "" {
            var parameters = ["email" : emailTextField.text!, "password" : passwordTextField.text!]
            Alamofire.request("http://35.190.171.42/api/login/create/", method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { (response) in
                switch response.result {
                case .success(let data):
                    let decoder = JSONDecoder()
                    do {
                        var decodedData = try? decoder.decode(LoginResponse.self, from: data)
                        if decodedData!.success! {
                            completion("")
                        } else {
                            completion("Unknown error")
                        }
                    } catch {
                        completion("Unknown error")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(error.localizedDescription)
                }
            }
        }
    }

    @objc func login() {
        loginRequest { response in
            DispatchQueue.main.async {
                if response {
                    print(response)
                    var newView = HomeViewController()
                    self.present(newView, animated: true, completion: nil)
                } else {
                    print("Invalid Response Data")
                    let alert = UIAlertController(title: "Invalid Password", message: "Please try again.", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
    func loginRequest(completion: @escaping(Bool) -> Void) {
        if emailTextField.text! != "" && passwordTextField.text! != "" {
            var parameters = ["email" : emailTextField.text!, "password" : passwordTextField.text!]
            print("http://35.190.171.42/api/login/")
            Alamofire.request("http://35.190.171.42/api/login/", method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { (response) in
                switch response.result {
                case .success(let data):
                    if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]{
                        let decoder = JSONDecoder()
                        do {
                            var decodedData = try? decoder.decode(LoginResponse.self, from: data)
                            print("success")
                            if decodedData!.success! {
                                print("success")
                                self.defaults.set(self.emailTextField.text, forKey: "email")
                                self.defaults.set(self.passwordTextField.text, forKey: "password")
                                self.defaults.set(json["token"], forKey: "token")
                                self.defaults.set(json["uid"], forKey: "uid")
                                completion(decodedData!.success!)
                            } else {
                                completion(false)
                            }
                        } catch {
                            completion(false)
                        }
                        print(json)
                    } else {
                        completion(false)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        } else {
            let alert = UIAlertController(title: "Invalid Data", message: "Please enter both your email address, and your password.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            loginTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),

            emailTextField.topAnchor.constraint(equalTo: loginTitle.bottomAnchor, constant: 15),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),

            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),

            createAccountButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 50),
            createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createAccountButton.heightAnchor.constraint(equalToConstant: 35),
            createAccountButton.widthAnchor.constraint(equalToConstant: 200)
            ])
    }

}
