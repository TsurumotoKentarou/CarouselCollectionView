//
//  ViewController.swift
//  CarouselCollectionView
//
//  Created by 鶴本 賢太朗 on 2020/06/17.
//  Copyright © 2020 鶴本 賢太朗. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: CarouselCollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.decelerationRate = .fast
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.flowLayout.minimumLineSpacing = 20
        let margin: CGFloat = self.flowLayout.sectionInset.left + self.flowLayout.minimumLineSpacing
        let width = collectionView.bounds.width - margin
        let height: CGFloat = 300
        self.flowLayout.itemSize = CGSize(width: width, height: height)
        let horizontalMargin: CGFloat = (self.view.bounds.width - self.flowLayout.itemSize.width) / 2
        self.flowLayout.sectionInset = UIEdgeInsets(top: 0, left: horizontalMargin, bottom: 0, right: horizontalMargin)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .orange
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        let left: CGFloat = 20
//        let right: CGFloat = 20
//        return UIEdgeInsets(top: 0, left: left, bottom: 0, right: right)
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.flowLayout.itemSize
    }
}
