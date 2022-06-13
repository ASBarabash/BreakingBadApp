//
//  RandomImageViewController.swift
//  BreakingBadApp
//
//  Created by Alexandr Barabash on 18.04.2022.
//

import UIKit

class RandomImageViewController: UIViewController {

    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var nextButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = #colorLiteral(red: 0, green: 0.4599350691, blue: 0.8905171752, alpha: 1)
        getNextImage()
    }
    
    override func viewDidLayoutSubviews() {
        nextButton.layer.cornerRadius = nextButton.frame.height / 2
    }
    
    @IBAction func getNextImage() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        NetworkManagerImage.shared.getImage { result in
            switch result {
            case .success(let data):
                self.photoImageView.image = UIImage(data: data)
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
            case .failure(let error):
                print(error)
            }
        }
    }
}



