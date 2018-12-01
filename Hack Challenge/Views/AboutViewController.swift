//
//  AboutViewController.swift
//  Hack Challenge
//
//  Created by Cameron Hamidi on 11/30/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    var scrollView: UIScrollView!
    
    var gradYearView: AboutView!
    var majorsView: AboutView!
    var rolesView: AboutView!
    var coursesView: AboutView!
    var skillsView: AboutView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(showEditView))
        navigationItem.rightBarButtonItem = editButton
        
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        gradYearView = AboutView(frame: .zero, viewType: .gradYear)
        gradYearView.mainLabel.text = "May 2021"
        gradYearView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(gradYearView)
        
        majorsView = AboutView(frame: .zero, viewType: .majors)
        majorsView.mainLabel.text = "Computer Science\nInformation Science"
        majorsView.mainLabel.sizeToFit()
        majorsView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(majorsView)
        
        rolesView = AboutView(frame: .zero, viewType: .roles)
        rolesView.mainLabel.text = "Developer\nDesigner\nBackend Developer"
        rolesView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(rolesView)
        
        coursesView = AboutView(frame: .zero, viewType: .courses)
        coursesView.translatesAutoresizingMaskIntoConstraints = false
        coursesView.mainLabel.text = "CS 1110\nCS 2110\nCS 2800"
        coursesView.secondaryLabel!.text = "CS 3410\nCS 3110"
        scrollView.addSubview(coursesView)
        
        skillsView = AboutView(frame: .zero, viewType: .skills)
        skillsView.translatesAutoresizingMaskIntoConstraints = false
        skillsView.mainLabel.text = "Adobe Illustrator\nAdobe Photoshop\nBalsamiq\nBootstrap\nC\nCSS\nHTML"
        skillsView.secondaryLabel!.text = "InVision\nJava\nJavaScript\nOcaml\nPython\nSketch\nSwift"
        scrollView.addSubview(skillsView)
        
        updateConstraints()
    }
    
    @objc func showEditView() {
        let editView = EditProfileViewController()
        navigationController?.pushViewController(editView, animated: true)
    }
    
    func updateConstraints() {
        print("Constraints")
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            gradYearView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15),
            gradYearView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            gradYearView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            gradYearView.widthAnchor.constraint(equalToConstant: view.frame.width - 15 * 2),
    
            majorsView.topAnchor.constraint(equalTo: gradYearView.bottomAnchor, constant: 15),
            majorsView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            majorsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),

            rolesView.topAnchor.constraint(equalTo: majorsView.bottomAnchor, constant: 15),
            rolesView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            rolesView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            
            coursesView.topAnchor.constraint(equalTo: rolesView.bottomAnchor, constant: 15),
            coursesView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            coursesView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            
            skillsView.topAnchor.constraint(equalTo: coursesView.bottomAnchor, constant: 15),
            skillsView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            skillsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            skillsView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -15)
            ])
    }

}
