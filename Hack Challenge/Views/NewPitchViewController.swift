//
//  NewPitchViewController.swift
//  Hack Challenge
//
//  Created by Pinxuan Huang on 11/24/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit
import Alamofire

class NewPitchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {
    
    var defaults = UserDefaults.standard
    
    var scrollView: UIScrollView!
    
    var titleLabel: UILabel!
    var titleInput: UITextField!
    
    var descrLabel: UILabel!
    var descrInput: UITextField!
    
//    var imageLabel: UILabel!
//    var cameraButton: UIButton!
//    var libButton: UIButton! //library
//    var lineSeparator: UIView!
//    var cameraLabel: UILabel!
//    var libLabel: UILabel!
    
//    var tagLabel: UILabel!
//    var tagInput: UITextField!
    var keywordsLabel: UILabel!
    var keywordsCollectionView: UICollectionView!
    var keywords = [String]()
    var keywordsTextField: UITextField!
    
    let padding: CGFloat = 16
    let labelHeight: CGFloat = 18
    let textInputHeight: CGFloat = 32
    let textSize: CGFloat = 14
    let buttonSize: CGFloat = 50 //72
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "New Pitch"
        
        let backButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem = backButton
        
        let postButton = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(postSubmit))
        navigationItem.rightBarButtonItem = postButton
        
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Title"
        titleLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(titleLabel)
        
        titleInput = UITextField()
        titleInput.translatesAutoresizingMaskIntoConstraints = false
        titleInput.placeholder = "Enter a title here"
        titleInput.font = .systemFont(ofSize: textSize)
        titleInput.borderStyle = .roundedRect
        scrollView.addSubview(titleInput)
        
        descrLabel = UILabel()
        descrLabel.translatesAutoresizingMaskIntoConstraints = false
        descrLabel.text = "Description"
        descrLabel.font = .boldSystemFont(ofSize: labelHeight)
        scrollView.addSubview(descrLabel)
        
        descrInput = UITextField()
        descrInput.translatesAutoresizingMaskIntoConstraints = false
        descrInput.placeholder = "Write your description here"
        descrInput.font = .systemFont(ofSize: textSize)
        descrInput.textAlignment = .left
        descrInput.borderStyle = .roundedRect
        scrollView.addSubview(descrInput)
        
//        imageLabel = UILabel()
//        imageLabel.translatesAutoresizingMaskIntoConstraints = false
//        imageLabel.text = "Images"
//        imageLabel.font = .boldSystemFont(ofSize: labelHeight)
//        scrollView.addSubview(imageLabel)
//
//        lineSeparator = UIView()
//        lineSeparator.translatesAutoresizingMaskIntoConstraints = false
//        lineSeparator.backgroundColor = .lightGray
//        scrollView.addSubview(lineSeparator)
//
//        cameraButton = UIButton()
//        cameraButton.translatesAutoresizingMaskIntoConstraints = false
//        cameraButton.setImage(UIImage(named: "img_cam"), for: .normal)
//        cameraButton.setTitle("Camera", for: .normal)
//        scrollView.addSubview(cameraButton)
//
//        libButton = UIButton()
//        libButton.translatesAutoresizingMaskIntoConstraints = false
//        libButton.setImage(UIImage(named: "img_lib"), for: .normal)
//        libButton.setTitle("Library", for: .normal)
//        scrollView.addSubview(libButton)
//
//        cameraLabel = UILabel()
//        cameraLabel.translatesAutoresizingMaskIntoConstraints = false
//        cameraLabel.text = "Camera"
//        cameraLabel.textAlignment = .center
//        cameraLabel.font = .systemFont(ofSize: textSize)
//        scrollView.addSubview(cameraLabel)
//
//        libLabel = UILabel()
//        libLabel.translatesAutoresizingMaskIntoConstraints = false
//        libLabel.text = "Gallery"
//        libLabel.textAlignment = .center
//        libLabel.font = .systemFont(ofSize: textSize)
//        scrollView.addSubview(libLabel)
        
        keywordsLabel = UILabel()
        keywordsLabel.text = "Keywords"
        keywordsLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        keywordsLabel.textAlignment = .left
        keywordsLabel.textColor = .black
        keywordsLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(keywordsLabel)
        
        var keywordsLayout = UICollectionViewFlowLayout()
        keywordsLayout.scrollDirection = .horizontal
        keywordsLayout.minimumLineSpacing = 4
        keywordsLayout.minimumInteritemSpacing = 4
        keywordsLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        keywordsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: keywordsLayout)
        keywordsCollectionView.delegate = self
        keywordsCollectionView.dataSource = self
        keywordsCollectionView.register(SkillsCollectionViewCell.self, forCellWithReuseIdentifier: "keyword")
        keywordsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        keywordsCollectionView.backgroundColor = .white
        keywordsCollectionView.allowsMultipleSelection = true
        scrollView.addSubview(keywordsCollectionView)
        
        keywordsTextField = UITextField()
        keywordsTextField.placeholder = " ex. freshmen, 2020, internship"
        keywordsTextField.textColor = .gray
        keywordsTextField.font = UIFont.systemFont(ofSize: 15.0)
        keywordsTextField.borderStyle = .roundedRect
        keywordsTextField.delegate = self
        keywordsTextField.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(keywordsTextField)
        
//        tagLabel = UILabel()
//        tagLabel.translatesAutoresizingMaskIntoConstraints = false
//        tagLabel.text = "Add Tags"
//        tagLabel.font = .boldSystemFont(ofSize: labelHeight)
//        scrollView.addSubview(tagLabel)
//
//        tagInput = UITextField()
//        tagInput.translatesAutoresizingMaskIntoConstraints = false
//        tagInput.placeholder = "Separate tags with commas"
//        tagInput.font = .systemFont(ofSize: textSize)
//        tagInput.borderStyle = .roundedRect
//        scrollView.addSubview(tagInput)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: padding*2),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: padding*2)
            ])
        
        NSLayoutConstraint.activate([
            titleInput.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            titleInput.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            titleInput.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding*2),
            titleInput.heightAnchor.constraint(equalToConstant: 32)
            ])
        
        NSLayoutConstraint.activate([
            descrLabel.topAnchor.constraint(equalTo: titleInput.bottomAnchor, constant: padding*2),
            descrLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            descrInput.topAnchor.constraint(equalTo: descrLabel.bottomAnchor, constant: padding),
            descrInput.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descrInput.trailingAnchor.constraint(equalTo: titleInput.trailingAnchor),
            descrInput.heightAnchor.constraint(equalToConstant: 200)
            ])
        
//        NSLayoutConstraint.activate([
//            imageLabel.topAnchor.constraint(equalTo: descrInput.bottomAnchor, constant: padding*2),
//            imageLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
//            ])
//
//        NSLayoutConstraint.activate([
//            lineSeparator.topAnchor.constraint(equalTo: imageLabel.bottomAnchor, constant: padding),
//            lineSeparator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            lineSeparator.widthAnchor.constraint(equalToConstant: 1),
//            lineSeparator.heightAnchor.constraint(equalToConstant: 72)
//            ])
//
//        // Some maths to align buttons
//        let buttonPadding: CGFloat = view.bounds.width/4 - buttonSize/2
//
//        NSLayoutConstraint.activate([
//            cameraButton.topAnchor.constraint(equalTo: imageLabel.bottomAnchor, constant: padding),
//            cameraButton.trailingAnchor.constraint(equalTo: lineSeparator.leadingAnchor, constant: -buttonPadding),
//            cameraButton.widthAnchor.constraint(equalToConstant: buttonSize),
//            cameraButton.heightAnchor.constraint(equalTo: cameraButton.widthAnchor)
//            ])
//
//        NSLayoutConstraint.activate([
//            cameraLabel.topAnchor.constraint(equalTo: cameraButton.bottomAnchor, constant: padding),
//            cameraLabel.centerXAnchor.constraint(equalTo: cameraButton.centerXAnchor)
//            ])
//
//        NSLayoutConstraint.activate([
//            libButton.topAnchor.constraint(equalTo: cameraButton.topAnchor),
//            libButton.leadingAnchor.constraint(equalTo: lineSeparator.trailingAnchor, constant: buttonPadding),
//            libButton.widthAnchor.constraint(equalTo: cameraButton.widthAnchor),
//            libButton.heightAnchor.constraint(equalTo: cameraButton.heightAnchor)
//            ])
//
//        NSLayoutConstraint.activate([
//            libLabel.topAnchor.constraint(equalTo: cameraLabel.topAnchor),
//            libLabel.centerXAnchor.constraint(equalTo: libButton.centerXAnchor)
//            ])
        
        NSLayoutConstraint.activate([
            keywordsLabel.topAnchor.constraint(equalTo: descrInput.bottomAnchor, constant: padding*2),
            keywordsLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            keywordsCollectionView.topAnchor.constraint(equalTo: keywordsLabel.bottomAnchor, constant: padding),
            keywordsCollectionView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            keywordsCollectionView.trailingAnchor.constraint(equalTo: titleInput.trailingAnchor),
            keywordsCollectionView.heightAnchor.constraint(equalToConstant: 25),
            
            keywordsTextField.topAnchor.constraint(equalTo: keywordsCollectionView.bottomAnchor, constant: padding),
            keywordsTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            keywordsTextField.trailingAnchor.constraint(equalTo: titleInput.trailingAnchor),
            keywordsTextField.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -48)
            ])
        
//        NSLayoutConstraint.activate([
//            tagLabel.topAnchor.constraint(equalTo: libLabel.bottomAnchor, constant: padding*2),
//            tagLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
//
//            tagInput.topAnchor.constraint(equalTo: tagLabel.bottomAnchor, constant: padding),
//            tagInput.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
//            tagInput.trailingAnchor.constraint(equalTo: titleInput.trailingAnchor),
//            tagInput.heightAnchor.constraint(equalToConstant: 32),
//            tagInput.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -48)
//            ])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == keywordsTextField {
            keywords.append(textField.text!)
            keywordsCollectionView.reloadData()
            textField.text = ""
            return true
        } else {
            return false
        }
    }
    
    //Functions for role collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return keywords.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == keywordsCollectionView {
            keywords.remove(at: indexPath.row)
            collectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == keywordsCollectionView {
            var cell = keywordsCollectionView.dequeueReusableCell(withReuseIdentifier: "keyword", for: indexPath) as! SkillsCollectionViewCell
            cell.configure(skillName: keywords[indexPath.row])
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == keywordsCollectionView {
            var width = ceil((Double)(keywords[indexPath.row].count) / 10.0 * 75.0 + 10.0)
            return CGSize(width: width, height: 25.0)
        }
        else {
            return CGSize()
        }
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    //Alert Pop-up
    func displayMyAlertMessage(userMessage:String){
        let myAlert = UIAlertController(title: "Oops!", message: userMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    //Function called when form is submitted
    @objc func postSubmit() {
        
        // Alerts user if required fields are empty on submit
        guard let titleText = titleInput.text, !titleText.isEmpty else {
            displayMyAlertMessage(userMessage: "Please input a title.")
            return
        }
        guard let descrText = descrInput.text, !descrText.isEmpty else {
            displayMyAlertMessage(userMessage: "Please fill out the description.")
            return
        }
        
        //token ??
        postToServer(token: 0, title: titleText, text: descrText)
        back()
        //Delegate to another view
        //        delegate?.newPitch(newTitle: titleText, newDescr: descrText)
        //        navigationController?.popViewController(animated: true)
    }
    
    @objc func postToServer(token: Int, title: String, text: String) {
        //fields: *token, *title, *tags, role, *text, kind, course, group_size, skills
        //* required
        let parameters: [String : Any] = [
            "token" : token,
            "title" : title,
            "tags" : keywords.joined(separator: ","),
            "text" : text,
            "kind" : 2
        ]
        
        let urlString = "http://35.190.171.42/api/posts/"
        Alamofire.request(urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { (response) in
            switch response.result {
            case .success:
                print(response)
                
                break
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
