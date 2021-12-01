//
//  ComicVolumen.swift
//  ComicBook
//
//  Created by Diego Leon Puerta on 11/23/21.
//

import Foundation

class ComicVolume : Codable {
    
    var name : String?
    var id : Int?
    var apiDetail : String?
    
    enum CodingKeys: String, CodingKey {
         case apiDetail = "api_detail_url"
         case name
        case id
     }
    
}
