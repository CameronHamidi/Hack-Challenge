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

class NewRequestViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
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
    //    var roleTableView: UITableView!
    var rolesCollectionView: UICollectionView!
    var roles = ["Developer", "Frontend Developer", "Backend Developer", "iOS Developer", "Embedded Systems Developer", "Designer"]
    let NUM_ROLES_DEFAULT = 6
    var selectedRoles = [String]()
    var rolesTextField: UITextField!
    
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
        
        let rolesLayout = UICollectionViewFlowLayout()
        rolesLayout.scrollDirection = .vertical
        rolesLayout.minimumLineSpacing = 8
        rolesLayout.minimumInteritemSpacing = 8
        rolesLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        rolesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: rolesLayout)
        rolesCollectionView.delegate = self
        rolesCollectionView.dataSource = self
        rolesCollectionView.register(RolesCollectionViewCell.self, forCellWithReuseIdentifier: "role")
        rolesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        rolesCollectionView.backgroundColor = .white
        rolesCollectionView.allowsMultipleSelection = true
        scrollView.addSubview(rolesCollectionView)
        
        rolesTextField = UITextField()
        rolesTextField.placeholder = "Enter a role"
        rolesTextField.textColor = .gray
        rolesTextField.font = UIFont.systemFont(ofSize: 15.0)
        rolesTextField.borderStyle = .roundedRect
        //        rolesTextField.delegate = self
        rolesTextField.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(rolesTextField)
        
        setupConstraints()
        
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func stepperValueChanged(_ sender:UIStepper!){
        sizeLabel.text = String(Int(sender.value))
    }
    
    //Functions for role collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return roles.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedRoles.count == 0 || !selectedRoles.contains(roles[indexPath.row]) {
            selectedRoles.append(roles[indexPath.row])
        } else {
            for i in 0..<selectedRoles.count {
                if selectedRoles[i] == roles[indexPath.row] {
                    selectedRoles.remove(at: i)
                    break
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = rolesCollectionView.dequeueReusableCell(withReuseIdentifier: "role", for: indexPath) as! RolesCollectionViewCell
        cell.configure(roleName: roles[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width*2
        let height = CGFloat(integerLiteral: 32)
        return CGSize(width: width, height: height)
    }
    
    func setupConstraints() {
        
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: padding*2),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: padding*2)
            ])
        
        NSLayoutConstraint.activate([
            titleInput.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            titleInput.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            titleInput.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding*2),
            titleInput.heightAnchor.constraint(equalToConstant: 32)
            ])
        
        NSLayoutConstraint.activate([
            descrLabel.topAnchor.constraint(equalTo: titleInput.bottomAnchor, constant: padding*2),
            descrLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
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
            ])
        
        NSLayoutConstraint.activate([
            libButton.topAnchor.constraint(equalTo: cameraButton.topAnchor),
            libButton.leadingAnchor.constraint(equalTo: lineSeparator.trailingAnchor, constant: buttonPadding),
            libButton.widthAnchor.constraint(equalTo: cameraButton.widthAnchor),
            libButton.heightAnchor.constraint(equalTo: cameraButton.heightAnchor)
            ])
        
        NSLayoutConstraint.activate([
            libLabel.topAnchor.constraint(equalTo: cameraLabel.bottomAnchor, constant: padding),
            libLabel.centerXAnchor.constraint(equalTo: libButton.centerXAnchor)
            ])
        
        NSLayoutConstraint.activate([
            groupLabel.topAnchor.constraint(equalTo: lineSeparator.bottomAnchor, constant: padding*2),
            groupLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            sizeLabel.topAnchor.constraint(equalTo: groupLabel.bottomAnchor, constant: padding),
            sizeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 50)
            ])
        
        NSLayoutConstraint.activate([
            stepper.topAnchor.constraint(equalTo: sizeLabel.topAnchor),
            stepper.trailingAnchor.constraint(equalTo: titleInput.trailingAnchor),
            stepper.widthAnchor.constraint(equalToConstant: 124),
            stepper.heightAnchor.constraint(equalToConstant: 48)
            ])
        
        NSLayoutConstraint.activate([
            roleLabel.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: padding*2),
            roleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            rolesCollectionView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            rolesCollectionView.trailingAnchor.constraint(equalTo: titleInput.trailingAnchor),
            rolesCollectionView.topAnchor.constraint(equalTo: roleLabel.bottomAnchor, constant: padding*2),
            rolesCollectionView.heightAnchor.constraint(equalToConstant: CGFloat(integerLiteral: roles.count * (40)))
            ])
        
        NSLayoutConstraint.activate([
            rolesTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            rolesTextField.trailingAnchor.constraint(equalTo: titleInput.trailingAnchor),
            rolesTextField.topAnchor.constraint(equalTo: rolesCollectionView.bottomAnchor, constant: padding*2),
            rolesTextField.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -48)
            ])
    }
    
}
