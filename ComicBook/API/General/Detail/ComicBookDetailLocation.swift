//
//  ComicBookDetailLocation.swift
//  ComicBook
//
//  Created by Diego Leon Puerta on 11/25/21.
//

import Foundation

class ComicBookDetailLocation : Codable {
    
    var nameLocation : String?
    var id : Int?
    var urlLocationImage: String?
    
    init() {
        self.urlLocationImage = ""
    }
    
    func getUrlLocationTeamImage()-> URL? {return URL(string: self.urlLocationImage!)}
    
    enum CodingKeys: String, CodingKey {
         case nameLocation = "name"
        case id = "id"
       
     }
    
}
