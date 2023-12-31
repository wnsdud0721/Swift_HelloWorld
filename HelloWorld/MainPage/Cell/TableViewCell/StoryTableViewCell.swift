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
    
    // CollectionView의 DataSource와 Delegate를 설정하고 초기화
    // dataSourceDelegate - 프로토콜을 준수하는 객체, 컬렉션 뷰의 데이터와 이벤트 처리를 담당
    // row - 해당 셀이 테이블 뷰의 몇 번째 행인지 나타내는 값
    func setStoryCollectionView (dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate) {
        storyCollectionView.dataSource = dataSourceDelegate
        storyCollectionView.delegate = dataSourceDelegate
        
        let storyNib = UINib(nibName: "StoryCollectionViewCell", bundle: nil)
        // CollectionView에 CollectionViewCell 등록
        storyCollectionView.register(storyNib, forCellWithReuseIdentifier: "StoryCollectionViewCell")
        
        storyCollectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
