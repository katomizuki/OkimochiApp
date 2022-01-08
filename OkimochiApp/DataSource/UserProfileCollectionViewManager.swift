//
//  UserProfileDataSource.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/08.
//

import UIKit
protocol UserProfileCollectionViewManagerDelegate: AnyObject {
    func onTapUpdateButton()
    func onTapProfileOptionsButton(_ selectOptions: ProfileFilterOptions)
    func onTapLetterDetail()
}
class UserProfileCollectionViewManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout  {
    weak var delegate:UserProfileCollectionViewManagerDelegate?
    var viewData:ProfileHeaderViewData?
    func initViewData(_ viewData:ProfileHeaderViewData) {
        self.viewData = viewData
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCell.id, for: indexPath) as? ProfileCell else { fatalError() }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileHeader.id, for: indexPath) as? ProfileHeader else { fatalError() }
        header.delegate = self
        if let viewData = viewData {
            header.viewData = viewData
        }
        return header
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.onTapLetterDetail()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width, height: 150)
    }
}
extension UserProfileCollectionViewManager:ProfileHeaderDelegate {
    func didTapUpdateButton() {
        self.delegate?.onTapUpdateButton()
    }
    
    func didTapProfileOptionsButton(_ selectOptions: ProfileFilterOptions) {
        self.delegate?.onTapProfileOptionsButton(selectOptions)
    }
}
