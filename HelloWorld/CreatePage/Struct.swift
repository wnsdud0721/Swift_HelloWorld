//
//  File.swift
//  HelloWorld
//
//  Created by 김도윤 on 2023/08/17.
//

//import Foundation
//import UIKit
//
//struct Feed {
//    let image: UIImage
//    let title: String
//    let content: String
//}
//
//struct comment {
//    var commentContent: String
//    var userName: String
//}
//
//struct feedList {
//    var title: String
//    var content: String
//    var feedImageName: String
//    var commentIndex: [comment]
//}
//
//struct userInfoList {
//    var userName: String
//    var profileImageName: String
//    var friend: [String]
//    var info: String
//    var myFeedList: [feedList]
//}
//
//var userInfoData: [userInfoList] = [
//    userInfoList(
//        userName: "홍준영",
//        profileImageName: "사진",
//        friend: ["전상혁", "정동교", "정하진", "김도윤"],
//        info: "홍준영info",
//        myFeedList: [
//            feedList(
//                title: "맛있는 하루",
//                content: "대충 맛있는 곳",
//                feedImageName: "사진",
//                commentIndex: [
//                    comment(commentContent: "댓글1", userName: "전상혁")
//                ]
//            )
////            feedList(
////                title: "맛있는 이틀",
////                content: "그런곳",
////                feedImageName: "사진",
////                commentIndex: [
////                    comment(commentContent: "댓글1", userName: "김민수"),
////                    comment(commentContent: "댓글2", userName: "김민수"),
////                    comment(commentContent: "댓글3", userName: "김영미"),
////                    comment(commentContent: "댓글4", userName: "김영미")
////                ]
////            )
//        ]
//    ),
//    userInfoList(
//        userName: "전상혁",
//        profileImageName: "사진",
//        friend: ["홍준영", "정동교", "정하진", "김도윤"],
//        info: "전상혁info",
//        myFeedList: [
//            feedList(
//                title: "영미야!!",
//                content: "오늘 쉬는날",
//                feedImageName: "사진",
//                commentIndex: [
//                    comment(commentContent: "댓글1", userName: "홍준영")
//                ]
//            )
////            feedList(
////                title: "내일도 쉬는날",
////                content: "좋다!",
////                feedImageName: "사진",
////                commentIndex: [
////                    comment(commentContent: "댓글1", userName: "김민수")
////                ]
////            )
//        ]
//    ),
//    userInfoList(
//        userName: "정동교",
//        profileImageName: "사진",
//        friend: ["홍준영", "전상혁", "정하진", "김도윤"],
//        info: "정동교info",
//        myFeedList: [
//            feedList(
//                title: "영미야!!",
//                content: "오늘 쉬는날",
//                feedImageName: "사진",
//                commentIndex: [
//                    comment(commentContent: "댓글1", userName: "전상혁")
//                ]
//            )
//        ]
//    ),
//    userInfoList(
//        userName: "정하진",
//        profileImageName: "사진",
//        friend: ["홍준영", "정동교", "전상혁", "정하진"],
//        info: "정하진info",
//        myFeedList: [
//            feedList(
//                title: "영미야!!",
//                content: "오늘 쉬는날",
//                feedImageName: "사진",
//                commentIndex: [
//                    comment(commentContent: "댓글1", userName: "김도윤")
//                ]
//            )
//        ]
//    ),
//    userInfoList(
//        userName: "김도윤",
//        profileImageName: "사진",
//        friend: ["홍준영", "정동교", "정하진", "김도윤"],
//        info: "김도윤info",
//        myFeedList: [
//            feedList(
//                title: "영미야!!",
//                content: "오늘 쉬는날",
//                feedImageName: "사진",
//                commentIndex: [
//                    comment(commentContent: "댓글1", userName: "정하진")
//                ]
//            )
//        ]
//    )
//]
