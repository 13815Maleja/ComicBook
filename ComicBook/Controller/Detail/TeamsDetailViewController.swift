//
//  TeamsDetailViewController.swift
//  ComicBook
//
//  Created by Diego Leon Puerta on 11/24/21.
//

import UIKit
import Foundation
import Alamofire
import AlamofireImage

class TeamsDetailViewController: UIViewController {
    
    
    @IBOutlet var teamsDetailView: UIView!
    @IBOutlet weak var teamsDetailTableView: UITableView!
    @IBOutlet weak var comicBookTeamsLabel: UILabel!
    @IBOutlet weak var teamsLabel: UILabel!
    
    
    var informationTeam : [ComicBookDetailTeam] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.teamsDetailTableView.delegate = self
        self.teamsDetailTableView.dataSource = self
        self.teamsDetailTableView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.teamsDetailTableView.layer.cornerRadius = 15
        self.teamsDetailTableView.register(UINib(nibName: "DetailTeamTableViewCell", bundle: nil), forCellReuseIdentifier: "cellThree")

        self.teamsDetailView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.teamsDetailView.layer.cornerRadius = 15
        self.teamsDetailView.layer.borderWidth = 3
        self.teamsDetailView.layer.borderColor = #colorLiteral(red: 0.9275460839, green: 0.8759741187, blue: 0.1975739598, alpha: 1)
      
        self.teamsDetailTableView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.teamsDetailTableView.layer.cornerRadius = 15
  
        self.comicBookTeamsLabel.layer.cornerRadius = 15
        self.comicBookTeamsLabel.layer.borderWidth = 2
        self.comicBookTeamsLabel.layer.borderColor = #colorLiteral(red: 0.3218200207, green: 1, blue: 0.9816333652, alpha: 1)
        self.comicBookTeamsLabel.text = "ComicBook"
        self.comicBookTeamsLabel.textAlignment = .center
        self.comicBookTeamsLabel.textColor = #colorLiteral(red: 0.9275460839, green: 0.8759741187, blue: 0.1975739598, alpha: 1)
        
        self.teamsLabel.text = "Teams"
        self.teamsLabel.textAlignment = .left
        self.teamsLabel.textColor = #colorLiteral(red: 0.9275460839, green: 0.8759741187, blue: 0.1975739598, alpha: 1)
        
        self.getComicBooksTeams()
    }

    func getComicBooksTeams(){
        DatabaseManagerDetail.shared.getInformationDetailTeam { (info, message) in
            if(message != nil){
                print(message ?? "")
            }else if((info?.count ?? 0) > 0){
                self.informationTeam = info ?? []
                self.teamsDetailTableView.reloadData()
            }
        }
    }

}

extension TeamsDetailViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.informationTeam.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellThree =  self.teamsDetailTableView.dequeueReusableCell(withIdentifier: "cellThree") as! DetailTeamTableViewCell
        let comicTeamDetail = self.informationTeam[indexPath.row]
        cellThree.itemNameTeam.text = comicTeamDetail.nameTeam
        cellThree.itemImageTeam.loadT(url: (comicTeamDetail.getUrlTeamImage()!))
        return cellThree
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.teamsDetailTableView.deselectRow(at: indexPath, animated: true)
    }


}

extension UIImageView {
    func loadT(url : URL) {
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



