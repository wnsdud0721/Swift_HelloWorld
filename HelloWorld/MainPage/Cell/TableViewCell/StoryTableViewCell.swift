//
//  StoryTableViewCell.swift
//  HelloWorld
//
//  Created by Junyoung_Hong on 2023/08/16.
//

import UIKit

class StoryTableViewCell: UITableViewCell {
    
    @IBOutlet var storyCollectionView: UICollectionView!
    var footerView: UIView!
    
    //    func setStoryCollectionView (dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow: Int) {
    
    // CollectionView의 DataSource와 Delegate를 설정하고 초기화
    // dataSourceDelegate - 프로토콜을 준수하는 객체, 컬렉션 뷰의 데이터와 이벤트 처리를 담당
    // row - 해당 셀이 테이블 뷰의 몇 번째 행인지 나타내는 값
    func setStoryCollectionView (dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate) {
        storyCollectionView.dataSource = dataSourceDelegate
        storyCollectionView.delegate = dataSourceDelegate
        //storyCollectionView.tag = row
        
        let storyNib = UINib(nibName: "StoryCollectionViewCell", bundle: nil)
        storyCollectionView.register(storyNib, forCellWithReuseIdentifier: "StoryCollectionViewCell")
        
        storyCollectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        // 회색 줄을 생성하고 스타일을 설정
//        footerView = UIView(frame: CGRect(x: 0, y: storyCollectionView.frame.height - 1, width: storyCollectionView.frame.width, height: 0.5))
//        footerView.backgroundColor = UIColor.lightGray
//
//        // 컬렉션 뷰의 뷰 계층 구조에 추가
//        storyCollectionView.addSubview(footerView)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
//    override func layoutSubviews() {
//            super.layoutSubviews()
//
//            // footerView의 위치를 업데이트
//            footerView.frame.origin.y = storyCollectionView.contentSize.height - 1
//            footerView.frame.size.width = storyCollectionView.contentSize.width
//        }
}
