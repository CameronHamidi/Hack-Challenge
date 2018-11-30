//
//  NewPitchViewController.swift
//  Hack Challenge
//
//  Created by Pinxuan Huang on 11/24/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit

class NewPitchViewController: UIViewController {
    
    var titleLabel: UILabel!
    var titleInput: UITextField!
    
    var descrLabel: UILabel!
    var descrInput: UITextField!
    
    var imageLabel: UILabel!
    var cameraButton: UIButton!
    var libButton: UIButton! //library
    var lineSeparator: UIView!
    var cameraLabel: UILabel!
    var libLabel: UILabel!
    
    //    var tagLabel: UILabel!
    //    var tagInput:
    
    let padding: CGFloat = 16
    let labelHeight: CGFloat = 18
    let textInputHeight: CGFloat = 32
    let textSize: CGFloat = 14
    let buttonSize: CGFloat = 50 //72
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "New Pitch"
        
        let backButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem = backButton
        
        let postButton = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(dismissViewControllerAndSaveText))
        navigationItem.rightBarButtonItem = postButton
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Title"
        titleLabel.font = .boldSystemFont(ofSize: labelHeight)
        view.addSubview(titleLabel)
        
        titleInput = UITextField()
        titleInput.translatesAutoresizingMaskIntoConstraints = false
        titleInput.placeholder = "Enter a title here"
        titleInput.font = .systemFont(ofSize: textSize)
        titleInput.borderStyle = .roundedRect
        //        titleInput.underlined()
        view.addSubview(titleInput)
        
        descrLabel = UILabel()
        descrLabel.translatesAutoresizingMaskIntoConstraints = false
        descrLabel.text = "Description"
        descrLabel.font = .boldSystemFont(ofSize: labelHeight)
        view.addSubview(descrLabel)
        
        descrInput = UITextField()
        descrInput.translatesAutoresizingMaskIntoConstraints = false
        descrInput.placeholder = "Write your description here"
        descrInput.font = .systemFont(ofSize: textSize)
        descrInput.textAlignment = .left
        descrInput.borderStyle = .roundedRect
        //        descrInput.underlined()
        view.addSubview(descrInput)
        
        imageLabel = UILabel()
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        imageLabel.text = "Images"
        imageLabel.font = .boldSystemFont(ofSize: labelHeight)
        view.addSubview(imageLabel)
        
        lineSeparator = UIView()
        lineSeparator.translatesAutoresizingMaskIntoConstraints = false
        lineSeparator.backgroundColor = .lightGray
        view.addSubview(lineSeparator)
        
        cameraButton = UIButton()
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
//        cameraButton.backgroundColor = .blue
        cameraButton.setImage(UIImage(named: "img_cam"), for: .normal)
        cameraButton.setTitle("Camera", for: .normal)
        //        cameraButton.setImage("cameraIcon", for: .normal)
        view.addSubview(cameraButton)
        
        libButton = UIButton()
        libButton.translatesAutoresizingMaskIntoConstraints = false
//        libButton.backgroundColor = .blue
        libButton.setImage(UIImage(named: "img_lib"), for: .normal)
        libButton.setTitle("Library", for: .normal)
        //        cameraButton.setImage("libIcon", for: .normal)
        view.addSubview(libButton)
        
        cameraLabel = UILabel()
        cameraLabel.translatesAutoresizingMaskIntoConstraints = false
        cameraLabel.text = "Camera"
        cameraLabel.textAlignment = .center
        cameraLabel.font = .systemFont(ofSize: textSize)
        view.addSubview(cameraLabel)
        
        libLabel = UILabel()
        libLabel.translatesAutoresizingMaskIntoConstraints = false
        libLabel.text = "Gallery"
        libLabel.textAlignment = .center
        libLabel.font = .systemFont(ofSize: textSize)
        view.addSubview(libLabel)
        
        setupConstraints()
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding*2),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding*2)
            ])
        
        NSLayoutConstraint.activate([
            titleInput.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            titleInput.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            titleInput.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding*2)
            ])
        
        NSLayoutConstraint.activate([
            descrLabel.topAnchor.constraint(equalTo: titleInput.bottomAnchor, constant: padding*2),
            descrLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descrLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)
            ])
        
        NSLayoutConstraint.activate([
            descrInput.topAnchor.constraint(equalTo: descrLabel.bottomAnchor, constant: padding),
            descrInput.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descrInput.trailingAnchor.constraint(equalTo: titleInput.trailingAnchor),
            descrInput.heightAnchor.constraint(equalToConstant: 200)
            ])
        
        NSLayoutConstraint.activate([
            imageLabel.topAnchor.constraint(equalTo: descrInput.bottomAnchor, constant: padding*2),
            imageLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            imageLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)
            ])
        
        NSLayoutConstraint.activate([
            lineSeparator.topAnchor.constraint(equalTo: imageLabel.bottomAnchor, constant: padding),
            lineSeparator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lineSeparator.widthAnchor.constraint(equalToConstant: 1),
            lineSeparator.heightAnchor.constraint(equalToConstant: 72)
            ])
        
        // Some maths to align buttons
        let buttonPadding: CGFloat = view.bounds.width/4 - buttonSize/2
        
        NSLayoutConstraint.activate([
            cameraButton.topAnchor.constraint(equalTo: imageLabel.bottomAnchor, constant: padding),
            cameraButton.trailingAnchor.constraint(equalTo: lineSeparator.leadingAnchor, constant: -buttonPadding),
            cameraButton.widthAnchor.constraint(equalToConstant: buttonSize),
            cameraButton.heightAnchor.constraint(equalTo: cameraButton.widthAnchor)
            ])
        
        NSLayoutConstraint.activate([
            cameraLabel.topAnchor.constraint(equalTo: cameraButton.bottomAnchor, constant: padding),
            cameraLabel.centerXAnchor.constraint(equalTo: cameraButton.centerXAnchor)
//            cameraLabel.widthAnchor.constraint(equalToConstant: buttonSize)
            ])
        
        NSLayoutConstraint.activate([
            libButton.topAnchor.constraint(equalTo: cameraButton.topAnchor),
            libButton.leadingAnchor.constraint(equalTo: lineSeparator.trailingAnchor, constant: buttonPadding),
            libButton.widthAnchor.constraint(equalTo: cameraButton.widthAnchor),
            libButton.heightAnchor.constraint(equalTo: cameraButton.heightAnchor)
            ])
        
        NSLayoutConstraint.activate([
            libLabel.topAnchor.constraint(equalTo: libButton.bottomAnchor, constant: padding),
            libLabel.centerXAnchor.constraint(equalTo: libButton.centerXAnchor)
//            libLabel.widthAnchor.constraint(equalToConstant: buttonSize)
            ])
        
    }
    
    @objc func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }
    
    //Alert Pop-up
    func displayMyAlertMessage(userMessage:String){
        
        let myAlert = UIAlertController(title: "Oops!", message: userMessage, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }
    
    @objc func dismissViewControllerAndSaveText() {
        
        // Alerts user if title is empty on submit
        guard let titleText = titleInput.text, !titleText.isEmpty else {
            displayMyAlertMessage(userMessage: "Please input a title.")
            return
        }
        
        // Alerts user if description is empty on submit
        guard let descrText = descrInput.text, !descrText.isEmpty else {
            displayMyAlertMessage(userMessage: "Please fill out the description.")
            return
        }
        
        //Delegate to another view
        //        delegate?.newPitch(newTitle: titleText, newDescr: descrText)
        //        navigationController?.popViewController(animated: true)
    }
    
}

//to give UITextFields a bottom border (underline) - does not work
//    extension UITextField {
//
//        func underlined(){
//            let border = CALayer()
//            let width = CGFloat(1.0)
//            border.borderColor = UIColor.lightGray.cgColor
//            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
//            border.borderWidth = width
//            self.layer.addSublayer(border)
//            self.layer.masksToBounds = true
//        }
//}
