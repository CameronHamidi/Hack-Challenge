//
//  ProjectSearchViewController.swift
//  Hack Challenge
//
//  Created by Cameron Hamidi on 11/22/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit

class ProjectSearchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {

    var scrollView: UIScrollView!
    
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
    
    var keywordsLabel: UILabel!
    var keywordsCollectionView: UICollectionView!
    var keywords = [String]()
    var keywordsTextField: UITextField!
    
    var groupSizeLabel: UILabel!
    var groupSizeCollectionView: UICollectionView!
    var groupSizes = ["1-2", "2-4", "5+"]
    var selectedSizes = [String]()
    
    var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("test")
        // Do any additional setup after loading the view.
        navigationItem.title = "Search Projects"
        
        view.backgroundColor = .white
        
        scrollView = UIScrollView()//frame: view.bounds)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        skillsLabel = UILabel()
        skillsLabel.text = "Skills"
        skillsLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        skillsLabel.textAlignment = .left
        skillsLabel.textColor = .black
        skillsLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(skillsLabel)
        
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
        scrollView.addSubview(skillsCollectionView)
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
        scrollView.addSubview(skillsTextField)
        
        rolesLabel = UILabel()
        rolesLabel.text = "Roles"
        rolesLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        rolesLabel.textAlignment = .left
        rolesLabel.textColor = .black
        rolesLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(rolesLabel)
        
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
        scrollView.addSubview(rolesCollectionView)
        
        rolesTextField = UITextField()
        rolesTextField.placeholder = "Enter your own"
        rolesTextField.textColor = .gray
        rolesTextField.font = UIFont.systemFont(ofSize: 15.0)
        rolesTextField.borderStyle = .roundedRect
        rolesTextField.delegate = self
        rolesTextField.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(rolesTextField)
        
        keywordsLabel = UILabel()
        keywordsLabel.text = "Keywords"
        keywordsLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        keywordsLabel.textAlignment = .left
        keywordsLabel.textColor = .black
        keywordsLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(keywordsLabel)
        
        keywordsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: skillsLayout)
        keywordsCollectionView.delegate = self
        keywordsCollectionView.dataSource = self
        keywordsCollectionView.register(SkillsCollectionViewCell.self, forCellWithReuseIdentifier: "keyword")
        keywordsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        keywordsCollectionView.backgroundColor = .white
        keywordsCollectionView.allowsMultipleSelection = true
        scrollView.addSubview(keywordsCollectionView)
        
        keywordsTextField = UITextField()
        keywordsTextField.placeholder = " ex. freshmen, 2020, internship"
        keywordsTextField.textColor = .gray
        keywordsTextField.font = UIFont.systemFont(ofSize: 15.0)
        keywordsTextField.borderStyle = .roundedRect
        keywordsTextField.delegate = self
        keywordsTextField.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(keywordsTextField)
        
        submitButton = UIButton()
        submitButton.setTitle("Search projects", for: .normal)
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.backgroundColor = .black
        submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        submitButton.titleLabel?.textAlignment = .center
        submitButton.addTarget(self, action: #selector(performSearch), for: .touchUpInside)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(submitButton)
        
        groupSizeLabel = UILabel()
        groupSizeLabel.text = "Group Size"
        groupSizeLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        groupSizeLabel.textAlignment = .left
        groupSizeLabel.textColor = .black
        groupSizeLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(groupSizeLabel)
        
        var groupSizeLayout = UICollectionViewFlowLayout()
        groupSizeLayout.scrollDirection = .horizontal
        groupSizeLayout.minimumLineSpacing = 4
        groupSizeLayout.minimumInteritemSpacing = 4
        groupSizeLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        groupSizeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: groupSizeLayout)
        groupSizeCollectionView.register(GroupSizeCollectionViewCell.self, forCellWithReuseIdentifier: "size")
        groupSizeCollectionView.backgroundColor = .white
        groupSizeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        groupSizeCollectionView.delegate = self
        groupSizeCollectionView.dataSource = self
        groupSizeCollectionView.allowsMultipleSelection = true
        scrollView.addSubview(groupSizeCollectionView)
        
        let backButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem = backButton
        
        setupConstraints()
        
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func performSearch() {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == skillsTextField {
            skills.append("X " + textField.text!)
            skillsCollectionView.reloadData()
            print(skills)
            textField.text = ""
            return true
        } else if textField == rolesTextField {
            roles.append(textField.text!)
            rolesCollectionView.reloadData()
            textField.text = ""
            return true
        } else if textField == keywordsTextField {
            keywords.append(textField.text!)
            keywordsCollectionView.reloadData()
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
        } else if collectionView == keywordsCollectionView {
            return keywords.count
        } else if collectionView == groupSizeCollectionView {
            return groupSizes.count
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
            collectionView.reloadData()
        } else if collectionView == rolesCollectionView {
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
        } else if collectionView == keywordsCollectionView {
            keywords.remove(at: indexPath.row)
            collectionView.reloadData()
        } else if collectionView == groupSizeCollectionView {
            if selectedSizes.count == 0 || !selectedSizes.contains(groupSizes[indexPath.row]) {
                selectedSizes.append(groupSizes[indexPath.row])
            } else {
                for i in 0..<selectedSizes.count {
                    if selectedSizes[i] == groupSizes[indexPath.row] {
                        selectedSizes.remove(at: i)
                    }
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.skillsCollectionView {
            var cell = skillsCollectionView.dequeueReusableCell(withReuseIdentifier: "skill", for: indexPath) as! SkillsCollectionViewCell
            cell.configure(skillName: skills[indexPath.row])
            print(skills[indexPath.row])
            print(skills)
            return cell
        } else if collectionView == rolesCollectionView {
            var cell = rolesCollectionView.dequeueReusableCell(withReuseIdentifier: "role", for: indexPath) as! RolesCollectionViewCell
            cell.configure(roleName: roles[indexPath.row])
            return cell
        } else if collectionView == keywordsCollectionView {
            var cell = keywordsCollectionView.dequeueReusableCell(withReuseIdentifier: "keyword", for: indexPath) as! SkillsCollectionViewCell
            cell.configure(skillName: keywords[indexPath.row])
            return cell
        } else if collectionView == groupSizeCollectionView {
            var cell = groupSizeCollectionView.dequeueReusableCell(withReuseIdentifier: "size", for: indexPath) as! GroupSizeCollectionViewCell
            cell.configure(sizeName: groupSizes[indexPath.row])
            return cell
        } else {
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
        } else if collectionView == keywordsCollectionView {
            var width = ceil((Double)(keywords[indexPath.row].count) / 10.0 * 75.0 + 10.0)
            return CGSize(width: width, height: 25.0)
        } else if collectionView == groupSizeCollectionView {
            var width = (groupSizeCollectionView.frame.width - (CGFloat)((groupSizes.count - 1) * 4)) / (CGFloat)(groupSizes.count)
            return CGSize(width: width, height: 25.0)
        }
        else {
            return CGSize()
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            skillsLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: padding),
            skillsLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -1 * padding),
            skillsLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            ])
        
        NSLayoutConstraint.activate([
            skillsCollectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: padding),
            skillsCollectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -1 * padding),
            skillsCollectionView.topAnchor.constraint(equalTo: skillsLabel.bottomAnchor, constant: 8),
            skillsCollectionView.heightAnchor.constraint(equalToConstant: 55),

        ])
        
        NSLayoutConstraint.activate([
            skillsTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: padding),
            skillsTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -1 * padding),
            skillsTextField.topAnchor.constraint(equalTo: skillsCollectionView.bottomAnchor, constant: 8)
            ])
        
        NSLayoutConstraint.activate([
            rolesLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: padding),
            rolesLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -1 * padding),
            rolesLabel.topAnchor.constraint(equalTo: skillsTextField.bottomAnchor, constant: 16)
            ])
        
        NSLayoutConstraint.activate([
            rolesCollectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: padding),
            rolesCollectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -1 * padding),
            rolesCollectionView.topAnchor.constraint(equalTo: rolesLabel.bottomAnchor, constant: 8),
            rolesCollectionView.heightAnchor.constraint(equalToConstant: CGFloat(integerLiteral: roles.count * (29)))
            ])
        
        NSLayoutConstraint.activate([
            rolesTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: padding),
            rolesTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -1 * padding),
            rolesTextField.topAnchor.constraint(equalTo: rolesCollectionView.bottomAnchor, constant: 8)
            ])
        
        NSLayoutConstraint.activate([
            keywordsLabel.topAnchor.constraint(equalTo: rolesTextField.bottomAnchor, constant: 16),
            keywordsLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: padding),
            keywordsLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -1 * padding)
        ])
        
        NSLayoutConstraint.activate([
            keywordsCollectionView.topAnchor.constraint(equalTo: keywordsLabel.bottomAnchor, constant: 8),
            keywordsCollectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: padding),
            keywordsCollectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -1 * padding),
            keywordsCollectionView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            keywordsTextField.topAnchor.constraint(equalTo: keywordsCollectionView.bottomAnchor, constant: 8),
            keywordsTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: padding),
            keywordsTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -1 * padding)
        ])
        
        NSLayoutConstraint.activate([
            groupSizeLabel.topAnchor.constraint(equalTo: keywordsTextField.bottomAnchor, constant: 16),
            groupSizeLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: padding),
            groupSizeLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -1 * padding)
            ])
        
        NSLayoutConstraint.activate([
            groupSizeCollectionView.topAnchor.constraint(equalTo: groupSizeLabel.bottomAnchor, constant: 8),
            groupSizeCollectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: padding),
            groupSizeCollectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -1 * padding),
            groupSizeCollectionView.heightAnchor.constraint(equalToConstant: 25)
            ])
        
        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(equalTo: groupSizeCollectionView.bottomAnchor, constant: 20),
            submitButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            submitButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            submitButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            submitButton.heightAnchor.constraint(equalToConstant: 50),
            submitButton.widthAnchor.constraint(equalToConstant: view.frame.width)
        ])
    }
    

}
