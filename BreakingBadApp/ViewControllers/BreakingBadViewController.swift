//
//  BreakingBadViewController.swift
//  BreakingBadApp
//
//  Created by Alexandr Barabash on 16.04.2022.
//

import UIKit

class BreakingBadViewController: UIViewController {
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var actorBatton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actorBatton.layer.cornerRadius = 10
        photoImageView.layer.cornerRadius = 10
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        downloadData()
        
    }
    
    @IBAction func randomActorButton() {
        downloadData()
    }
}

extension BreakingBadViewController {
    private func downloadData() {
        NetworkManagerBreakingBad.shared.fetchBreakingBad { result in
            switch result {
            case .success(let value):
                NetworkManagerBreakingBad.shared.fetchImageWithAF(from: value.first?.img ?? "") { data in
                    self.photoImageView.image = UIImage(data: data)
                    self.activityIndicator.stopAnimating()
                }
                self.infoLabel.text = """
                Имя: \(value.first?.name ?? "")
                Прозвище: \(value.first?.nickname ?? "")
                Род занятий: \(value.first?.occupation[0].description ?? "")
                Актер: \(value.first?.portrayed ?? "")
                """
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
