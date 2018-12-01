//
//  PostsViewController.swift
//  Hack Challenge
//
//  Created by Cameron Hamidi on 11/30/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var postPreviewsTableView: UITableView!
    var posts: [Post]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        postPreviewsTableView = UITableView()
        postPreviewsTableView.dataSource = self
        postPreviewsTableView.delegate = self
        postPreviewsTableView.dataSource = self
        postPreviewsTableView.translatesAutoresizingMaskIntoConstraints = false
        postPreviewsTableView.register(PostPreviewTableViewCell.self, forCellReuseIdentifier: "post")
        view.addSubview(postPreviewsTableView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            postPreviewsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            postPreviewsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            postPreviewsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postPreviewsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = postPreviewsTableView.dequeueReusableCell(withIdentifier: "post") as! PostPreviewTableViewCell
        cell.setNeedsUpdateConstraints()
        return cell
    }

}
