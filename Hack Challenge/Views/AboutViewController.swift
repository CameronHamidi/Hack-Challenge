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
    var skillsView: AboutView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        gradYearView = AboutView(frame: .zero, viewType: .gradYear)
        gradYearView.mainTextView.text = "May 2021"
        gradYearView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(gradYearView)
        
        majorsView = AboutView(frame: .zero, viewType: .majors)
        majorsView.mainTextView.text = "Computer Science\nInformation Science"
        majorsView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(majorsView)
        
        rolesView = AboutView(frame: .zero, viewType: .roles)
        rolesView.mainTextView.text = "Developer\nDesigner\nBackend Developer"
        rolesView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(rolesView)
        
        skillsView = AboutView(frame: .zero, viewType: .skills)
        skillsView.translatesAutoresizingMaskIntoConstraints = false
        skillsView.mainTextView.text = "Adobe Illustrator\nAdobe Photoshop\nBalsamiq\nBootstrap\nC\nCSS\nHTML"
        skillsView.secondaryTextView!.text = "InVision\nJava\nJavaScript\nOcaml\nPython\nSketch\nSwift"
        scrollView.addSubview(skillsView)
        
        updateConstraints()
    }
    
    func updateConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            gradYearView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15),
            gradYearView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            gradYearView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            
            majorsView.topAnchor.constraint(equalTo: gradYearView.bottomAnchor, constant: 15),
            majorsView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            majorsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15)
            ])
    }

}
