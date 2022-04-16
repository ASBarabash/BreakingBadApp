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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func randomActorButton() {
        downloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension BreakingBadViewController {
    @objc private func downloadData() {
        NetworkManagerBreakingBad.shared.fetchBreakingBad { result in
            switch result {
            case .success(let value):
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
