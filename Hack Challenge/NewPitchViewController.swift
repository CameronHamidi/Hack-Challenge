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
    
//    var tagLabel: UILabel!
//    var tagInput:
    
    let padding: CGFloat = 12
    let labelHeight: CGFloat = 18
    let textInputHeight: CGFloat = 24

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue //for testing purposes
        title = "New Pitch"
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Title"
        titleLabel.font = .boldSystemFont(ofSize: 16)
        view.addSubview(titleLabel)
        
        titleInput = UITextField()
        titleInput.translatesAutoresizingMaskIntoConstraints = false
        titleInput.placeholder = "Enter a title here"
        titleInput.font = .systemFont(ofSize: 14)
        titleInput.underlined()
        view.addSubview(titleInput)
        
//        titleInput = UITextField()
//        titleInput.translatesAutoresizingMaskIntoConstraints = false
//        titleInput.text = "Blue Circle Arena"
//        titleInput.borderStyle = .roundedRect
//        titleInput.backgroundColor = .white
//        titleInput.textAlignment = .center
//        view.addSubview(titleInput)
        
//        descrLabel = UILabel()
//        descrLabel.translatesAutoresizingMaskIntoConstraints = false
//        descrLabel.text = "Title"
//        descrLabel.font = .boldSystemFont(ofSize: 16)
//        view.addSubview(descrLabel)
        
        setupConstraints()
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            titleLabel.heightAnchor.constraint(equalToConstant: labelHeight)
//            titleLabel.widthAnchor.constraint(equalToConstant: 100)
            ])
        
        NSLayoutConstraint.activate([
            titleInput.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            titleInput.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            titleInput.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            titleInput.heightAnchor.constraint(equalToConstant: textInputHeight)
            ])
//
//        NSLayoutConstraint.activate([
//            name.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            name.topAnchor.constraint(equalTo: caption.bottomAnchor, constant: padding),
//            name.heightAnchor.constraint(equalToConstant: 36)
//            ])
//
//        NSLayoutConstraint.activate([
//            segControl.topAnchor.constraint(equalTo: name.bottomAnchor, constant: padding*2),
//            segControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
//            segControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
//            segControl.heightAnchor.constraint(equalToConstant: 32)
//            ])

    }
}

    //to give UITextFields a bottom border (underline)
    extension UITextField {
        
        func underlined(){
            let border = CALayer()
            let width = CGFloat(1.0)
            border.borderColor = UIColor.lightGray.cgColor
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
            border.borderWidth = width
            self.layer.addSublayer(border)
            self.layer.masksToBounds = true
        }
}
