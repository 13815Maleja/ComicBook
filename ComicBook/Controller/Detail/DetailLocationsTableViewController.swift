//
//  LocationsDetailViewController.swift
//  ComicBook
//
//  Created by Diego Leon Puerta on 11/24/21.
//

import UIKit
import Foundation
import Alamofire
import AlamofireImage

class LocationsDetailViewController: UIViewController {
    
    
    @IBOutlet weak var locationsDetailTableView: UITableView!
    @IBOutlet var locationsDetailView: UIView!
    @IBOutlet weak var comicBookLocationsLabel: UILabel!
    @IBOutlet weak var locationsLabel: UILabel!
    
    var informationLocations : [ComicBookDetailLocation] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationsDetailTableView.delegate = self
        self.locationsDetailTableView.dataSource = self
        self.locationsDetailTableView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.locationsDetailTableView.layer.cornerRadius = 15
        self.locationsDetailTableView.register(UINib(nibName: "DetailLocationsTableViewCell", bundle: nil), forCellReuseIdentifier: "cellFour")

        self.locationsDetailView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.locationsDetailView.layer.cornerRadius = 15
        self.locationsDetailView.layer.borderWidth = 3
        self.locationsDetailView.layer.borderColor = #colorLiteral(red: 0.9275460839, green: 0.8759741187, blue: 0.1975739598, alpha: 1)
        
        self.comicBookLocationsLabel.layer.cornerRadius = 15
        self.comicBookLocationsLabel.layer.borderWidth = 2
        self.comicBookLocationsLabel.layer.borderColor = #colorLiteral(red: 0.3218200207, green: 1, blue: 0.9816333652, alpha: 1)
        self.comicBookLocationsLabel.text = "ComicBook"
        self.comicBookLocationsLabel.textAlignment = .center
        self.comicBookLocationsLabel.textColor = #colorLiteral(red: 0.9275460839, green: 0.8759741187, blue: 0.1975739598, alpha: 1)
        
        self.locationsLabel.text = "Locations"
        self.locationsLabel.textAlignment = .left
        self.locationsLabel.textColor = #colorLiteral(red: 0.9275460839, green: 0.8759741187, blue: 0.1975739598, alpha: 1)
        
        self.getComicBooksLocations()
    }

    func getComicBooksLocations(){
        DatabaseManagerDetail.shared.getInformationDetailLocation { (infoLocation, message) in
            if(message != nil){
                print(message ?? "")
            }else if((infoLocation?.count ?? 0) > 0){
                self.informationLocations = infoLocation ?? []
                self.locationsDetailTableView.reloadData()
            }
        }
    }

}

extension LocationsDetailViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.informationLocations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellFour =  self.locationsDetailTableView.dequeueReusableCell(withIdentifier: "cellFour") as! DetailLocationsTableViewCell
        let comicLocationsDetail = self.informationLocations[indexPath.row]
        cellFour.itemNameLocation.text = comicLocationsDetail.nameLocation
        cellFour.itemImageLocation.loadL(url: (comicLocationsDetail.getUrlLocationTeamImage()!))
        return cellFour
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.locationsDetailTableView.deselectRow(at: indexPath, animated: true)
    }


}

extension UIImageView {
    func loadL(url : URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url)
            {
                if let image = UIImage(data: data)
                {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}




