//
//  ComicBookDetailTeam.swift
//  ComicBook
//
//  Created by Diego Leon Puerta on 11/25/21.
//

import Foundation

class ComicBookDetailTeam : Codable {
    
    var nameTeam : String?
    var id : Int?
    var urlTeamImage : String?
    
    init() {
        self.urlTeamImage = ""
    }
    
    func getUrlTeamImage()-> URL? {return URL(string: self.urlTeamImage!)}
  
    
    enum CodingKeys: String, CodingKey {
         case nameTeam = "name"
        case id = "id"
        case urlTeamImage = "site_detail_url"
       
     }
    
}
