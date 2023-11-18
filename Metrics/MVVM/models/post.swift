//
//  post.swift
//  Metrics
//
//  Created by Agrim Srivastava on 25/02/23.
//

import Foundation
import UIKit

/*
class User {
    var username: String
    //var fullName: String
//    var email: String
    var profileImage: String
    //var posts: [Post]

    init(username: String, /* fullName: String */ /* email: String */ profileImageURL: String /* posts: [Post] */) {
        self.username = username
        //self.fullName = fullName
        //self.email = email
        self.profileImage = profileImageURL
        //self.posts = posts
    }
}
*/

struct User {
    var username: String
    var profileImageView: String
    var location: String
}

struct Post {
    
    var createdBy: User
    //var timeAgo: String?
    //var caption: String?
    var image: String
    //var numberOfLikes: Int?
    //var numberOfComments: Int?
    //var numberOfShares: Int?
    
    static func fetchPosts() -> [Post] {
        //var posts = [Post]()
        
        let agrim = User(username: "Agrim", profileImageView: "macLabPhoto", location: "Gurgaon")
        let post1 = Post(createdBy: agrim, image: "Macbook")
        
        let abhi = User(username: "Abhi", profileImageView: "ytImage", location: "Gurgaon")
        let post2 = Post(createdBy: abhi, image: "Image 5")
        
        let dev = User(username: "Devjyoti", profileImageView: "dev", location: "Bhubaneswar")
        let post3 = Post(createdBy: dev, image: "Image 6")
        
        let aneesh = User(username: "Aneesh", profileImageView: "macLabPhoto", location: "Gurgaon")
        let post4 = Post(createdBy: aneesh, image: "Image 4")
        
        return [post1, post2, post3, post4]
        
    }
}
