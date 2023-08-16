//
//  FeedList.swift
//  HelloWorld
//
//  Created by Junyoung_Hong on 2023/08/16.
//

import Foundation

class FeedList {
    var title: String
    var content: String
    var feedImageName: String
    var userProfile: String
    var userName: String
    
    init(title: String, content: String, feedImageName: String, userProfile: String, userName: String) {
        self.title = title
        self.content = content
        self.feedImageName = feedImageName
        self.userProfile = userProfile
        self.userName = userName
    }
}

let feedListData: [FeedList] = [
    FeedList(title: "CollectionView에 대해서", content: "오늘은 CollectionView에 대해서 공부했습니다.", feedImageName: "feed1", userProfile: "profile1", userName: "홍준영"),
    FeedList(title: "CollectionView에 대해서", content: "오늘은 CollectionView에 대해서 공부했습니다.", feedImageName: "feed1", userProfile: "profile1", userName: "홍준영"),
    FeedList(title: "CollectionView에 대해서", content: "오늘은 CollectionView에 대해서 공부했습니다.", feedImageName: "feed1", userProfile: "profile1", userName: "홍준영")
]
