//
//  ComicImage.swift
//  ComicBook
//
//  Created by Diego Leon Puerta on 11/23/21.
//

import Foundation

class ComicImage : Codable {
    
    @objc private var urlImage  : String?
    
    init() {
        self.urlImage = ""
    }
    
    func getUrl()-> URL? {return URL(string: self.urlImage!)}
    
    
    enum CodingKeys: String, CodingKey {
         case urlImage = "original_url"
     
     }
}

