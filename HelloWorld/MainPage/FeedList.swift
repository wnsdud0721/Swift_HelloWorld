//
//  FeedList.swift
//  HelloWorld
//
//  Created by Junyoung_Hong on 2023/08/16.
//

import Foundation
import UIKit

class FeedList {
    var userName: String
    var userProfile: String
    var title: String
    var content: String
    var feedImageName: String
    
    init(userName: String, userProfile: String, title: String, content: String, feedImageName: String) {
        self.userName = userName
        self.userProfile = userProfile
        self.title = title
        self.content = content
        self.feedImageName = feedImageName
    }
}

let feedListData: [FeedList] = [
    FeedList(userName: "홍준영", userProfile: "profile1", title: "CollectionView란?", content: "오늘은 CollectionView에 대해서 공부했습니다.", feedImageName: "feed1"),
    FeedList(userName: "정동교", userProfile: "profile2", title: "TableView란?", content: "TableView에 대해서 알아봅시다!!", feedImageName: "feed2"),
    FeedList(userName: "김도윤", userProfile: "profile3", title: "화면 생명주기에 대하여", content: "너무 어렵고 복잡한 생명주기.", feedImageName: "feed3"),
    FeedList(userName: "정하진", userProfile: "profile4", title: "CollectionView 여백 설정하는 방법", content: "CollectionView에서 셀에 여백을 주도록 하겠습니다.", feedImageName: "feed4"),
    FeedList(userName: "전상혁", userProfile: "profile5", title: "화면이동하는 방법", content: "A화면에서 B화면으로 이동하는 다양한 방법에 대해서 알아보도록 하겠습니다.", feedImageName: "feed5"),
]
