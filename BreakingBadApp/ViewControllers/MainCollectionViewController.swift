//
//  MainCollectionViewController.swift
//  BreakingBadApp
//
//  Created by Alexandr Barabash on 16.04.2022.
//

import UIKit
import Alamofire

//Подписываем под протокол CaseIterable, что позволит нам обратившись к типу данных UserAction вызвать геттер allCases
enum UserAction: String, CaseIterable {
    case showBreakinBad = "Breaking Bad"
    case showRandomImage = "Random Image"
}


class MainCollectionViewController: UICollectionViewController {
    
    let userActions = UserAction.allCases

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userActions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? UserActionCell else { return UICollectionViewCell() }
        
        cell.userActionLabel.text = userActions[indexPath.item].rawValue
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        switch userAction {
        case .showBreakinBad: performSegue(withIdentifier: "showBreakingBad", sender: nil)
        case .showRandomImage: performSegue(withIdentifier: "showRandomImage", sender: nil)
        }
        
    }

}

// MARK: - UICollectionViewDelegateFlowLayout
extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}


