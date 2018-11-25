//
//  ProjectSearchViewController.swift
//  Hack Challenge
//
//  Created by Cameron Hamidi on 11/22/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit

class ProjectSearchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {

    var skillsLabel: UILabel!
    var skillsCollectionView: UICollectionView!
    var skills = [String]()
    var skillsTextField: UITextField!
    let padding: CGFloat = 20
    
    var rolesLabel: UILabel!
    var rolesCollectionView: UICollectionView!
    var roles = ["Developer", "Frontend Developer", "Backend Developer", "iOS Developer", "Embedded Systems Developer", "Designer"]
    let NUM_ROLES_DEFAULT = 6
    var selectedRoles = [String]()
    var rolesTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("test")
        // Do any additional setup after loading the view.
        navigationItem.title = "Search Projects"
        
        view.backgroundColor = .white
        
        skillsLabel = UILabel()
        skillsLabel.text = "Skills"
        skillsLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        skillsLabel.textAlignment = .left
        skillsLabel.textColor = .black
        skillsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(skillsLabel)
        
        var skillsLayout = UICollectionViewFlowLayout()
        skillsLayout.scrollDirection = .horizontal
        skillsLayout.minimumLineSpacing = 4
        skillsLayout.minimumInteritemSpacing = 4
        skillsLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        //skillsLayout.estimatedItemSize = CGSize(width: 50, height: 25)
        skillsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: skillsLayout)
        skillsCollectionView.delegate = self
        skillsCollectionView.dataSource = self
        skillsCollectionView.register(SkillsCollectionViewCell.self, forCellWithReuseIdentifier: "skill")
        skillsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(skillsCollectionView)
        skillsCollectionView.reloadData()
        skillsCollectionView.backgroundColor = .white
        skillsCollectionView.allowsMultipleSelection = true
        
        skillsTextField = UITextField()
        skillsTextField.placeholder = " ex. Python"
        skillsTextField.textColor = .black
        skillsTextField.font = UIFont.systemFont(ofSize: 15.0)
        skillsTextField.borderStyle = .roundedRect
        skillsTextField.textColor = .gray
        skillsTextField.delegate = self
        skillsTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(skillsTextField)
        
        rolesLabel = UILabel()
        rolesLabel.text = "Roles"
        rolesLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        rolesLabel.textAlignment = .left
        rolesLabel.textColor = .black
        rolesLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rolesLabel)
        
        var rolesLayout = UICollectionViewFlowLayout()
        rolesLayout.scrollDirection = .vertical
        rolesLayout.minimumLineSpacing = 4
        rolesLayout.minimumInteritemSpacing = 4
        rolesLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        rolesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: rolesLayout)
        rolesCollectionView.delegate = self
        rolesCollectionView.dataSource = self
        rolesCollectionView.register(RolesCollectionViewCell.self, forCellWithReuseIdentifier: "role")
        rolesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        rolesCollectionView.backgroundColor = .white
        rolesCollectionView.allowsMultipleSelection = true
        view.addSubview(rolesCollectionView)
        
        rolesTextField = UITextField()
        rolesTextField.placeholder = "Enter your own"
        rolesTextField.textColor = .gray
        rolesTextField.font = UIFont.systemFont(ofSize: 15.0)
        rolesTextField.borderStyle = .roundedRect
        rolesTextField.delegate = self
        rolesTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rolesTextField)
        
        setupConstraints()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == skillsTextField {
            skills.append("X " + textField.text!)
            skillsCollectionView.reloadData()
            textField.text = ""
            return true
        } else if textField == rolesTextField {
            roles.append(textField.text!)
            rolesCollectionView.reloadData()
            textField.text = ""
            return true
        } else {
            return false
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == skillsCollectionView {
            return skills.count
        } else if collectionView == rolesCollectionView {
            return roles.count
        } else {
            return 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == skillsCollectionView {
            skills.remove(at: indexPath.row)
        } else if collectionView == rolesCollectionView {
            if selectedRoles.count == 0 {
                selectedRoles.append(roles[indexPath.row])
            } else if !selectedRoles.contains(roles[indexPath.row]) {
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
        print(selectedRoles)
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.skillsCollectionView {
            var cell = skillsCollectionView.dequeueReusableCell(withReuseIdentifier: "skill", for: indexPath) as! SkillsCollectionViewCell
            cell.configure(skillName: skills[indexPath.row])
            return cell
        } else if collectionView == rolesCollectionView {
            var cell = rolesCollectionView.dequeueReusableCell(withReuseIdentifier: "role", for: indexPath) as! RolesCollectionViewCell
            cell.configure(roleName: roles[indexPath.row])
            return cell
        }
        else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.skillsCollectionView {
            print("test: \(collectionView == skillsCollectionView)")
            var width = ceil((Double)(skills[indexPath.row].count) / 10.0 * 75.0 + 10.0)
            print(width)
            return CGSize(width: width, height: 25.0)
        } else if collectionView == rolesCollectionView {
            var width = collectionView.frame.width
            var height = CGFloat(integerLiteral: 25)
            return CGSize(width: width, height: height)
        } else {
            return CGSize()
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            skillsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            skillsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1 * padding),
            skillsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            ])
        
        NSLayoutConstraint.activate([
            skillsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            skillsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1 * padding),
            skillsCollectionView.topAnchor.constraint(equalTo: skillsLabel.bottomAnchor, constant: 8),
            skillsCollectionView.heightAnchor.constraint(equalToConstant: 25),

        ])
        
        NSLayoutConstraint.activate([
            skillsTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            skillsTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1 * padding),
            skillsTextField.topAnchor.constraint(equalTo: skillsCollectionView.bottomAnchor, constant: 8)
            ])
        
        NSLayoutConstraint.activate([
            rolesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            rolesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1 * padding),
            rolesLabel.topAnchor.constraint(equalTo: skillsTextField.bottomAnchor, constant: 16)
            ])
        
        NSLayoutConstraint.activate([
            rolesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            rolesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1 * padding),
            rolesCollectionView.topAnchor.constraint(equalTo: rolesLabel.bottomAnchor, constant: 8),
            rolesCollectionView.heightAnchor.constraint(equalToConstant: 150)
            ])
        
        NSLayoutConstraint.activate([
            rolesTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            rolesTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1 * padding),
            rolesTextField.topAnchor.constraint(equalTo: rolesCollectionView.bottomAnchor, constant: 8)
            ])
    }
    

}
