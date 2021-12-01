//
//  GeneralDetailViewController.swift
//  ComicBook
//
//  Created by Diego Leon Puerta on 11/24/21.
//

import UIKit

class GeneralDetailViewController: UIViewController {
    
    
    @IBOutlet var generalCard: UIView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var characterBotton: UIButton!
    @IBOutlet weak var teamsBotton: UIButton!
    @IBOutlet weak var locationsBotton: UIButton!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "Characters"){
            let dvcc = segue.destination as! DetailViewController
        }else{
            if(segue.identifier == "teams"){
                let dvct = segue.destination as! TeamsDetailViewController
            }else{
                segue.destination as! LocationsDetailViewController
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.generalCard.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.generalCard.layer.cornerRadius = 15
        self.generalCard.layer.borderWidth = 3
        self.generalCard.layer.borderColor = #colorLiteral(red: 0.3218200207, green: 1, blue: 0.9816333652, alpha: 1)
        
        self.detailLabel.layer.cornerRadius = 15
        self.detailLabel.layer.borderWidth = 2
        self.detailLabel.layer.borderColor = #colorLiteral(red: 0.9275460839, green: 0.8759741187, blue: 0.1975739598, alpha: 1)
        self.detailLabel.text = "Detail"
        self.detailLabel.textAlignment = .center
        self.detailLabel.textColor = #colorLiteral(red: 0.3218200207, green: 1, blue: 0.9816333652, alpha: 1)
        
        self.characterBotton.layer.cornerRadius = 15
        self.characterBotton.layer.borderWidth = 0.5
        self.characterBotton.layer.borderColor = #colorLiteral(red: 0.3218200207, green: 1, blue: 0.9816333652, alpha: 1)
        self.characterBotton.setTitle("Characters", for: .normal)
        self.characterBotton.setTitleColor(#colorLiteral(red: 0.9275460839, green: 0.8759741187, blue: 0.1975739598, alpha: 1), for: .normal)
        self.characterBotton.clipsToBounds = true
        
        self.teamsBotton.layer.cornerRadius = 15
        self.teamsBotton.layer.borderWidth = 0.5
        self.teamsBotton.layer.borderColor = #colorLiteral(red: 0.3218200207, green: 1, blue: 0.9816333652, alpha: 1)
        self.teamsBotton.setTitle("Teams", for: .normal)
        self.teamsBotton.setTitleColor(#colorLiteral(red: 0.9275460839, green: 0.8759741187, blue: 0.1975739598, alpha: 1), for: .normal)
        self.teamsBotton.clipsToBounds = true
        
        self.locationsBotton.layer.cornerRadius = 15
        self.locationsBotton.layer.borderWidth = 0.5
        self.locationsBotton.layer.borderColor = #colorLiteral(red: 0.3218200207, green: 1, blue: 0.9816333652, alpha: 1)
        self.locationsBotton.setTitle("Locations", for: .normal)
        self.locationsBotton.setTitleColor(#colorLiteral(red: 0.9275460839, green: 0.8759741187, blue: 0.1975739598, alpha: 1), for: .normal)
        self.locationsBotton.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}
