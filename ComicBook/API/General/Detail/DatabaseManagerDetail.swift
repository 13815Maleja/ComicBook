//
//  DatabaseManagerDetail.swift
//  ComicBook
//
//  Created by Diego Leon Puerta on 11/23/21.
//

import Foundation
import Alamofire
import AlamofireImage

class DatabaseManagerDetail {

    var idUrl = ComicBook()
    
    static let shared = DatabaseManagerDetail(baseURL: URL(string: "https://comicvine.gamespot.com")!)

        let baseURL : URL

        private init(baseURL: URL){
            self.baseURL = baseURL
        }
    
    func getInformationDetail(completion: @escaping([ComicBookDetailCharacter]?, String?)-> Void){
            AF.request(self.baseURL.appendingPathComponent("/api/issue/4000-30/?api_key=b77a079328f2354cd26dd66ec2df382b0eddb063&format=json"), method: .get, parameters: nil, encoding: URLEncoding.httpBody).responseJSON
            { (response) in
                if let data = response.data{
                    do {
    //                    let fotos = try JSONDecoder().decode([Photo].self, from: data)
    //                    completion(fotos, nil)
                        let response = try JSONDecoder().decode(ComicBookResponseDetail.self, from: data)
    //                    print(response.versionDetail)
                        completion(response.resultsDetail?.character, nil)
                    }catch{
                        completion(nil, "Error al decodificar")
                    }
                }else{
                    completion(nil, "Error en la conexion")
                }
            }
        }

    func getInformationDetailTeam(completion: @escaping([ComicBookDetailTeam]?, String?)-> Void){
            AF.request(self.baseURL.appendingPathComponent("/api/issue/4000-30/?api_key=b77a079328f2354cd26dd66ec2df382b0eddb063&format=json"), method: .get, parameters: nil, encoding: URLEncoding.httpBody).responseJSON
            { (response) in
                if let data = response.data{
                    do {
                        let responseTeam = try JSONDecoder().decode(ComicBookResponseDetail.self, from: data)
                        completion(responseTeam.resultsDetail?.teams, nil)
                    }catch{
                        completion(nil, "Error al decodificar")
                    }
                }else{
                    completion(nil, "Error en la conexion")
                }
            }
        }

    func getInformationDetailLocation(completion: @escaping([ComicBookDetailLocation]?, String?)-> Void){
            AF.request(self.baseURL.appendingPathComponent("/api/issue/4000-30/?api_key=b77a079328f2354cd26dd66ec2df382b0eddb063&format=json"), method: .get, parameters: nil, encoding: URLEncoding.httpBody).responseJSON
            { (response) in
                if let data = response.data{
                    do {
                        let responseLocation = try JSONDecoder().decode(ComicBookResponseDetail.self, from: data)
                        completion(responseLocation.resultsDetail?.locations, nil)
                    }catch{
                        completion(nil, "Error al decodificar")
                    }
                }else{
                    completion(nil, "Error en la conexion")
                }
            }
        }


    }
