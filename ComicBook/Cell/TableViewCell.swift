//
//  TableViewCell.swift
//  ComicBook
//
//  Created by Diego Leon Puerta on 11/23/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var generalContentView: UIView!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var original_url: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemData: UILabel!
    @IBOutlet weak var issueNumber: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.generalContentView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        self.card.clipsToBounds = true
        self.card.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.card.layer.cornerRadius = 15
        self.card.layer.borderWidth = 0.5
        self.card.layer.borderColor = #colorLiteral(red: 0.3218200207, green: 1, blue: 0.9816333652, alpha: 1)
        
        self.itemName.textAlignment = .left
        self.itemName.textColor = #colorLiteral(red: 0.9275460839, green: 0.8759741187, blue: 0.1975739598, alpha: 1)
        self.itemName.backgroundColor = .clear
        
        self.itemData.textAlignment = .left
        self.itemData.textColor = #colorLiteral(red: 0.9275460839, green: 0.8759741187, blue: 0.1975739598, alpha: 1)
        self.itemData.backgroundColor = .clear
        
        self.issueNumber.textAlignment = .left
        self.issueNumber.textColor = #colorLiteral(red: 0.9275460839, green: 0.8759741187, blue: 0.1975739598, alpha: 1)
        self.issueNumber.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
