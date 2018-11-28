//
//  ProfileViewController.swift
//  Hack Challenge
//
//  Created by Pinxuan Huang on 11/23/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var avatar: UIImageView! //user's picture
    var caption: UILabel! //major, minor, or any one-line intro user wants to display
    var name: UILabel! //user's name
    
    
    var lineSeparator: UIView!
    var roleSubLabel: UILabel! //Primary Role
    var roleLabel: UILabel!
    var netSubLabel: UILabel! //Cornell Net ID
    var netLabel: UILabel!
    
    var postsTableView: UITableView!
    var postsArray: [Post] = [Post]()
//    var tableview: UITableView!
    
    var segControl: UISegmentedControl!
//    var containerView: UIView!
    var aboutContainer: UIView!
    var projectsContainer: UIView!
    var postsContainer: UIView!
//    var segmentedControlContainer: UIView!
    
    let avatarSize: CGFloat = 64
    let padding: CGFloat = 14
    let subTextSize: CGFloat = 14
    let normTextSize: CGFloat = 18
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Profile"
        
        // TODO - revamp to get profile info from backend
        avatar = UIImageView()
//        let avatar = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        avatar.translatesAutoresizingMaskIntoConstraints = false
//        avatar.layer.borderWidth = 1
//        avatar.layer.masksToBounds = false
        avatar.backgroundColor = .gray
        avatar.layer.cornerRadius = avatarSize/2
        avatar.clipsToBounds = true
        view.addSubview(avatar)
        
        caption = UILabel()
        caption.translatesAutoresizingMaskIntoConstraints = false
        caption.text = "A generalization to all"
        caption.textAlignment = .center
        caption.font = .systemFont(ofSize: subTextSize)
        view.addSubview(caption)
        
        name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "John Doe"
        name.font = .boldSystemFont(ofSize: 26)
        //        name.textAlignment = .right
        view.addSubview(name)
        
        lineSeparator = UIView()
        lineSeparator.translatesAutoresizingMaskIntoConstraints = false
        lineSeparator.backgroundColor = .lightGray
        view.addSubview(lineSeparator)
        
        roleSubLabel = UILabel()
        roleSubLabel.translatesAutoresizingMaskIntoConstraints = false
        roleSubLabel.text = "Primary Role"
        roleSubLabel.font = .systemFont(ofSize: subTextSize)
        roleSubLabel.textColor = .gray
        view.addSubview(roleSubLabel)
        
        roleLabel = UILabel()
        roleLabel.translatesAutoresizingMaskIntoConstraints = false
        roleLabel.text = "Architect"
        roleLabel.font = .systemFont(ofSize: normTextSize)
        view.addSubview(roleLabel)
        
        netSubLabel = UILabel()
        netSubLabel.translatesAutoresizingMaskIntoConstraints = false
        netSubLabel.text = "Net ID"
        netSubLabel.font = .systemFont(ofSize: subTextSize)
        netSubLabel.textColor = .gray
        view.addSubview(netSubLabel)
        
        netLabel = UILabel()
        netLabel.translatesAutoresizingMaskIntoConstraints = false
        netLabel.text = "jd123"
        netLabel.font = .systemFont(ofSize: normTextSize)
        view.addSubview(netLabel)
        
        segControl = UISegmentedControl(items: ["About", "Projects", "Posts"])
        segControl.translatesAutoresizingMaskIntoConstraints = false
//        control.addTarget(self, action: #selector(sortList), for: .valueChanged)
        segControl.addTarget(self, action: #selector(self.showComponents(sender:)), for: .valueChanged)
        segControl.backgroundColor = .white
        view.addSubview(segControl)
        
        // add container
//        containerView = UIView()
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(containerView)
//
//        let controller = storyboard!.instantiateViewController(withIdentifier: "Second")
//        addChild(controller)
//        controller.view.translatesAutoresizingMaskIntoConstraints = false
//        containerView.addSubview(controller.view)
//
//        controller.didMove(toParent: self)
        
        //Segmented subviews
        aboutContainer = UIView()
        aboutContainer.translatesAutoresizingMaskIntoConstraints = false
        aboutContainer.backgroundColor = .red
        view.addSubview(aboutContainer)

        projectsContainer = UIView()
        projectsContainer.translatesAutoresizingMaskIntoConstraints = false
        projectsContainer.backgroundColor = .green
        projectsContainer.alpha = 0
        view.addSubview(projectsContainer)

        postsContainer = UIView()
        postsContainer.translatesAutoresizingMaskIntoConstraints = false
        postsContainer.backgroundColor = .blue
        postsContainer.alpha = 0
        view.addSubview(postsContainer)
        
        //Hardcoded data TODO - get posts info from backend
        createPosts()
        
        //Set up and add tableViews to their respective container views
        postsTableView = UITableView()
        postsTableView.translatesAutoresizingMaskIntoConstraints = false
        postsTableView.register(PostCell.self, forCellReuseIdentifier: "postCellID")
        postsTableView.backgroundColor = .white
//        postsTableView.separatorStyle = .none
        postsTableView.estimatedRowHeight = 200
        postsTableView.rowHeight = UITableView.automaticDimension
        postsTableView.delegate = self
        postsTableView.dataSource = self
        postsContainer.addSubview(postsTableView)
        
        //testing out a tableview with dynamic height
//        tableview = UITableView()
//        tableview.translatesAutoresizingMaskIntoConstraints = false
//        tableview.estimatedRowHeight = 100
//        tableview.rowHeight = UITableView.automaticDimension
//        tableview.register(PostCell.self, forCellReuseIdentifier: "postCellID")
//        aboutContainer.addSubview(tableview) //for testing purposes
        
//        segmentedControlContainer = UIView()
//        segmentedControlContainer.backgroundColor = UIColor.white
//        view.addSubview(segmentedControlContainer)
//        self.segmentedControlContainer = segmentedControlContainer
        
        setupConstraints()
//        NSLayoutConstraint.activate([
//            controller.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
//            controller.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
//            controller.view.topAnchor.constraint(equalTo: containerView.topAnchor),
//            controller.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
//            ])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            avatar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            avatar.heightAnchor.constraint(equalToConstant: avatarSize),
            avatar.widthAnchor.constraint(equalToConstant: avatarSize)
            ])
        
        NSLayoutConstraint.activate([
            caption.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            caption.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 12),
            caption.widthAnchor.constraint(equalToConstant: view.bounds.width/2)
            ])
        
        NSLayoutConstraint.activate([
            name.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            name.topAnchor.constraint(equalTo: caption.bottomAnchor, constant: padding)
            ])
        
        NSLayoutConstraint.activate([
            lineSeparator.topAnchor.constraint(equalTo: name.bottomAnchor, constant: padding*2),
            lineSeparator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lineSeparator.widthAnchor.constraint(equalToConstant: 1),
            lineSeparator.heightAnchor.constraint(equalToConstant: 52)
            ])
        
        // Some maths to align labels on either side of line separator
        let coor: CGFloat = view.bounds.width/4
        
        NSLayoutConstraint.activate([
            roleSubLabel.topAnchor.constraint(equalTo: lineSeparator.topAnchor),
            roleSubLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -coor)
            ])
        
        NSLayoutConstraint.activate([
            roleLabel.topAnchor.constraint(equalTo: roleSubLabel.bottomAnchor, constant: padding/2),
            roleLabel.centerXAnchor.constraint(equalTo: roleSubLabel.centerXAnchor)
            ])
        
        NSLayoutConstraint.activate([
            netSubLabel.topAnchor.constraint(equalTo: lineSeparator.topAnchor),
            netSubLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: coor)
            ])
        
        NSLayoutConstraint.activate([
            netLabel.topAnchor.constraint(equalTo: netSubLabel.bottomAnchor, constant: padding/2),
            netLabel.centerXAnchor.constraint(equalTo: netSubLabel.centerXAnchor)
            ])
        
        
        NSLayoutConstraint.activate([
            segControl.topAnchor.constraint(equalTo: lineSeparator.bottomAnchor, constant: padding*2),
            segControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            segControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            segControl.heightAnchor.constraint(equalToConstant: 32)
            ])
        
//        NSLayoutConstraint.activate([
//            containerView.topAnchor.constraint(equalTo: segControl.bottomAnchor, constant: padding),
//            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
//            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
//            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
//            ])
        
//        NSLayoutConstraint.activate([
//            segmentedControlContainer.topAnchor.constraint(equalTo: control.bottomAnchor, constant: padding),
//            segmentedControlContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
//            segmentedControlContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
//            segmentedControlContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
//            ])
        
        NSLayoutConstraint.activate([
            aboutContainer.topAnchor.constraint(equalTo: segControl.bottomAnchor, constant: padding),
            aboutContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            aboutContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            aboutContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
            ])

        NSLayoutConstraint.activate([
            projectsContainer.topAnchor.constraint(equalTo: segControl.bottomAnchor, constant: padding),
            projectsContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            projectsContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            projectsContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
            ])

        NSLayoutConstraint.activate([
            postsContainer.topAnchor.constraint(equalTo: segControl.bottomAnchor, constant: padding),
            postsContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            postsContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            postsContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
            ])
        
        NSLayoutConstraint.activate([
            postsTableView.topAnchor.constraint(equalTo: aboutContainer.topAnchor),
            postsTableView.leadingAnchor.constraint(equalTo: aboutContainer.leadingAnchor),
            postsTableView.trailingAnchor.constraint(equalTo: aboutContainer.trailingAnchor),
            postsTableView.bottomAnchor.constraint(equalTo: aboutContainer.bottomAnchor)
            ])
        
//        NSLayoutConstraint.activate([
//            tableview.topAnchor.constraint(equalTo: aboutContainer.topAnchor),
//            tableview.leadingAnchor.constraint(equalTo: aboutContainer.leadingAnchor),
//            tableview.trailingAnchor.constraint(equalTo: aboutContainer.trailingAnchor),
//            tableview.bottomAnchor.constraint(equalTo: aboutContainer.bottomAnchor)
//            ])
    }
    
    func createPosts() {
        let newPost = Post(icon: UIImage(named: "icon_placeholder")!, name: "Name here", date: "Nov 25", title: "Title here", blurb: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pulvinar gravida justo at massa nunc...")
        let ezraCornell = Post(icon: UIImage(named: "icon_placeholder")!, name: "Extra Cornell", date: "A.D 1865", title: "Any Person Any Goals", blurb: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pulvinar gravida justo at massa nunc...")
        let vanillaIcecream = Post(icon: UIImage(named: "icon_placeholder")!, name: "FoodWiki", date: "2h", title: "Ice cream, vanilla facts and history - testing if this title will wrap", blurb: "Vanilla is frequently used to flavor ice cream, especially in North America and Europe. Vanilla ice cream, like other flavors of ice cream, was originally created by cooling a mixture made of cream, sugar...")
        let test = Post(icon: UIImage(named: "icon_placeholder")!, name: "test", date: "Nov 27", title: "Title here", blurb: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pulvinar gravida justo at massa nunc...")
        
        postsArray = [newPost, ezraCornell, vanillaIcecream, test]
    }
    
    // MARK: - TABLEVIEW METHODS
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCellID", for: indexPath) as! PostCell
        let post = postsArray[indexPath.row]
        cell.configure(for: post)
//        cell.backgroundColor = .white
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsArray.count
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Toggles between the segmented views (about, projects, posts)
    @IBAction func showComponents(sender: AnyObject) {
        if(sender.selectedSegmentIndex == 0) {
            UIView.animate(withDuration: 0.5, animations: {
                self.aboutContainer.alpha = 1
                self.projectsContainer.alpha = 0
                self.postsContainer.alpha = 0
                })
        }
        else if(sender.selectedSegmentIndex == 1) {
            UIView.animate(withDuration: 0.5, animations: {
                self.aboutContainer.alpha = 0
                self.projectsContainer.alpha = 1
                self.postsContainer.alpha = 0
            })
        }
        else {
            UIView.animate(withDuration: 0.5, animations: {
                self.aboutContainer.alpha = 0
                self.projectsContainer.alpha = 0
                self.postsContainer.alpha = 1
            })
        }
    }
}
