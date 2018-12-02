//
//  PostPreviewTableViewCell.swift
//  Hack Challenge
//
//  Created by Cameron Hamidi on 11/30/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import UIKit

class PostPreviewTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var monthLabel: UILabel!
    var dayLabel: UILabel!
    
    var typeLabel: UILabel!
    var titleLabel: UILabel!
    
    var openLabel: UILabel!
    
    var postDataCollectionView: UICollectionView!
    
    var blurb: UILabel!
    
    var tagView: UICollectionView!
    var tags = ["iOS", "JavScript", "Flask", "Developer", "Freshman", "Other Stuff", "C++", "Android Programming", "Want to join a project"]
    
    var commentsIcon: UIImageView!
    var numCommentsLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        monthLabel = UILabel()
        monthLabel.text = "NOV"
        monthLabel.font = UIFont.systemFont(ofSize: 17)
        monthLabel.textColor = .black
        monthLabel.textAlignment = .center
        monthLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(monthLabel)
        
        dayLabel = UILabel()
        dayLabel.text = "12"
        dayLabel.font = UIFont.systemFont(ofSize: 30)
        dayLabel.textColor = .black
        dayLabel.textAlignment = .center
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dayLabel)
        
        typeLabel = UILabel()
        typeLabel.text = "Pitch"
        typeLabel.font = UIFont.systemFont(ofSize: 12)
        typeLabel.textColor = .black
        typeLabel.textAlignment = .center
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(typeLabel)
        
        titleLabel = UILabel()
        titleLabel.text = "Looking for a partner"
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        openLabel = UILabel()
        openLabel.text = "  Open   "
        openLabel.backgroundColor = UIColor(displayP3Red: 126/255, green: 211/255, blue: 33/255, alpha: 1.0)
        openLabel.textColor = .white
        openLabel.layer.masksToBounds = true
        openLabel.font = UIFont.systemFont(ofSize: 12)
        openLabel.layer.cornerRadius = 7.5
        openLabel.textAlignment = .center
        openLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(openLabel)
        
        var postDataLayout = UICollectionViewFlowLayout()
        postDataLayout.scrollDirection = .horizontal
        postDataLayout.minimumLineSpacing = 4
        postDataLayout.minimumInteritemSpacing = 6
        postDataLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        postDataCollectionView = UICollectionView(frame: .zero, collectionViewLayout: postDataLayout)
        postDataCollectionView.dataSource = self
        postDataCollectionView.delegate = self
        postDataCollectionView.backgroundColor = .clear
        postDataCollectionView.register(PostDataCollectionViewCell.self, forCellWithReuseIdentifier: "postData")
        postDataCollectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(postDataCollectionView)
        
        blurb = UILabel()
        blurb.font = UIFont.systemFont(ofSize: 15)
        blurb.lineBreakMode = .byWordWrapping
        blurb.textColor = .black
        blurb.numberOfLines = 3
        blurb.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(blurb)
        blurb.text = "Hello, I am looking for a prtner. This should be quite a long blurb, because I need to see if the constraints are working. Here is some additional random text, I am very obviously good with swift but I can also use Java, SQL, C++, MIPS, and I know backend design as well. Please reach out to me if you would like to work together on a project."
        
        var tagViewLayout = UICollectionViewFlowLayout()
        tagViewLayout.scrollDirection = .horizontal
        tagViewLayout.minimumLineSpacing = 4
        tagViewLayout.minimumInteritemSpacing = 4
        tagViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tagView = UICollectionView(frame: .zero, collectionViewLayout: tagViewLayout)
        tagView.dataSource = self
        tagView.delegate = self
        tagView.backgroundColor = .clear
        tagView.register(SkillsCollectionViewCell.self, forCellWithReuseIdentifier: "tag")
        tagView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(tagView)
        
        commentsIcon = UIImageView()
        commentsIcon.image = UIImage(named: "comment")
        commentsIcon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(commentsIcon)
        
        numCommentsLabel = UILabel()
        numCommentsLabel.text = "2"
        numCommentsLabel.textColor = .black
        numCommentsLabel.textAlignment = .right
        numCommentsLabel.font = UIFont.systemFont(ofSize: 15)
        numCommentsLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(numCommentsLabel)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == postDataCollectionView {
            return 3
        } else if collectionView == tagView {
            return tags.count
        } else {
            return 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == postDataCollectionView {
            var cell = postDataCollectionView.dequeueReusableCell(withReuseIdentifier: "postData", for: indexPath) as! PostDataCollectionViewCell
            if indexPath.row == 0 {
                cell.postDataType = .groupSize
                cell.label.text = "2-4 members"
            } else if indexPath.row == 1 {
                cell.postDataType = .developer
                cell.label.text = "developer"
            } else {
                cell.postDataType = .designer
                cell.label.text = "designer"
            }
            cell.setNeedsUpdateConstraints()
            return cell
        } else if collectionView == tagView {
            var cell = tagView.dequeueReusableCell(withReuseIdentifier: "tag", for: indexPath) as! SkillsCollectionViewCell
            cell.configure(skillName: tags[indexPath.row])
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == tagView {
            var width = ceil((Double)(tags[indexPath.row].count) / 10.0 * 75.0 + 10.0)
            return CGSize(width: width, height: 25.0)
        } else if collectionView == postDataCollectionView {
            var labels = ["2-4 members", "developer", "designer"]
            var width = ceil((Double)(labels[indexPath.row].count) / 10.0 * 75.0 + 10.0)
            return CGSize(width: width, height: 15.0)
        }
        else {
            return CGSize(width: 0, height: 0)
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if collect
//    }

    override func updateConstraints() {
        titleLabel.sizeToFit()
        monthLabel.sizeToFit()
        blurb.sizeToFit()
        NSLayoutConstraint.activate([
            monthLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            monthLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            
            dayLabel.centerXAnchor.constraint(equalTo: monthLabel.centerXAnchor),
            dayLabel.topAnchor.constraint(equalTo: monthLabel.bottomAnchor),
            
            typeLabel.leadingAnchor.constraint(equalTo: monthLabel.trailingAnchor, constant: 15),
            typeLabel.centerYAnchor.constraint(equalTo: monthLabel.centerYAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 3),
            titleLabel.trailingAnchor.constraint(equalTo: openLabel.leadingAnchor, constant: -10),
            
            openLabel.topAnchor.constraint(equalTo: monthLabel.topAnchor),
            openLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            openLabel.heightAnchor.constraint(equalToConstant: 16)
            ])
        NSLayoutConstraint.activate([
            postDataCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            postDataCollectionView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            postDataCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            postDataCollectionView.heightAnchor.constraint(equalToConstant: 25),
            
            blurb.topAnchor.constraint(equalTo: postDataCollectionView.bottomAnchor, constant: 15),
            blurb.leadingAnchor.constraint(equalTo: dayLabel.leadingAnchor),
            blurb.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
//            blurb.heightAnchor.constraint(equalToConstant: 200),
            
            tagView.topAnchor.constraint(equalTo: blurb.bottomAnchor, constant: 15),
            tagView.leadingAnchor.constraint(equalTo: dayLabel.leadingAnchor),
            tagView.trailingAnchor.constraint(equalTo: numCommentsLabel.leadingAnchor, constant: -15),
            tagView.heightAnchor.constraint(equalToConstant: 25),
//            tagView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            
            numCommentsLabel.trailingAnchor.constraint(equalTo: commentsIcon.leadingAnchor, constant: -5),
            numCommentsLabel.centerYAnchor.constraint(equalTo: tagView.centerYAnchor),
            
            commentsIcon.heightAnchor.constraint(equalToConstant: 15),
            commentsIcon.widthAnchor.constraint(equalToConstant: 15),
            commentsIcon.centerYAnchor.constraint(equalTo: tagView.centerYAnchor),
            commentsIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
//            commentsIcon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
            
            ])
        
        super.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
