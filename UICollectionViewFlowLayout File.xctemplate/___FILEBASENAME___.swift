//___FILEHEADER___

import UIKit

class ___FILEBASENAME___: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributes?.forEach { attributes in
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader
             , attributes.indexPath.item == 0
             , let collectionView = collectionView {
                let contentOffsetY = collectionView.contentOffset.y
                
                if contentOffsetY < 0 {
                    attributes.frame = CGRect(x: 0, y: contentOffsetY, width: attributes.frame.width, height: attributes.frame.height - contentOffsetY)
                }
            }
        }
        
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}

// In VC
//func setupUI() {
//    // Setup the collectionview
//    let layout: UICollectionViewFlowLayout = ___FILEBASENAME___()
//    layout.minimumLineSpacing = 4
//    layout.minimumInteritemSpacing = 4
//
//    let padding: CGFloat = 4
//    layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
//
//    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//    if #available(iOS 11.0, *) {
//        collectionView.contentInsetAdjustmentBehavior = .never
//    }
//}
