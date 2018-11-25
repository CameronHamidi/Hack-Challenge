//
//  NewRequestViewController.swift
//  Hack Challenge
//
//  Created by Pinxuan Huang on 11/25/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit

//Layout would be the same as NewPitchViewController - will be added here later
//With the addition of 'group size' and 'roles' options

class NewRequestViewController: UIViewController {
    
    var groupLabel: UILabel!
    var sizeLabel: UILabel!
    var stepper: UIStepper!
    
    var roleLabel: UILabel!
    var roleTableView: UITableView!

    let padding: CGFloat = 16
    let labelHeight: CGFloat = 18
    let textInputHeight: CGFloat = 32
    let textSize: CGFloat = 14
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "New Request"
        
        // Group Size
        groupLabel = UILabel()
        groupLabel.translatesAutoresizingMaskIntoConstraints = false
        groupLabel.text = "Group Size"
        groupLabel.font = .boldSystemFont(ofSize: labelHeight)
        view.addSubview(groupLabel)
        
        sizeLabel = UILabel()
        sizeLabel.translatesAutoresizingMaskIntoConstraints = false
        sizeLabel.text = "1"
        sizeLabel.font = .systemFont(ofSize: labelHeight)
        view.addSubview(sizeLabel)
        
        stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.stepValue = 1
        stepper.minimumValue = 1
        stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        view.addSubview(stepper)
        
        // TODO - Roles
        //UITableview for roles select
        //CheckBox Input
        
        roleLabel = UILabel()
        roleLabel.translatesAutoresizingMaskIntoConstraints = false
        roleLabel.text = "Roles"
        roleLabel.font = .boldSystemFont(ofSize: labelHeight)
        view.addSubview(roleLabel)
        
        setupConstraints()

    }
    
    @objc func stepperValueChanged(_ sender:UIStepper!){
        sizeLabel.text = String(Int(sender.value))
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            groupLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding*2),
            groupLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding*2),
            groupLabel.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
        
        NSLayoutConstraint.activate([
            sizeLabel.topAnchor.constraint(equalTo: groupLabel.bottomAnchor, constant: padding),
            sizeLabel.leadingAnchor.constraint(equalTo: groupLabel.leadingAnchor),
            sizeLabel.heightAnchor.constraint(equalToConstant: textInputHeight)
            ])
        
        NSLayoutConstraint.activate([
            stepper.topAnchor.constraint(equalTo: sizeLabel.topAnchor),
            stepper.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            stepper.widthAnchor.constraint(equalToConstant: 124),
            stepper.heightAnchor.constraint(equalToConstant: 48)
            ])
        
        NSLayoutConstraint.activate([
            roleLabel.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: padding*2),
            roleLabel.leadingAnchor.constraint(equalTo: groupLabel.leadingAnchor),
            roleLabel.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
    }

}
