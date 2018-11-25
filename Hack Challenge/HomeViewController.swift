//
//  ViewController.swift
//  Hack Challenge
//
//  Created by Cameron Hamidi on 11/21/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var searchProjectsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        
        searchProjectsButton = UIButton()
        searchProjectsButton.setTitle("Search projects", for: .normal)
        searchProjectsButton.translatesAutoresizingMaskIntoConstraints = false
        searchProjectsButton.setTitleColor(.black, for: .normal)
        searchProjectsButton.addTarget(self, action: #selector(showSearchView), for: .touchUpInside)
        view.addSubview(searchProjectsButton)
        
        setupConstraints()
    }
    
    @objc func showSearchView() {
        let searchViewController = UINavigationController(rootViewController: ProjectSearchViewController())//SearchTabViewController())
        present(searchViewController, animated: true)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            searchProjectsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchProjectsButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
            ])
    }


}

