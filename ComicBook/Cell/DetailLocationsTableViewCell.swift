//
//  DetailLocationsTableViewCell.swift
//  ComicBook
//
//  Created by Diego Leon Puerta on 11/24/21.
//

import UIKit

class DetailLocationsTableViewCell: TableViewCell {

    
    @IBOutlet weak var contentViewLocations: UIView!
    @IBOutlet weak var cardLocations: UIView!
    @IBOutlet weak var itemNameLocation: UILabel!
    @IBOutlet weak var itemImageLocation: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentViewLocations.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        self.cardLocations.clipsToBounds = true
        self.cardLocations.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.cardLocations.layer.cornerRadius = 15
        self.cardLocations.layer.borderWidth = 0.5
        self.cardLocations.layer.borderColor = #colorLiteral(red: 0.9275460839, green: 0.8759741187, blue: 0.1975739598, alpha: 1)
        
        self.itemNameLocation.textAlignment = .left
        self.itemNameLocation.textColor = #colorLiteral(red: 0.3218200207, green: 1, blue: 0.9816333652, alpha: 1)
        self.itemNameLocation.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     
    }
    
}
