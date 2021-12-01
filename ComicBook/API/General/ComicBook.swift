//
//  Photo.swift
//  ComicBook
//
//  Created by Diego Leon Puerta on 11/23/21.
//

import Foundation

class ComicBook : Codable {
    
    var name : String?
    var description : String?
    var volume : ComicVolume?
    var comicImage : ComicImage?
    var data : String?
    var number : String?
    var apiDetailUrl : String?

    init() {
        self.apiDetailUrl = ""
    }

    func getUrlDetail()-> URL? {return URL(string: self.apiDetailUrl!)}

    
    enum CodingKeys: String, CodingKey {
        case data = "date_added"
        case number = "issue_number"
        case name
        case description
        case volume
        case comicImage = "image"
        case apiDetailUrl = "api_detail_url"
    }
    
}
