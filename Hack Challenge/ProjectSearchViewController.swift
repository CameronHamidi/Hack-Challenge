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
        
        var rolesLayout = UICollectionViewFlowLayout()
        rolesLayout.scrollDirection = .horizontal
        rolesLayout.minimumLineSpacing = 4
        rolesLayout.minimumInteritemSpacing = 4
        rolesLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        //rolesLayout.estimatedItemSize = CGSize(width: 50, height: 25)
        skillsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: rolesLayout)
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
        
        
        setupConstraints()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == skillsTextField {
            skills.append("X " + textField.text!)
            skillsCollectionView.reloadData()
            textField.text = ""
            return true
        } else {
            return false
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == skillsCollectionView {
            return skills.count
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
        }
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.skillsCollectionView {
            var cell = skillsCollectionView.dequeueReusableCell(withReuseIdentifier: "skill", for: indexPath) as! SkillsCollectionViewCell
            cell.configure(roleName: skills[indexPath.row])
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
        } else {
            return CGSize()
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            skillsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            skillsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            skillsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            ])
        
        NSLayoutConstraint.activate([
            skillsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            skillsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            skillsCollectionView.topAnchor.constraint(equalTo: skillsLabel.bottomAnchor, constant: 8),
            skillsCollectionView.heightAnchor.constraint(equalToConstant: 25),

        ])
        
        NSLayoutConstraint.activate([
            skillsTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            skillsTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            skillsTextField.topAnchor.constraint(equalTo: skillsCollectionView.bottomAnchor, constant: 8)
            ])
    }
    

}
