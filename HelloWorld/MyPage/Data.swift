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
    var title : String
    var content : String
    var feedImageName : String
    var commentIndex : [comment]?
    init(title: String, content: String, feedImageName: String, commentIndex: [comment]? = nil) {
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


