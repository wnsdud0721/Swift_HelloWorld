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
        feedList(title: "진경이 누나", content: "안녕하세요", feedImageName: UIImage(named: "홍진경1")!  , commentIndex: [
            comment(commentContent: "진경님 너무 웃겨요 깔깔", userName: "전상혁", userImage: UIImage(named: "스폰지밥")!)], userProfile: UIImage(named: "몰티즈")!, userName: "김도윤"),
        feedList(title: "진경씨 두번째", content: "안녕하세요", feedImageName: UIImage(named: "홍진경2")!, commentIndex: [
                comment(commentContent: "안녕하세요 잘 부탁드립니다", userName: "홍준영", userImage: UIImage(named: "와다다곰")!)], userProfile: UIImage(named: "모코코")!, userName: "정동교"),
        feedList(title: "명수옹 나 울어", content: "눈물 나겠다 눈물 나겠어 정말!", feedImageName: UIImage(named: "박명수1")!, commentIndex: [
                    comment(commentContent: "첫번째 프로젝트 너무 빡센것", userName: "정하진", userImage: UIImage(named: "잔망루피")!)], userProfile: UIImage(named: "스폰지밥")!, userName: "전상혁"),
        feedList(title: "아 ㅋㅋ 진짜 너무 힘들다", content: "그냥 다 하기가 싫다 이거야 아시겠어요?", feedImageName: UIImage(named: "박명수2")!, commentIndex: [
                        comment(commentContent: "ㅋㅋ 다 때려치죠 ㅋㅋ", userName: "홍준영", userImage: UIImage(named: "와다다곰")!)], userProfile: UIImage(named: "와다다곰")!, userName: "홍준영"),
        feedList(title: "야!! 나 간다!!", content: "ㅋㅋ 너넨 더 하다 와라", feedImageName: UIImage(named: "박가영")!, commentIndex: [
                            comment(commentContent: "이제 모두 끝이야!! 안녕!!", userName: "정동교", userImage: UIImage(named: "모코코")!),
                            comment(commentContent: "아직...안끝나셧는데용", userName: "김도윤", userImage: UIImage(named: "몰티즈")!),
                            comment(commentContent: "구라 ㄴㄴ", userName: "전상혁", userImage: UIImage(named: "스폰지밥")!)], userProfile: UIImage(named: "잔망루피")!, userName: "정하진"),
        ]
                )
]
