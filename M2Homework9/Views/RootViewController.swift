//
//  ViewController.swift
//  M2Homework9
//
//  Created by Oleg Konstantinov on 25.11.2025.
//

import UIKit

class RootViewController: UIViewController {
    
    private lazy var postsData = Post.mockData()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        $0.minimumLineSpacing = 10
        $0.scrollDirection = .vertical
        return $0
    }(UICollectionViewFlowLayout())

    private lazy var collectionView: UICollectionView = {
        $0.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.cellID)
        $0.dataSource = self
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: layout))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }
}

extension RootViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        postsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.cellID, for: indexPath) as! CollectionCell
        cell.setupCell(item: postsData[indexPath.item])
        return cell
    }
}
