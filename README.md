#App Name: CollabIT

A platform for collaborating on tech projects.

Github Repository: https://github.com/CameronHamidi/Hack-Challenge

Backend Repository: https://github.com/esfinkel/hack-challenge-fall-2018

#Screenshots

![simulator screen shot - iphone 8 - 2018-12-02 at 23 08 20](https://user-images.githubusercontent.com/45296452/49352759-a390e500-f687-11e8-805f-41b270608ea6.png)
![simulator screen shot - iphone 8 - 2018-12-02 at 23 03 41](https://user-images.githubusercontent.com/45296452/49352765-adb2e380-f687-11e8-9d5e-e125847ca549.png)
![simulator screen shot - iphone 8 - 2018-12-02 at 23 04 13](https://user-images.githubusercontent.com/45296452/49352766-b0add400-f687-11e8-99e6-4089214e6c5a.png)
![simulator screen shot - iphone 8 - 2018-12-02 at 23 04 45](https://user-images.githubusercontent.com/45296452/49352771-b5728800-f687-11e8-8eb2-e282abcae885.png)


#App Description

For CS students to network and find partners for personal and course projects. Not exclusively for CS students/courses! Users can set up a profile, make posts and comments, store a list of saved posts, and search for other users and posts.

Features a login page where users can create an account or login in with their email and password.
Profile View - displays name, contact info, major, etc.. and also has tabs that show projects that the user has worked/is working on, and posts that the user has made.

Users are able to create, search, and view posts. If a user want to start a project and are looking to recruit members, they can post a 'pitch', or if they wish to join a project, they can 'request a team'.
Posts can be searched by keywords, group size, skills, roles needed (e.g. designer, Java, Python, etc…)

Alert pop-ups to notify user if they need to fill out a required field.


#Requirements Check

iOS
- Use of NSLayoutConstraint for AutoLayout
- Used both UICollectionView and UITableView
- Used UINavigationController to present and push screens
- Used a custom API

Backend
- Project uses SQLAlchemy to model user data, posts, authentication information, etc.
- Uses GET, POST, DELETE requests for all those.
- Has been deployed to Google Cloud.

Note: Due to some difficulties with integrating the API with the frontend, certain data had to be harcoded into the app. We ask the TAs for help in solving these issues, but we were unable to fix them together.
