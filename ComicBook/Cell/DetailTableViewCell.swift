//
//  DetailTableViewCell.swift
//  ComicBook
//
//  Created by Diego Leon Puerta on 11/24/21.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    

    @IBOutlet weak var contentViewCharacters: UIView!
    @IBOutlet weak var cardDetail: UIView!
    @IBOutlet weak var itemNameCharacter: UILabel!
    @IBOutlet weak var itemImageCharacter: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentViewCharacters.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        self.cardDetail.clipsToBounds = true
        self.cardDetail.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.cardDetail.layer.cornerRadius = 15
        self.cardDetail.layer.borderWidth = 0.5
        self.cardDetail.layer.borderColor = #colorLiteral(red: 0.9275460839, green: 0.8759741187, blue: 0.1975739598, alpha: 1)
        
        self.itemNameCharacter.textAlignment = .left
        self.itemNameCharacter.textColor = #colorLiteral(red: 0.3218200207, green: 1, blue: 0.9816333652, alpha: 1)
        self.itemNameCharacter.backgroundColor = .clear
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
