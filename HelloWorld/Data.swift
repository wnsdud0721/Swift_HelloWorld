//
//  Data.swift
//  HelloWorld
//
//  Created by 정동교 on 2023/08/18.
//

import Foundation
import UIKit

var b : Any = 0
var dataIndex = [0,1]
var feedCount = 0

class UserInfoList {
    var userName : String
    var profileImageName: Any
    var friend : [Friend]
    var info : String
    var myFeedList : [feedList]
    
    init(userName: String, profileImageName: Any, friend: [Friend], info: String, myFeedList: [feedList]) {
        self.userName = userName
        self.profileImageName = profileImageName
        self.friend = friend
        self.info = info
        self.myFeedList = myFeedList
    }
}

class Friend {
    var name: String
    var profileName: UIImage
    
    init(name: String, profileName: UIImage) {
        self.name = name
        self.profileName = profileName
    }
}


class feedList  {
    var title : String
    var content : String
    var feedImageName : UIImage
    var commentIndex : [comment]
    
    var userProfile: UIImage
    var userName: String
    
    init(title: String, content: String, feedImageName: UIImage, commentIndex: [comment], userProfile: UIImage, userName: String) {
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
    var userImage : UIImage
    
    init(commentContent: String, userName: String, userImage: UIImage) {
        self.commentContent = commentContent
        self.userName = userName
        self.userImage = userImage
    }
}


var userInfoData : [UserInfoList] = [
    UserInfoList(userName: "김민수", profileImageName: UIImage(systemName: "person.circle") as Any, friend: [
        Friend(name: "김도윤", profileName: UIImage(named: "몰티즈")!),Friend(name: "전상혁", profileName: UIImage(named: "스폰지밥")!),Friend(name: "정동교", profileName: UIImage(named: "모코코")!),Friend(name: "정하진", profileName: UIImage(named: "잔망루피")!),Friend(name: "홍준영", profileName: UIImage(named: "와다다곰")!)], info: "개발자가 되고 싶은 민수", myFeedList: [
        feedList(title: "첫 게시글", content: "안녕하세요", feedImageName: UIImage(named: "홍진경1")!  , commentIndex: [
            comment(commentContent: "첫 댓글", userName: "전상혁", userImage: UIImage(named: "스폰지밥")!)], userProfile: UIImage(named: "몰티즈")!, userName: "김도윤"),
        feedList(title: "두번째 게시글", content: "안녕하세요", feedImageName: UIImage(named: "홍진경2")!, commentIndex: [
                comment(commentContent: "첫 댓글", userName: "홍준영", userImage: UIImage(named: "와다다곰")!)], userProfile: UIImage(named: "모코코")!, userName: "정동교"),
        feedList(title: "세번째 게시글", content: "안녕하세요", feedImageName: UIImage(named: "박명수1")!, commentIndex: [
                    comment(commentContent: "첫 댓글", userName: "정하진", userImage: UIImage(named: "잔망루피")!)], userProfile: UIImage(named: "스폰지밥")!, userName: "전상혁"),
        feedList(title: "네번째 게시글", content: "안녕하세요", feedImageName: UIImage(named: "박명수2")!, commentIndex: [
                        comment(commentContent: "첫 댓글", userName: "김도윤", userImage: UIImage(named: "와다다곰")!)], userProfile: UIImage(named: "와다다곰")!, userName: "홍준영"),
        feedList(title: "첫 게시글", content: "안녕하세요", feedImageName: UIImage(named: "박가영")!, commentIndex: [
                            comment(commentContent: "첫 댓글", userName: "정동교", userImage: UIImage(named: "모코코")!)], userProfile: UIImage(named: "잔망루피")!, userName: "정하진")])
]
