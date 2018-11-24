//
//  ProjectSearchViewController.swift
//  Hack Challenge
//
//  Created by Cameron Hamidi on 11/22/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit

class ProjectSearchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var rolesCollectionView: UICollectionView!
    var roles = ["Developer", "Designer", "Backend Developer", "Frontend Developer"]
    let NUM_ROLES_DEFAULT = 4
    var selectedRoles: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("test")
        // Do any additional setup after loading the view.
        navigationItem.title = "Search Projects"
        
        view.backgroundColor = .white
        
        var rolesLayout = UICollectionViewFlowLayout()
        rolesLayout.scrollDirection = .horizontal
        rolesLayout.minimumLineSpacing = 4
        rolesLayout.minimumInteritemSpacing = 4
        rolesLayout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        //rolesLayout.estimatedItemSize = CGSize(width: 50, height: 25)
        
        rolesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: rolesLayout)
//        rolesCollectionView.backgroundColor = .white
        rolesCollectionView.delegate = self
        rolesCollectionView.dataSource = self
        rolesCollectionView.register(RolesCollectionViewCell.self, forCellWithReuseIdentifier: "role")
        rolesCollectionView.register(CustomEnterCollectionViewCell.self, forCellWithReuseIdentifier: "custom")
        rolesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rolesCollectionView)
        rolesCollectionView.reloadData()
        rolesCollectionView.backgroundColor = .lightGray
        rolesCollectionView.allowsMultipleSelection = true
        
        
        setupConstraints()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == rolesCollectionView {
            return roles.count + 1
        } else {
            return 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == rolesCollectionView {
            if selectedRoles.count == 0 {
                if indexPath.row == NUM_ROLES_DEFAULT - 1 {
                    
                }
                selectedRoles.append(roles[indexPath.row])
            } else {
                if selectedRoles.contains(roles[indexPath.row]) {
                    for i in 0..<selectedRoles.count {
                        if selectedRoles[i] == roles[indexPath.row] {
                            selectedRoles.remove(at: i)
                        }
                    }
                } else {
                    selectedRoles.append(roles[indexPath.row])
                }
            }
        }
       // collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.rolesCollectionView {
            if indexPath.row == NUM_ROLES_DEFAULT {
                var cell = rolesCollectionView.dequeueReusableCell(withReuseIdentifier: "custom", for: indexPath) as! CustomEnterCollectionViewCell
                cell.customTextField.placeholder = "Enter custom role"
            }
            var cell = rolesCollectionView.dequeueReusableCell(withReuseIdentifier: "role", for: indexPath) as! RolesCollectionViewCell
            cell.configure(roleName: roles[indexPath.row])
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.rolesCollectionView {
            if indexPath.row == NUM_ROLES_DEFAULT {
                return CGSize(width: 200.0, height: 15.0)
            } else {
                print("test: \(collectionView == rolesCollectionView)")
                var width = ceil((Double)(roles[indexPath.row].count) / 10.0 * 75.0)
                print(width)
                return CGSize(width: width, height: 15.0)
            }
        } else {
            return CGSize()
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            rolesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rolesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rolesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            rolesCollectionView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    

}
