//
//  CreateProfileViewController.swift
//  Hack Challenge
//
//  Created by Pinxuan Huang on 11/27/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit
//wip

class CreateProfileViewController: UIViewController {
    
    var scrollView: UIScrollView!
    
    var nameLabel: UILabel!
    var nameInput: UITextField!
    
    var emailLabel: UILabel!
    var emailInput: UITextField!
    
    var netLabel: UILabel! //net ID
    var netInput: UITextField!
    
    var yearLabel: UILabel! //Gradaution year
    var yearInput: UITextField!
    
    var passLabel: UILabel! //password
    var passInput: UITextField!
    
    var majorLabel: UILabel!
    var majorInput: UITextField!
    
    var minorLabel: UILabel!
    var minorInput: UITextField!
    
    var blurbLabel: UILabel! //can act as 'caption' in the profile view
    var blurbInput: UITextField!
    
    var skillsLabel: UILabel!
    var skillsInput: UITextField!
    
    var roleLabel: UILabel!
    var roleInput: UITextField!
    
    var emailLabel: UILabel!
    var emailInput: UITextField!
    
    var skillsLabel: UILabel!
    var skillsInput: UITextField!
    
    var photoLabel: UILabel! //profile photo
    //    var photoInput: UITextView!
    
    let padding: CGFloat = 16
    let labelHeight: CGFloat = 18
    let textInputHeight: CGFloat = 32
    let textSize: CGFloat = 14
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Create Account"
        
        let backButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem = backButton
        
        let postButton = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(back))
        navigationItem.rightBarButtonItem = postButton
        
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Name"
        nameLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(nameLabel)
        
        nameInput = UITextField()
        nameInput.translatesAutoresizingMaskIntoConstraints = false
        nameInput.placeholder = "Your name"
        nameInput.font = .systemFont(ofSize: textSize)
        nameInput.borderStyle = .roundedRect
        scrollView.addSubview(nameInput)
        
        emailLabel = UILabel()
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = "E-mail"
        emailLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(emailLabel)
        
        emailInput = UITextField()
        emailInput.translatesAutoresizingMaskIntoConstraints = false
        emailInput.placeholder = "Enter email"
        emailInput.font = .systemFont(ofSize: textSize)
        emailInput.borderStyle = .roundedRect
        scrollView.addSubview(emailInput)
        
        netLabel = UILabel()
        netLabel.translatesAutoresizingMaskIntoConstraints = false
        netLabel.text = "Net ID"
        netLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(netLabel)
        
        netInput = UITextField()
        netInput.translatesAutoresizingMaskIntoConstraints = false
        netInput.placeholder = "Cornell Net ID"
        netInput.font = .systemFont(ofSize: textSize)
        netInput.borderStyle = .roundedRect
        scrollView.addSubview(netInput)
        
        yearLabel = UILabel()
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.text = "Class Of"
        yearLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(yearLabel)
        
        yearInput = UITextField()
        yearInput.translatesAutoresizingMaskIntoConstraints = false
        yearInput.placeholder = "Graduation Year"
        yearInput.font = .systemFont(ofSize: textSize)
        yearInput.borderStyle = .roundedRect
        scrollView.addSubview(yearInput)
        
        passLabel = UILabel()
        passLabel.translatesAutoresizingMaskIntoConstraints = false
        passLabel.text = "Password"
        passLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(passLabel)
        
        passInput = UITextField()
        passInput.translatesAutoresizingMaskIntoConstraints = false
        passInput.placeholder = "Enter password"
        //TODO - display as dots
//        passInput.font = .systemFont(ofSize: textSize)
        passInput.borderStyle = .roundedRect
        scrollView.addSubview(passInput)
        
        majorLabel = UILabel()
        majorLabel.translatesAutoresizingMaskIntoConstraints = false
        majorLabel.text = "Major"
        majorLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(majorLabel)
        
        majorInput = UITextField()
        majorInput.translatesAutoresizingMaskIntoConstraints = false
        majorInput.placeholder = "Enter your major"
        majorInput.font = .systemFont(ofSize: textSize)
        majorInput.borderStyle = .roundedRect
        scrollView.addSubview(majorInput)
        
        minorLabel = UILabel()
        minorLabel.translatesAutoresizingMaskIntoConstraints = false
        minorLabel.text = "Major"
        minorLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(minorLabel)
        
        minorInput = UITextField()
        minorInput.translatesAutoresizingMaskIntoConstraints = false
        minorInput.placeholder = "Enter your major"
        minorInput.font = .systemFont(ofSize: textSize)
        minorInput.borderStyle = .roundedRect
        scrollView.addSubview(minorInput)
        
        blurbLabel = UILabel()
        blurbLabel.translatesAutoresizingMaskIntoConstraints = false
        blurbLabel.text = "About"
        blurbLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(blurbLabel)
        
        blurbInput = UITextField()
        blurbInput.translatesAutoresizingMaskIntoConstraints = false
        blurbInput.placeholder = "Let others know about you"
        blurbInput.font = .systemFont(ofSize: textSize)
        blurbInput.borderStyle = .roundedRect
        scrollView.addSubview(blurbInput)
        
        skillsLabel = UILabel()
        skillsLabel.translatesAutoresizingMaskIntoConstraints = false
        skillsLabel.text = "Skills"
        skillsLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(skillsLabel)
        
        skillsInput = UITextField()
        skillsInput.translatesAutoresizingMaskIntoConstraints = false
        skillsInput.placeholder = "Separate with a comma"
        skillsInput.font = .systemFont(ofSize: textSize)
        skillsInput.borderStyle = .roundedRect
        scrollView.addSubview(skillsInput)
        
        roleLabel = UILabel()
        roleLabel.translatesAutoresizingMaskIntoConstraints = false
        roleLabel.text = "Primary Role"
        roleLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(roleLabel)
        
        roleInput = UITextField()
        roleInput.translatesAutoresizingMaskIntoConstraints = false
        roleInput.placeholder = "Enter your primary role"
        roleInput.font = .systemFont(ofSize: textSize)
        roleInput.borderStyle = .roundedRect
        scrollView.addSubview(roleInput)
        
        setupConstraints()
        
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding*2),
            nameLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: padding*2)
            ])
        
        NSLayoutConstraint.activate([
            nameInput.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding),
            nameInput.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            nameInput.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding*2)
            ])
        
        NSLayoutConstraint.activate([
            netLabel.topAnchor.constraint(equalTo: nameInput.bottomAnchor, constant: padding*2),
            netLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            netLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)
            ])
        
        NSLayoutConstraint.activate([
            netInput.topAnchor.constraint(equalTo: netLabel.bottomAnchor, constant: padding),
            netInput.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            netInput.trailingAnchor.constraint(equalTo: nameInput.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            majorLabel.topAnchor.constraint(equalTo: netInput.bottomAnchor, constant: padding*2),
            majorLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            majorLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)
            ])
        
        NSLayoutConstraint.activate([
            majorInput.topAnchor.constraint(equalTo: majorLabel.bottomAnchor, constant: padding),
            majorInput.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            majorInput.trailingAnchor.constraint(equalTo: nameInput.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            roleLabel.topAnchor.constraint(equalTo: majorInput.bottomAnchor, constant: padding*2),
            roleLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            roleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)
            ])
        
        NSLayoutConstraint.activate([
            roleInput.topAnchor.constraint(equalTo: roleLabel.bottomAnchor, constant: padding),
            roleInput.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            roleInput.trailingAnchor.constraint(equalTo: nameInput.trailingAnchor)
            ])
        
        // TODO - add rest of labels and fields
    }
    
}
