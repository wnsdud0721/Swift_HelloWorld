//
//  Data.swift
//  HelloWorld
//
//  Created by JeonSangHyeok on 2023/08/14.
//

import Foundation

class UserInfoList {
    var userName : String
    var profileImageName :String
    var friend : [[UserInfoList]]?
    var info : String
    var myFeedList : [FeedList]?
    init(userName: String, profileImageName: String, friend: [[UserInfoList]]? = nil, info: String, myFeedList: [FeedList]? = nil) {
        self.userName = userName
        self.profileImageName = profileImageName
        self.friend = friend
        self.info = info
        self.myFeedList = myFeedList
    }
}

class Friend {
    var name: String
    var profileName: String
    
    init(name: String, profileName: String) {
        self.name = name
        self.profileName = profileName
    }
}

class FeedList {
    var userName: 
    var userProfile: String
    var title: String
    var content: String
    var commentIndex: Int?
    var feedImageName: String
    
    init(userName: String, userProfile: String, title: String, content: String, feedImageName: String, commentIndex: Int? = nil) {
        self.userName = userName
        self.userProfile = userProfile
        self.title = title
        self.content = content
        self.feedImageName = feedImageName
        self.commentIndex = commentIndex
    }
}

class comment {
    var commentContent : String
    var userName : String
    init(commentContent: String, userName: String) {
        self.commentContent = commentContent
        self.userName = userName
    }
}


