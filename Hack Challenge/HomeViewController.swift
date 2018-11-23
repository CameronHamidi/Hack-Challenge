//
//  ViewController.swift
//  Hack Challenge
//
//  Created by Cameron Hamidi on 11/21/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        
        searchButton = UIButton()
        searchButton.setTitle("Search", for: .normal)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.setTitleColor(.black, for: .normal)
        searchButton.addTarget(self, action: #selector(showSearchView), for: .touchUpInside)
        view.addSubview(searchButton)
        
        setupConstraints()
    }
    
    @objc func showSearchView() {
        let searchViewController = UINavigationController(rootViewController: ProjectSearchViewController())//SearchTabViewController())
        present(searchViewController, animated: true)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
            ])
    }


}

