//
//  ProfileViewController.swift
//  Hack Challenge
//
//  Created by Pinxuan Huang on 11/23/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit
import Alamofire

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var scrollView: UIScrollView!
    var defaults = UserDefaults.standard
    
    var avatar: UIImageView! //user's picture
    var caption: UILabel! //major, minor, or any one-line intro user wants to display
    var name: UILabel! //user's name
    
    
    var lineSeparator: UIView!
    var roleSubLabel: UILabel! //Primary Role
    var roleLabel: UILabel!
    var netSubLabel: UILabel! //Cornell Net ID
    var netLabel: UILabel!
    var roleIcon: UIImageView!
    var netIcon: UIImageView!
    
    var activeLabel: UILabel!
    
    var infoViewsTableView: UITableView!
    var infoViews = ["About", "Posts", "Projects"]
    
    var logoutButton: UIButton!
    
    //    var lineSeparator2: UIView!
    //    var majorsSubLabel: UILabel! //Primary Role
    //    var majorsLabel: UILabel!
    //    var netSubLabel: UILabel! //Cornell Net ID
    //    var netLabel: UILabel!
    //    var roleIcon: UIImageView!
    //    var netIcon: UIImageView!
    
    var postsTableView: UITableView!
    var postsArray: [Post] = [Post]()
    //    var tableview: UITableView!
    
    var segControl: UISegmentedControl!
    //    var containerView: UIView!
    var aboutContainer: UIView!
    var projectsContainer: UIView!
    var postsContainer: UIView!
    //    var segmentedControlContainer: UIView!
    
    var aboutOpenConstraint: NSLayoutConstraint!
    var aboutClosedConstraint: NSLayoutConstraint!
    
    var projectsOpenConstraint: NSLayoutConstraint!
    var projectsClosedConstraint: NSLayoutConstraint!
    
    var postsOpenConstraint: NSLayoutConstraint!
    var postsClosedConstraint: NSLayoutConstraint!
    
    var contactCollectionView: UICollectionView!
    
    var majorIcon: UIImageView!
    var majorTitleLabel: UILabel!
    var majorLabel: UILabel!
    var minorLabel: UILabel!
    
    var gradIcon: UIImageView!
    var gradTitle: UILabel!
    var gradYear: UILabel!
    
    var lineSeparator2: UIView!
    
    var skillsButton: UIButton!
    
    var skills = ["Java", "Python", "C++", "JavaScript", "iOS", "Android"]
    var skillsCollectionView: UICollectionView!
    var skillsCollectionViewOpenConstraint: NSLayoutConstraint!
    var skillsCollectionViewClosedConstraint: NSLayoutConstraint!
    var skillsCollectionViewOpen = false
    
    var descriptionView: UITextView!
    
    let avatarSize: CGFloat = 64
    let padding: CGFloat = 14
    let subTextSize: CGFloat = 14
    let normTextSize: CGFloat = 18
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView = UIScrollView(frame: .zero)
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let backButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem = backButton
        
        view.backgroundColor = .white
        title = "Profile"
        
        // TODO - revamp to get profile info from backend
        avatar = UIImageView()
        avatar.translatesAutoresizingMaskIntoConstraints = false
        //        avatar.layer.borderWidth = 1
        //        avatar.layer.masksToBounds = false
        avatar.image = UIImage(named: "img_profileicon")
        avatar.backgroundColor = .gray
        avatar.layer.cornerRadius = avatarSize/2
        avatar.clipsToBounds = true
        scrollView.addSubview(avatar)
        
        caption = UILabel()
        caption.translatesAutoresizingMaskIntoConstraints = false
        caption.text = "A generalization to all"
        caption.textAlignment = .center
        caption.textColor = .lightGray
        caption.font = .systemFont(ofSize: subTextSize)
        scrollView.addSubview(caption)
        
        name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "John Doe"
        name.font = .boldSystemFont(ofSize: 26)
        name.textAlignment = .center
        scrollView.addSubview(name)
        
        activeLabel = UILabel()
        activeLabel.backgroundColor = UIColor(displayP3Red: 126/255, green: 211/255, blue: 33/255, alpha: 1.0)
        activeLabel.text = "  Active  "
        activeLabel.textColor = .white
        activeLabel.layer.cornerRadius = 7.5
        activeLabel.layer.masksToBounds = true
        activeLabel.font = UIFont.systemFont(ofSize: 14)
        activeLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(activeLabel)
        
        lineSeparator = UIView()
        lineSeparator.translatesAutoresizingMaskIntoConstraints = false
        lineSeparator.backgroundColor = .lightGray
        scrollView.addSubview(lineSeparator)
        
        roleSubLabel = UILabel()
        roleSubLabel.translatesAutoresizingMaskIntoConstraints = false
        roleSubLabel.text = "Primary Role"
        roleSubLabel.font = .systemFont(ofSize: subTextSize)
        roleSubLabel.textColor = .gray
        scrollView.addSubview(roleSubLabel)
        
        roleLabel = UILabel()
        roleLabel.translatesAutoresizingMaskIntoConstraints = false
        roleLabel.text = "Architect"
        roleLabel.font = .systemFont(ofSize: normTextSize)
        scrollView.addSubview(roleLabel)
        
        roleIcon = UIImageView()
        roleIcon.translatesAutoresizingMaskIntoConstraints = false
        roleIcon.image = UIImage(named: "star")
        scrollView.addSubview(roleIcon)
        
        netSubLabel = UILabel()
        netSubLabel.translatesAutoresizingMaskIntoConstraints = false
        netSubLabel.text = "Net ID"
        netSubLabel.font = .systemFont(ofSize: subTextSize)
        netSubLabel.textColor = .gray
        scrollView.addSubview(netSubLabel)
        
        netLabel = UILabel()
        netLabel.translatesAutoresizingMaskIntoConstraints = false
        netLabel.text = "jd123"
        netLabel.font = .systemFont(ofSize: normTextSize)
        scrollView.addSubview(netLabel)
        
        netIcon = UIImageView()
        netIcon.image = UIImage(named: "netid")
        netIcon.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(netIcon)
        
        let contactLayout = UICollectionViewFlowLayout()
        contactLayout.minimumInteritemSpacing = 16
        contactLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        contactLayout.scrollDirection = .horizontal
        contactCollectionView = UICollectionView(frame: .zero, collectionViewLayout: contactLayout)
        contactCollectionView.delegate = self
        contactCollectionView.dataSource = self
        contactCollectionView.register(ContactCollectionViewCell.self, forCellWithReuseIdentifier: "contact")
        //        contactCollectionView.backgroundColor = UIColor(displayP3Red: 241, green: 241, blue: 241, alpha: 1.0)
        contactCollectionView.backgroundColor = UIColor(displayP3Red: 241/255, green: 241/255, blue: 241/255, alpha: 1.0)
        contactCollectionView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contactCollectionView)
        
        infoViewsTableView = UITableView()
        infoViewsTableView.dataSource = self
        infoViewsTableView.delegate = self
        infoViewsTableView.register(InfoViewsTableViewCell.self, forCellReuseIdentifier: "infoView")
        infoViewsTableView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(infoViewsTableView)
        
        logoutButton = UIButton()
        logoutButton.setTitle("Log Out", for: .normal)
        logoutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        logoutButton.setTitleColor(.white, for: .normal)
        logoutButton.backgroundColor = UIColor(displayP3Red: 1.0, green: 109/255, blue: 109/255, alpha: 1.0)
        logoutButton.layer.cornerRadius = 5
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(logoutButton)
        
        setupConstraints()
    }
    
    //TODO - wip
    static func getUserInfo(completion: @escaping (Bool) -> Void) {
        Alamofire.request("http://35.190.171.42/api/users/self)").validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
//                    guard let blurb = json["blurb"] as? String else {
//                        return
//                    }
                    self.name.text =
                    self.caption.text =
                    self.roleLabel.text =
                    self.netLabel.text =
                }
                let jsonDecoder = JSONDecoder()
            //TODO - set fields/labels to match user's info
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    @objc func openCloseSkillsView() {
        print("button")
        if skillsCollectionViewOpen {
            skillsCollectionViewOpen = false
            NSLayoutConstraint.deactivate([skillsCollectionViewOpenConstraint])
            NSLayoutConstraint.activate([skillsCollectionViewClosedConstraint])
        } else {
            print("was closed")
            skillsCollectionViewOpen = true
            NSLayoutConstraint.deactivate([skillsCollectionViewClosedConstraint])
            NSLayoutConstraint.activate([skillsCollectionViewOpenConstraint])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == contactCollectionView  {
            return 2
        } else if collectionView == skillsCollectionView {
            return skills.count
        } else {
            return 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == contactCollectionView {
            var cell = contactCollectionView.dequeueReusableCell(withReuseIdentifier: "contact", for: indexPath) as! ContactCollectionViewCell
            if indexPath.row == 0 {
                cell.label.text = "949 887 8055"
                cell.contactType = .phone
            } else {
                cell.label.text = "cah376@cornell.edu"
                cell.contactType = .email
            }
            cell.setNeedsUpdateConstraints()
            return cell
        } else if collectionView == skillsCollectionView {
            print("skil cell")
            print(skills[indexPath.row])
            var cell = skillsCollectionView.dequeueReusableCell(withReuseIdentifier: "skill", for: indexPath) as! SkillsCollectionViewCell
            cell.configure(skillName: skills[indexPath.row])
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == contactCollectionView {
            var cell = contactCollectionView.cellForItem(at: indexPath) as! ContactCollectionViewCell
            cell.performContact()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == contactCollectionView {
            if indexPath.row == 0 {
                var width = ceil((Double)("949 887 8055".count) / 10.0 * 75.0 + 10.0)
                return CGSize(width: width, height: 15)
            } else {
                var width = ceil((Double)("cah376@cornell.edu".count) / 10.0 * 75.0 + 10.0)
                return CGSize(width: width, height: 15)
            }
        } else if collectionView == skillsCollectionView {
            var width = ceil((Double)(skills[indexPath.row].count) / 10.0 * 75.0 + 10.0)
            print(width)
            return CGSize(width: width, height: 25.0)
        } else {
            return CGSize(width: 0, height: 0)
        }
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            avatar.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            avatar.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 32),
            avatar.heightAnchor.constraint(equalToConstant: avatarSize),
            avatar.widthAnchor.constraint(equalToConstant: avatarSize)
            ])
        
        NSLayoutConstraint.activate([
            name.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            name.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: padding / 2.0),
            name.widthAnchor.constraint(equalToConstant: view.frame.width - (2.0 * 5.0)),
            name.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -5)
            ])
        
        NSLayoutConstraint.activate([
            activeLabel.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            activeLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            activeLabel.heightAnchor.constraint(equalToConstant: 24)
            ])
        
        NSLayoutConstraint.activate([
            lineSeparator.topAnchor.constraint(equalTo: activeLabel.bottomAnchor, constant: padding),
            lineSeparator.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            lineSeparator.widthAnchor.constraint(equalToConstant: 1),
            lineSeparator.heightAnchor.constraint(equalToConstant: 52)
            ])
        
        // Some maths to align labels on either side of line separator
        //        let coor: CGFloat = view.bounds.width/4
        
        NSLayoutConstraint.activate([
            roleSubLabel.topAnchor.constraint(equalTo: lineSeparator.topAnchor),
            roleSubLabel.trailingAnchor.constraint(equalTo: lineSeparator.leadingAnchor, constant: -32)
            //roleSubLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -coor)
            //            roleSubLabel.centerYAnchor.constraint(equalTo: roleIcon.centerYAnchor),
            //            roleSubLabel.leadingAnchor.constraint(equalTo: roleIcon.trailingAnchor, constant: 10)
            ])
        
        NSLayoutConstraint.activate([
            roleIcon.topAnchor.constraint(equalTo: roleSubLabel.topAnchor),
            roleIcon.heightAnchor.constraint(equalToConstant: 19*2),
            roleIcon.widthAnchor.constraint(equalToConstant: 20*2),
            //            roleIcon.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10)
            roleIcon.trailingAnchor.constraint(equalTo: roleSubLabel.leadingAnchor, constant: -10)
            ])
        
        NSLayoutConstraint.activate([
            roleLabel.topAnchor.constraint(equalTo: roleSubLabel.bottomAnchor, constant: padding/2),
            //roleLabel.centerXAnchor.constraint(equalTo: roleSubLabel.centerXAnchor)
            roleLabel.leadingAnchor.constraint(equalTo: roleSubLabel.leadingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            netIcon.topAnchor.constraint(equalTo: roleSubLabel.topAnchor),
            netIcon.heightAnchor.constraint(equalToConstant: 19*2),
            netIcon.widthAnchor.constraint(equalToConstant: 26*2),
            netIcon.leadingAnchor.constraint(equalTo: lineSeparator.trailingAnchor, constant: 32)
            ])
        
        NSLayoutConstraint.activate([
            netSubLabel.topAnchor.constraint(equalTo: lineSeparator.topAnchor),
            netSubLabel.leadingAnchor.constraint(equalTo: netIcon.trailingAnchor, constant: 10)
            //netSubLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: coor)
            //            netSubLabel.leadingAnchor.constraint(equalTo: netIcon.trailingAnchor, constant: 10),
            //            netSubLabel.centerYAnchor.constraint(equalTo: netIcon.centerYAnchor)
            ])
        
        NSLayoutConstraint.activate([
            netLabel.topAnchor.constraint(equalTo: netSubLabel.bottomAnchor, constant: padding/2),
            //            netLabel.centerXAnchor.constraint(equalTo: netSubLabel.centerXAnchor)
            netLabel.leadingAnchor.constraint(equalTo: netSubLabel.leadingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            //            caption.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            caption.topAnchor.constraint(equalTo: lineSeparator.bottomAnchor, constant: padding*2),
            caption.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            caption.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20)
            ])
        
        NSLayoutConstraint.activate([
            contactCollectionView.topAnchor.constraint(equalTo: caption.bottomAnchor, constant: padding),
            contactCollectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contactCollectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contactCollectionView.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            infoViewsTableView.topAnchor.constraint(equalTo: contactCollectionView.bottomAnchor, constant: 5),
            infoViewsTableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: padding*2),
            infoViewsTableView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -padding*2),
            infoViewsTableView.heightAnchor.constraint(equalToConstant: 150)
            ])
        
        NSLayoutConstraint.activate([
            logoutButton.topAnchor.constraint(equalTo: infoViewsTableView.bottomAnchor, constant: 50),
            logoutButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: padding*2),
            logoutButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -1 * padding*2),
            logoutButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50)
            ])
    }
    
    //    func createPosts() {
    //        let newPost = Post(icon: UIImage(named: "icon_placeholder")!, name: "Name here", date: "Nov 25", title: "Title here", blurb: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pulvinar gravida justo at massa nunc")
    //        let ezraCornell = Post(icon: UIImage(named: "icon_placeholder")!, name: "Extra Cornell", date: "A.D 1865", title: "Any Person Any Goals", blurb: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pulvinar gravida justo at massa nunc")
    //        let vanillaIcecream = Post(icon: UIImage(named: "icon_placeholder")!, name: "FoodWiki", date: "2h", title: "Ice cream, vanilla facts and history - testing if this title will wrap", blurb: "Vanilla is frequently used to flavor ice cream, especially in North America and Europe. Vanilla ice cream, like other flavors of ice cream, was originally created by cooling a mixture made of cream, sugar")
    //        let test = Post(icon: UIImage(named: "icon_placeholder")!, name: "test", date: "Nov 27", title: "Title here", blurb: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pulvinar gravida justo at massa nunc")
    //
    //        postsArray = [newPost, ezraCornell, vanillaIcecream, test]
    //    }
    
    // MARK: - TABLEVIEW METHODS
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == infoViewsTableView {
            var cell = tableView.dequeueReusableCell(withIdentifier: "infoView", for: indexPath) as! InfoViewsTableViewCell
            cell.configure(for: infoViews[indexPath.row])
            cell.setNeedsUpdateConstraints()
            print(infoViews[indexPath.row])
            return cell
        } else if tableView == postsTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "postCellID", for: indexPath) as! PostCell
            let post = postsArray[indexPath.row]
            cell.configure(for: post)
            //        cell.backgroundColor = .white
            cell.selectionStyle = .none
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == infoViewsTableView {
            return infoViews.count
        }
        return postsArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == infoViewsTableView {
            if indexPath.row == 0 {
                let aboutView = AboutViewController()
                navigationController?.pushViewController(aboutView, animated: true)
            } else if indexPath.row == 1 {
                let postsView = PostsViewController()
                navigationController?.pushViewController(postsView, animated: true)
            }
        }
    }
    
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
            NSLayoutConstraint.deactivate([
                aboutClosedConstraint,
                projectsOpenConstraint,
                postsOpenConstraint
                ])
            aboutOpenConstraint.isActive = true
        }
        else if(sender.selectedSegmentIndex == 1) {
            UIView.animate(withDuration: 0.5, animations: {
                self.aboutContainer.alpha = 0
                self.projectsContainer.alpha = 1
                self.postsContainer.alpha = 0
            })
            NSLayoutConstraint.deactivate([
                aboutOpenConstraint,
                projectsClosedConstraint,
                postsOpenConstraint
                ])
            projectsOpenConstraint.isActive = true
        }
        else {
            UIView.animate(withDuration: 0.5, animations: {
                self.aboutContainer.alpha = 0
                self.projectsContainer.alpha = 0
                self.postsContainer.alpha = 1
            })
            NSLayoutConstraint.deactivate([
                aboutOpenConstraint,
                projectsOpenConstraint,
                postsClosedConstraint
                ])
            postsOpenConstraint.isActive = true
        }
    }
}
