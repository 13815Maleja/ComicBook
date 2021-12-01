//
//  ComicBookDetailCharacter.swift
//  ComicBook
//
//  Created by Diego Leon Puerta on 11/23/21.
//

import Foundation

class ComicBookDetailCharacter : Codable {
    
    var name : String?
    var id : Int?
    var urlCharacterImage : String?
    
    init() {
        self.name = ""
        self.id = 0
        self.urlCharacterImage = ""
    }
    
    func getUrlCharacterImage()-> URL? {return URL(string: self.urlCharacterImage!)}
  
    
    enum CodingKeys: String, CodingKey {
         case name = "name"
        case id = "id"
        case urlCharacterImage = "site_detail_url"
       
     }
    
}
