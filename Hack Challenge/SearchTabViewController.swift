//
//  SearchViewController.swift
//  Hack Challenge
//
//  Created by Cameron Hamidi on 11/21/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit

class SearchTabViewController: UIViewController {

    var tabController: UITabBarController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Search"
        
        tabController = UITabBarController()
        view.addSubview(tabController.view)
        
        let projectSearchView = ProjectSearchViewController()
        projectSearchView.tabBarItem = UITabBarItem(title: "Search projects", image: nil, tag: 0)
        
        var controllerArray = [projectSearchView]
        tabController.viewControllers = controllerArray.map{ UINavigationController.init(rootViewController: $0)}

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
