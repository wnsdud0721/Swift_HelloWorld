//
//  StroyList.swift
//  HelloWorld
//
//  Created by Junyoung_Hong on 2023/08/16.
//

import Foundation
import UIKit

class StoryList {
    var friendName: String
    var friendProfile: String
    init(friendName: String, friendProfile: String) {
        self.friendName = friendName
        self.friendProfile = friendProfile
    }
}

let storyListData: [StoryList] = [
    StoryList(friendName: "홍준영", friendProfile: "profile1"),
    StoryList(friendName: "정하진", friendProfile: "profile2"),
    StoryList(friendName: "정동교", friendProfile: "profile3"),
    StoryList(friendName: "김도윤", friendProfile: "profile4"),
    StoryList(friendName: "전상혁", friendProfile: "profile5")
]
