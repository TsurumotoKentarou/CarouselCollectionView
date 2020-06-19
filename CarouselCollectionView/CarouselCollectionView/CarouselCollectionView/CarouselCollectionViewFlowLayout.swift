//
//  CarouselCollectionViewFlowLatyout.swift
//  CarouselCollectionView
//
//  Created by 鶴本 賢太朗 on 2020/06/18.
//  Copyright © 2020 鶴本 賢太朗. All rights reserved.
//

import UIKit

class CarouselCollectionViewFlowLayout: UICollectionViewFlowLayout {
    private let velocityThreshold: CGFloat = 0.2
    private var pageWidth: CGFloat {
        return self.itemSize.width + self.minimumLineSpacing
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView: UICollectionView = self.collectionView else { return self.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity) }
        let currentPage = collectionView.contentOffset.x / self.pageWidth
        if abs(velocity.x) > self.velocityThreshold {
            let nextPage: CGFloat = velocity.x > 0.0 ? ceil(currentPage) : floor(currentPage)
            return CGPoint(x: round(nextPage) * self.pageWidth, y: proposedContentOffset.y)
        }
        else {
            return CGPoint(x: round(currentPage) * self.pageWidth, y: proposedContentOffset.y)
        }
    }
}
