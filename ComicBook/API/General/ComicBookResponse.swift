//
//  ComicBookresponse.swift
//  ComicBook
//
//  Created by Diego Leon Puerta on 11/23/21.
//

import Foundation

class ComicBookResponse : Codable {
    
    var statusCode : Int = 0
    var version : String = ""
    var results : [ComicBook] = []
    
    enum CodingKeys: String, CodingKey {
         case statusCode = "status_code"
         case version
        case results
     }
    
    
    
}

