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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("test")
        // Do any additional setup after loading the view.
        navigationItem.title = "Search Projects"
        
        view.backgroundColor = .white
        
        var rolesLayout = UICollectionViewFlowLayout()
        rolesLayout.scrollDirection = .horizontal
        rolesLayout.minimumLineSpacing = 8
        rolesLayout.minimumInteritemSpacing = 8
        rolesLayout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        rolesLayout.estimatedItemSize = CGSize(width: 50, height: 25)
        
        rolesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: rolesLayout)
        rolesCollectionView.backgroundColor = .white
        rolesCollectionView.delegate = self
        rolesCollectionView.dataSource = self
        rolesCollectionView.register(RolesCollectionViewCell.self, forCellWithReuseIdentifier: "role")
        rolesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rolesCollectionView)
        rolesCollectionView.reloadData()
        
        let newView = UIView()
        newView.backgroundColor = .black
        newView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(newView)
        NSLayoutConstraint.activate([
            newView.widthAnchor.constraint(equalToConstant: 50),
            newView.heightAnchor.constraint(equalToConstant: 50),
            newView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        
        setupConstraints()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       // if collectionView == self.rolesCollectionView {
        print("return")
        print(roles.count)
        return roles.count
       // } else {
          //  return 0
      //  }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        print("section")
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("cell for item at")
        if collectionView == self.rolesCollectionView {
            var cell = rolesCollectionView.dequeueReusableCell(withReuseIdentifier: "role", for: indexPath) as! RolesCollectionViewCell
            cell.configure(roleName: roles[indexPath.row])
            print(roles[indexPath.row])
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //if collectionView == self.rolesCollectionView {
        print("size")
        print("test: \(collectionView == rolesCollectionView)")
        return CGSize(width: 15.0, height: 15.0)
      //  }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            rolesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            rolesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            rolesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
            //rolesCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bot)
        ])
    }
    

}
