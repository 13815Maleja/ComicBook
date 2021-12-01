//
//  ComicBookDetail.swift
//  ComicBook
//
//  Created by Diego Leon Puerta on 11/23/21.
//

import Foundation

class ComicBookDetail : Codable {
    
    var id : Int = 0
    var description : String = ""
    var character : [ComicBookDetailCharacter] = []
    var teams : [ComicBookDetailTeam] = []
    var locations : [ComicBookDetailLocation] = []

    
    enum CodingKeys: String, CodingKey {
         case id
         case description
        case character = "character_credits"
        case teams = "team_credits"
        case locations = "location_credits"

     }
    
    
}
