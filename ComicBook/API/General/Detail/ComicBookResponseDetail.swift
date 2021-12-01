//
//  ComicBookResponseDetail.swift
//  ComicBook
//
//  Created by Diego Leon Puerta on 11/23/21.
//

import Foundation

class ComicBookResponseDetail : Codable {
    
    var statusCodeDetail : Int = 0
    var versionDetail : String = ""
    var resultsDetail : ComicBookDetail?
    
    enum CodingKeys: String, CodingKey {
         case statusCodeDetail = "status_code"
         case versionDetail = "version"
        case resultsDetail = "results"
     }
    
    
}

