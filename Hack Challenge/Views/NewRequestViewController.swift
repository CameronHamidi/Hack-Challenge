//
//  NewRequestViewController.swift
//  Hack Challenge
//
//  Created by Pinxuan Huang on 11/25/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit

//Layout would be the same as NewPitchViewController - will be added here later
//With the addition of 'group size' and 'roles' options

class NewRequestViewController: UIViewController {
    
    var scrollView: UIScrollView!
    
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
    
    var groupLabel: UILabel!
    var sizeLabel: UILabel!
    var stepper: UIStepper!
    
    var roleLabel: UILabel!
    var roleTableView: UITableView!

    let padding: CGFloat = 16
    let labelHeight: CGFloat = 18
    let textInputHeight: CGFloat = 32
    let textSize: CGFloat = 14
    let buttonSize: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "New Request"
        
        let backButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem = backButton
        
        let postButton = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(back))
        navigationItem.rightBarButtonItem = postButton
        
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.backgroundColor = .lightGray //for testing purposes
        view.addSubview(scrollView)
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Title"
        titleLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(titleLabel)
        
        titleInput = UITextField()
        titleInput.translatesAutoresizingMaskIntoConstraints = false
        titleInput.placeholder = "Enter a title here"
        titleInput.font = .systemFont(ofSize: textSize)
        titleInput.borderStyle = .roundedRect
        scrollView.addSubview(titleInput)
        
        descrLabel = UILabel()
        descrLabel.translatesAutoresizingMaskIntoConstraints = false
        descrLabel.text = "Description"
        descrLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(descrLabel)
        
        descrInput = UITextField()
        descrInput.translatesAutoresizingMaskIntoConstraints = false
        descrInput.placeholder = "Write your description here"
        descrInput.font = .systemFont(ofSize: textSize)
        descrInput.textAlignment = .left
        descrInput.borderStyle = .roundedRect
        scrollView.addSubview(descrInput)
        
        imageLabel = UILabel()
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        imageLabel.text = "Images"
        imageLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(imageLabel)
        
        lineSeparator = UIView()
        lineSeparator.translatesAutoresizingMaskIntoConstraints = false
        lineSeparator.backgroundColor = .lightGray
        scrollView.addSubview(lineSeparator)
        
        cameraButton = UIButton()
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        cameraButton.setImage(UIImage(named: "img_cam"), for: .normal)
        cameraButton.setTitle("Camera", for: .normal)
        scrollView.addSubview(cameraButton)
        
        libButton = UIButton()
        libButton.translatesAutoresizingMaskIntoConstraints = false
        libButton.setImage(UIImage(named: "img_lib"), for: .normal)
        libButton.setTitle("Library", for: .normal)
        scrollView.addSubview(libButton)
        
        cameraLabel = UILabel()
        cameraLabel.translatesAutoresizingMaskIntoConstraints = false
        cameraLabel.text = "Camera"
        cameraLabel.textAlignment = .center
        cameraLabel.font = .systemFont(ofSize: textSize)
        scrollView.addSubview(cameraLabel)
        
        libLabel = UILabel()
        libLabel.translatesAutoresizingMaskIntoConstraints = false
        libLabel.text = "Gallery"
        libLabel.textAlignment = .center
        libLabel.font = .systemFont(ofSize: textSize)
        scrollView.addSubview(libLabel)
        
        // Group Size
        groupLabel = UILabel()
        groupLabel.translatesAutoresizingMaskIntoConstraints = false
        groupLabel.text = "Group Size"
        groupLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(groupLabel)
        
        sizeLabel = UILabel()
        sizeLabel.translatesAutoresizingMaskIntoConstraints = false
        sizeLabel.text = "1"
        sizeLabel.font = .systemFont(ofSize: labelHeight)
        scrollView.addSubview(sizeLabel)
        
        stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.stepValue = 1
        stepper.minimumValue = 1
        stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        scrollView.addSubview(stepper)
        
        // TODO - Roles
        //UITableview for roles select
        //CheckBox Input
        
        roleLabel = UILabel()
        roleLabel.translatesAutoresizingMaskIntoConstraints = false
        roleLabel.text = "Roles"
        roleLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(roleLabel)
        
        setupConstraints()

    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func stepperValueChanged(_ sender:UIStepper!){
        sizeLabel.text = String(Int(sender.value))
    }
    
    func setupConstraints() {
        
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding*2).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            titleInput.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            titleInput.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            titleInput.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            titleInput.heightAnchor.constraint(equalToConstant: 32)
            ])
        
        NSLayoutConstraint.activate([
            descrLabel.topAnchor.constraint(equalTo: titleInput.bottomAnchor, constant: padding*2),
            descrLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
//            descrLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)
            ])
        
        NSLayoutConstraint.activate([
            descrInput.topAnchor.constraint(equalTo: descrLabel.bottomAnchor, constant: padding),
            descrInput.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descrInput.trailingAnchor.constraint(equalTo: titleInput.trailingAnchor),
            descrInput.heightAnchor.constraint(equalToConstant: 200)
            ])
        
        NSLayoutConstraint.activate([
            imageLabel.topAnchor.constraint(equalTo: descrInput.bottomAnchor, constant: padding*2),
            imageLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
//            imageLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)
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
        
        NSLayoutConstraint.activate([
            groupLabel.topAnchor.constraint(equalTo: lineSeparator.bottomAnchor, constant: padding*2),
            groupLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
//            groupLabel.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
        
        NSLayoutConstraint.activate([
            sizeLabel.topAnchor.constraint(equalTo: groupLabel.bottomAnchor, constant: padding),
            sizeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
//            sizeLabel.heightAnchor.constraint(equalToConstant: textInputHeight)
            ])
        
        NSLayoutConstraint.activate([
            stepper.topAnchor.constraint(equalTo: sizeLabel.topAnchor),
            stepper.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stepper.widthAnchor.constraint(equalToConstant: 124),
            stepper.heightAnchor.constraint(equalToConstant: 48)
            ])
        
        NSLayoutConstraint.activate([
            roleLabel.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: padding*2),
            roleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            roleLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -padding)
            ])
    }

}
