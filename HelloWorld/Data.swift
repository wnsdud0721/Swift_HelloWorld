//
//  Data.swift
//  HelloWorld
//
//  Created by 정동교 on 2023/08/18.
//

import Foundation
import UIKit

var dataIndex = [0,1]
var feedCount = 0

class UserInfoList {
    var userName : String
    var profileImageName :String
    var friend : [Friend]
    var info : String
    var myFeedList : [feedList]
    init(userName: String, profileImageName: String, friend: [Friend], info: String, myFeedList: [feedList]) {
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


class feedList  {
    var title : String
    var content : String
    var feedImageName : String
    var commentIndex : [comment]
    
    var userProfile: String
    var userName: String
    
    init(title: String, content: String, feedImageName: String, commentIndex: [comment], userProfile: String, userName: String) {
        self.title = title
        self.content = content
        self.feedImageName = feedImageName
        self.commentIndex = commentIndex
        self.userProfile = userProfile
        self.userName = userName
    }
}

class comment  {
    var commentContent : String
    var userName : String
    var userImage : String
    init(commentContent: String, userName: String, userImage: String) {
        self.commentContent = commentContent
        self.userName = userName
        self.userImage = userImage
    }
    
}


var userInfoData : [UserInfoList] = [
    UserInfoList(userName: "김민수", profileImageName: "사진", friend: [
    Friend(name: "김도윤", profileName: "김도윤 사진"),Friend(name: "전상혁", profileName: "전상혁 사진"),Friend(name: "정동교", profileName: "정동교 사진"),Friend(name: "정하진", profileName: "정하진 사진"),Friend(name: "홍준영", profileName: "홍준영 사진")], info: "개발자가 되고 싶은 민수", myFeedList: [
        feedList(title: "첫 게시글", content: "안녕하세요", feedImageName: "게시글 사진", commentIndex: [
            comment(commentContent: "첫 댓글", userName: "전상혁", userImage: "전상혁 사진")], userProfile: "김도윤 사진", userName: "김도윤"),
        feedList(title: "두번째 게시글", content: "안녕하세요", feedImageName: "게시글 사진", commentIndex: [
                comment(commentContent: "첫 댓글", userName: "홍준영", userImage: "홍준영 사진")], userProfile: "정동교 사진", userName: "정동교"),
        feedList(title: "세번째 게시글", content: "안녕하세요", feedImageName: "게시글 사진", commentIndex: [
                    comment(commentContent: "첫 댓글", userName: "정하진", userImage: "정하진 사진")], userProfile: "전상혁 사진", userName: "전상혁"),
        feedList(title: "네번째 게시글", content: "안녕하세요", feedImageName: "게시글 사진", commentIndex: [
                        comment(commentContent: "첫 댓글", userName: "김도윤", userImage: "김도윤 사진")], userProfile: "홍준영 사진", userName: "홍준영"),
        feedList(title: "첫 게시글", content: "안녕하세요", feedImageName: "게시글 사진", commentIndex: [
                            comment(commentContent: "첫 댓글", userName: "정동교", userImage: "정동교 사진")], userProfile: "정하진 사진", userName: "정하진")])
]
