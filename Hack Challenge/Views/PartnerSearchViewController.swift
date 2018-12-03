//
//  PitchSearchViewController.swift
//  Hack Challenge
//
//  Created by Cameron Hamidi on 12/1/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit

class PartnerSearchViewController: UIViewController {

    var mainLabel: UILabel!
    var pitchesButton: UIButton!
    var profilesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        var closeButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(close))
        navigationItem.leftBarButtonItem = closeButton
        
        mainLabel = UILabel()
        mainLabel.text = "Find a partner by"
        mainLabel.font = UIFont.systemFont(ofSize: 17)
        mainLabel.textColor = .black
        mainLabel.textAlignment = .center
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainLabel)
        
        pitchesButton = UIButton()
        pitchesButton.setImage(UIImage(named: "pitchWhite"), for: .normal)
        pitchesButton.setTitle("  Filter Pitches", for: .normal)
        pitchesButton.setTitleColor(.white, for: .normal)
        pitchesButton.titleLabel!.font = UIFont.systemFont(ofSize: 17)
        pitchesButton.translatesAutoresizingMaskIntoConstraints = false
        pitchesButton.backgroundColor = .black
        pitchesButton.addTarget(self, action: #selector(showPitchesView), for: .touchUpInside)
        view.addSubview(pitchesButton)
        
        profilesButton = UIButton()
        profilesButton.setImage(UIImage(named: "idCardWhite"), for: .normal)
        profilesButton.setTitle("  Filter Profiles", for: .normal)
        profilesButton.setTitleColor(.white, for: .normal)
        profilesButton.titleLabel!.font = UIFont.systemFont(ofSize: 17)
        profilesButton.backgroundColor = .black
        profilesButton.translatesAutoresizingMaskIntoConstraints = false
        profilesButton.addTarget(self, action: #selector(showProfilesView), for: .touchUpInside)
        view.addSubview(profilesButton)
        
        setupConstraints()
    }
    
    @objc func close() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            pitchesButton.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 15),
            pitchesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pitchesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pitchesButton.heightAnchor.constraint(equalToConstant: 50),
            
            profilesButton.topAnchor.constraint(equalTo: pitchesButton.bottomAnchor, constant: 15),
            profilesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            profilesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            profilesButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    @objc func showPitchesView() {
        navigationController?.pushViewController(PitchSearchViewController(), animated: true)
    }
    
    @objc func showProfilesView() {
//        navigationController?.pushViewController(ProfileSearchViewController(), animated: true)
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
