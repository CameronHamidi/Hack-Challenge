//
//  EditProfileViewController.swift
//  Hack Challenge
//
//  Created by Cameron Hamidi on 11/30/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit



class EditProfileViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {

    var newProfile = false
    
    var scrollView: UIScrollView!

    var gradYearTitle: UILabel!
    var gradYearPicker: UIPickerView!

    var majorsTitle: UILabel!
    var majorLabel: UILabel!
    var majorTextField: UITextField!
    var minorLabel: UILabel!
    var minorTextField: UITextField!

    var rolesTitle: UILabel!
    var rolesCollectionView: UICollectionView!
    var roles = ["Developer", "Frontend Developer", "Backend Developer", "iOS Developer", "Embedded Systems Developer", "Designer"]
    var selectedRoles = [String]()
    var rolesTextField: UITextField!

    var coursesTitle: UILabel!
    var coursesCollectionView: UICollectionView!
    var coursesTextField: UITextField!
    var courses = [String]()
    
    var skillsTitle: UILabel!
    var skillsCollectionView: UICollectionView!
    var skillsTextField: UITextField!
    var skills = [String]()

    var years = ["2018", "2019", "2020", "2021", "2022"]
    var semesters = ["Spring", "Fall"]
    
    var hasNavController: Bool?
    
    var blurbLabel: UILabel!
    var blurbTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        view.backgroundColor = .white

        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        gradYearTitle = UILabel()
        gradYearTitle.textColor = .black
        gradYearTitle.text = "Graduation year"
        gradYearTitle.font = UIFont.systemFont(ofSize: 14)
        gradYearTitle.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(gradYearTitle)

        gradYearPicker = UIPickerView()
        gradYearPicker.delegate = self
        gradYearPicker.dataSource = self
        var pickerDefaultIndex: Int? = 0
//        if fileNames.index(of: songItem.imageName) != nil {
//            pickerDefaultIndex = fileNames.index(of: songItem.imageName)
//        }
        gradYearPicker.selectRow(pickerDefaultIndex!, inComponent: 0, animated: true)
        gradYearPicker.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(gradYearPicker)

        majorsTitle = UILabel()
        majorsTitle.text = "Major(s)/Minor(s)"
        majorsTitle.font = UIFont.systemFont(ofSize: 14)
        majorsTitle.textColor = .black
        majorsTitle.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(majorsTitle)

        majorLabel = UILabel()
        majorLabel.text = "Major(s):"
        majorLabel.font = UIFont.systemFont(ofSize: 13)
        majorLabel.textColor = .black
        majorLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(majorLabel)

        majorTextField = UITextField(frame: .zero)
        majorTextField.font = UIFont.systemFont(ofSize: 13.0)
        majorTextField.borderStyle = .roundedRect
        majorTextField.textColor = .gray
        majorTextField.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(majorTextField)

        minorLabel = UILabel()
        minorLabel.text = "Minor(s):"
        minorLabel.font = UIFont.systemFont(ofSize: 13)
        minorLabel.textColor = .black
        minorLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(minorLabel)

        minorTextField = UITextField(frame: .zero)
        minorTextField.font = UIFont.systemFont(ofSize: 13.0)
        minorTextField.borderStyle = .roundedRect
        minorTextField.textColor = .gray
        minorTextField.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(minorTextField)

        rolesTitle = UILabel()
        rolesTitle.text = "Roles"
        rolesTitle.font = UIFont.boldSystemFont(ofSize: 17.0)
        rolesTitle.textAlignment = .left
        rolesTitle.textColor = .black
        rolesTitle.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(rolesTitle)

        var rolesLayout = UICollectionViewFlowLayout()
        rolesLayout.scrollDirection = .vertical
        rolesLayout.minimumLineSpacing = 4
        rolesLayout.minimumInteritemSpacing = 4
        rolesLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        rolesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: rolesLayout)
        rolesCollectionView.delegate = self
        rolesCollectionView.dataSource = self
        rolesCollectionView.register(RolesCollectionViewCell.self, forCellWithReuseIdentifier: "role")
        rolesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        rolesCollectionView.backgroundColor = .white
        rolesCollectionView.allowsMultipleSelection = true
        scrollView.addSubview(rolesCollectionView)

        rolesTextField = UITextField()
        rolesTextField.placeholder = "Enter your own"
        rolesTextField.textColor = .gray
        rolesTextField.font = UIFont.systemFont(ofSize: 15.0)
        rolesTextField.borderStyle = .roundedRect
        rolesTextField.delegate = self
        rolesTextField.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(rolesTextField)

        coursesTitle = UILabel()
        coursesTitle.text = "Courses"
        coursesTitle.font = UIFont.boldSystemFont(ofSize: 17.0)
        coursesTitle.textAlignment = .left
        coursesTitle.textColor = .black
        coursesTitle.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(coursesTitle)
        
        var coursesLayout = UICollectionViewFlowLayout()
        coursesLayout.scrollDirection = .horizontal
        coursesLayout.minimumLineSpacing = 4
        coursesLayout.minimumInteritemSpacing = 4
        coursesLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        //skillsLayout.estimatedItemSize = CGSize(width: 50, height: 25)
        coursesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: coursesLayout)
        coursesCollectionView.delegate = self
        coursesCollectionView.dataSource = self
        coursesCollectionView.register(SkillsCollectionViewCell.self, forCellWithReuseIdentifier: "course")
        coursesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(coursesCollectionView)
        coursesCollectionView.backgroundColor = .white

        coursesTextField = UITextField()
        coursesTextField.placeholder = " ex. CS 2110"
        coursesTextField.textColor = .black
        coursesTextField.font = UIFont.systemFont(ofSize: 15.0)
        coursesTextField.borderStyle = .roundedRect
        coursesTextField.textColor = .gray
        coursesTextField.delegate = self
        coursesTextField.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(coursesTextField)
        
        skillsTitle = UILabel()
        skillsTitle.text = "Skills"
        skillsTitle.font = UIFont.boldSystemFont(ofSize: 17.0)
        skillsTitle.textAlignment = .left
        skillsTitle.textColor = .black
        skillsTitle.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(skillsTitle)
        
        skillsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: coursesLayout)
        skillsCollectionView.delegate = self
        skillsCollectionView.dataSource = self
        skillsCollectionView.register(SkillsCollectionViewCell.self, forCellWithReuseIdentifier: "skill")
        skillsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        skillsCollectionView.backgroundColor = .white
        scrollView.addSubview(skillsCollectionView)
        
        skillsTextField = UITextField()
        skillsTextField.placeholder = " ex Java, C++, Python"
        skillsTextField.textColor = .gray
        skillsTextField.font = UIFont.systemFont(ofSize: 15.0)
        skillsTextField.borderStyle = .roundedRect
        skillsTextField.delegate = self
        skillsTextField.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(skillsTextField)
        
        blurbLabel = UILabel()
        blurbLabel.text = "Blurb"
        blurbLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        blurbLabel.textAlignment = .left
        blurbLabel.textColor = .black
        blurbLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(blurbLabel)
        
        blurbTextView = UITextView()
        blurbTextView.textColor = .black
        blurbTextView.font = UIFont.systemFont(ofSize: 14)
        blurbTextView.translatesAutoresizingMaskIntoConstraints = false
        blurbTextView.layer.borderWidth = 1
        scrollView.addSubview(blurbTextView)
        
        setupConstraints()
        
        var backButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(close))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func close() {
        navigationController?.popViewController(animated: true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == skillsTextField {
            skills.append("X " + textField.text!)
            skillsCollectionView.reloadData()
            textField.text = ""
            return true
        } else if textField == rolesTextField {
            roles.append(textField.text!)
            rolesCollectionView.reloadData()
            textField.text = ""
            return true
        } else if textField == coursesTextField {
            courses.append("X " + textField.text!)
            coursesCollectionView.reloadData()
            textField.text = ""
            return true
        } else {
            return false
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == skillsCollectionView {
            return skills.count
        } else if collectionView == rolesCollectionView {
            return roles.count
        } else if collectionView == coursesCollectionView {
            print(courses.count)
            return courses.count
        } else {
            return 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == skillsCollectionView {
            skills.remove(at: indexPath.row)
            collectionView.reloadData()
        } else if collectionView == rolesCollectionView {
            if selectedRoles.count == 0 || !selectedRoles.contains(roles[indexPath.row]) {
                selectedRoles.append(roles[indexPath.row])
            } else {
                for i in 0..<selectedRoles.count {
                    if selectedRoles[i] == roles[indexPath.row] {
                        selectedRoles.remove(at: i)
                        break
                    }
                }
            }
        } else if collectionView == coursesCollectionView {
            courses.remove(at: indexPath.row)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.skillsCollectionView {
            var cell = skillsCollectionView.dequeueReusableCell(withReuseIdentifier: "skill", for: indexPath) as! SkillsCollectionViewCell
            cell.configure(skillName: skills[indexPath.row])
            return cell
        } else if collectionView == rolesCollectionView {
            var cell = rolesCollectionView.dequeueReusableCell(withReuseIdentifier: "role", for: indexPath) as! RolesCollectionViewCell
            cell.configure(roleName: roles[indexPath.row])
            return cell
        } else if collectionView == coursesCollectionView {
            var cell = coursesCollectionView.dequeueReusableCell(withReuseIdentifier: "course", for: indexPath) as! SkillsCollectionViewCell
            cell.configure(skillName: courses[indexPath.row])
            print(indexPath.row)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.skillsCollectionView {
            print("test: \(collectionView == skillsCollectionView)")
            var width = ceil((Double)(skills[indexPath.row].count) / 10.0 * 75.0 + 10.0)
            print(width)
            return CGSize(width: width, height: 25.0)
        } else if collectionView == rolesCollectionView {
            var width = collectionView.frame.width
            var height = CGFloat(integerLiteral: 25)
            return CGSize(width: width, height: height)
        } else if collectionView == coursesCollectionView {
            print("size")
            var width = ceil((Double)(courses[indexPath.row].count) / 10.0 * 75.0 + 10.0)
            return CGSize(width: width, height: 25.0)
        } else {
            return CGSize()
        }
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return semesters.count
        } else {
            return years.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
        if component == 0 {
            return semesters[component]
        } else {
            return years[component]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        imageTextField.text = fileNames[row]
//        print("select")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            gradYearTitle.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            gradYearTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            gradYearTitle.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            
            gradYearPicker.topAnchor.constraint(equalTo: gradYearTitle.bottomAnchor, constant: 10),
            gradYearPicker.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            gradYearPicker.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            gradYearPicker.heightAnchor.constraint(equalToConstant: 150)
            ])
            
        NSLayoutConstraint.activate([
            majorsTitle.topAnchor.constraint(equalTo: gradYearPicker.bottomAnchor, constant: 15),
            majorsTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            majorsTitle.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            
            majorLabel.topAnchor.constraint(equalTo: majorsTitle.bottomAnchor, constant: 10),
            majorLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            majorLabel.widthAnchor.constraint(equalToConstant: 85),
            
            majorTextField.centerYAnchor.constraint(equalTo: majorLabel.centerYAnchor),
            majorTextField.leadingAnchor.constraint(equalTo: majorLabel.trailingAnchor, constant: 7),
            majorTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -25),
            
            minorLabel.topAnchor.constraint(equalTo: majorTextField.bottomAnchor, constant: 10),
            minorLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            
            minorTextField.centerYAnchor.constraint(equalTo: minorLabel.centerYAnchor),
            minorTextField.leadingAnchor.constraint(equalTo: minorLabel.trailingAnchor, constant: 7),
            minorTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -25),
            minorTextField.leadingAnchor.constraint(equalTo: majorTextField.leadingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            rolesTitle.topAnchor.constraint(equalTo: minorTextField.bottomAnchor, constant: 25),
            rolesTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            rolesTitle.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            
            rolesCollectionView.topAnchor.constraint(equalTo: rolesTitle.bottomAnchor, constant: 5),
            rolesCollectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            rolesCollectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            rolesCollectionView.heightAnchor.constraint(equalToConstant: 200),
            
            rolesTextField.topAnchor.constraint(equalTo: rolesCollectionView.bottomAnchor, constant: 5),
            rolesTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            rolesTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            
            coursesTitle.topAnchor.constraint(equalTo: rolesTextField.bottomAnchor, constant: 25),
            coursesTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            coursesTitle.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            
            coursesCollectionView.topAnchor.constraint(equalTo: coursesTitle.bottomAnchor, constant: 5),
            coursesCollectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            coursesCollectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            coursesCollectionView.heightAnchor.constraint(equalToConstant: 25),
            
            coursesTextField.topAnchor.constraint(equalTo: coursesCollectionView.bottomAnchor, constant: 5),
            coursesTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            coursesTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            
            skillsTitle.topAnchor.constraint(equalTo: coursesTextField.bottomAnchor, constant: 25),
            skillsTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            skillsTitle.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            
            skillsCollectionView.topAnchor.constraint(equalTo: skillsTitle.bottomAnchor, constant: 5),
            skillsCollectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            skillsCollectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            skillsCollectionView.heightAnchor.constraint(equalToConstant: 25),
            
            skillsTextField.topAnchor.constraint(equalTo: skillsCollectionView.bottomAnchor, constant: 5),
            skillsTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            skillsTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
//            skillsTextField.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            
            blurbLabel.topAnchor.constraint(equalTo: skillsTextField.bottomAnchor, constant: 25),
            blurbLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            blurbLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            
            blurbTextView.topAnchor.constraint(equalTo: blurbLabel.bottomAnchor, constant: 5),
            blurbTextView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            blurbTextView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -15),
            blurbTextView.heightAnchor.constraint(equalToConstant: 150),
            blurbTextView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -25)
        ])
    }

}
