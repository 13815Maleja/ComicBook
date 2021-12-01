//
//  DetailTeamTableViewCell.swift
//  ComicBook
//
//  Created by Diego Leon Puerta on 11/24/21.
//

import UIKit

class DetailTeamTableViewCell: UITableViewCell {

    
    @IBOutlet weak var contentViewTeams: UIView!
    @IBOutlet weak var cardTeam: UIView!
    @IBOutlet weak var itemNameTeam: UILabel!
    @IBOutlet weak var itemImageTeam: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentViewTeams.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        self.cardTeam.clipsToBounds = true
        self.cardTeam.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.cardTeam.layer.cornerRadius = 15
        self.cardTeam.layer.borderWidth = 0.5
        self.cardTeam.layer.borderColor = #colorLiteral(red: 0.9275460839, green: 0.8759741187, blue: 0.1975739598, alpha: 1)
        
        self.itemNameTeam.textAlignment = .left
        self.itemNameTeam.textColor = #colorLiteral(red: 0.3218200207, green: 1, blue: 0.9816333652, alpha: 1)
        self.itemNameTeam.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     
    }
    
}
