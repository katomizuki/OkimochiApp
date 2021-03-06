//
//  TimeLineDataSource.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/08.
//

import UIKit
protocol TimeLineDataSourceDelegate: AnyObject {
    func tapCell()
}
class TimeLineCollectionViewController: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    private let id = "collectionCell"
    weak var delegate: TimeLineDataSourceDelegate?
    private var viewData: TimeLineViewData?
    func initViewData(_ viewData: TimeLineViewData) {
        self.viewData = viewData
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewData?.numberOfCell ?? 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath)
        cell.backgroundColor = .systemOrange
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.tapCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 60)
    }

    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let config = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            let open = UIAction(title: "Open", image: UIImage(systemName: "link"), identifier: nil, discoverabilityTitle: nil, attributes: .disabled, state: .off) { _ in
                self.delegate?.tapCell()
                print("sss")
            }
            return UIMenu(title: "アイウエオ",
                          image: nil,
                          identifier: nil,
                          options: UIMenu.Options.displayInline,
                          children: [open])
        }
        return config
    }
}
