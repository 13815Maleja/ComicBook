//
//  DatabaseManager.swift
//  ComicBook
//
//  Created by Diego Leon Puerta on 11/23/21.
//

import Foundation
import Alamofire
import AlamofireImage

class DatabaseManager {
    
    static let shared = DatabaseManager(baseURL: URL(string: "https://comicvine.gamespot.com")!)
    
    let baseURL : URL
    
    private init(baseURL: URL){
        self.baseURL = baseURL
    }
    
    func getPhotos(completion: @escaping([ComicBook]?, String?)-> Void){
        AF.request(self.baseURL.appendingPathComponent("/api/issues/?api_key=b77a079328f2354cd26dd66ec2df382b0eddb063&format=json"), method: .get, parameters: nil, encoding: URLEncoding.httpBody).responseJSON
        { (response) in
            if let data = response.data{
                do {
//                    let fotos = try JSONDecoder().decode([ComicBookResponse].self, from: data)
//                    completion(fotos, nil)
                    let response = try JSONDecoder().decode(ComicBookResponse.self, from: data)
//                    print(response.results.count)
                    completion(response.results, nil)
                }catch{
                    completion(nil, "Error al decodificar")
                }
            }else{
                completion(nil, "Error en la conexion")
            }
        }
    }
    
    
    
    
}
