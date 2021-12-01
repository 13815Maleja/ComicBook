//
//  DetailViewController.swift
//  ComicBook
//
//  Created by Diego Leon Puerta on 11/24/21.
//

import UIKit
import Foundation
import Alamofire
import AlamofireImage

class DetailViewController: UIViewController {
    
    
    @IBOutlet var charactersDetailView: UIView!
    @IBOutlet weak var detailTableView: UITableView!
    @IBOutlet weak var comicBookLabel: UILabel!
    @IBOutlet weak var charactersLabel: UILabel!
    
    var information : [ComicBookDetailCharacter] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailTableView.delegate = self
        self.detailTableView.dataSource = self
        self.detailTableView.backgroundColor  = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.detailTableView.layer.cornerRadius = 15
        self.detailTableView.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "cellTwo")
        
        self.charactersDetailView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.charactersDetailView.layer.cornerRadius = 15
        self.charactersDetailView.layer.borderWidth = 3
        self.charactersDetailView.layer.borderColor = #colorLiteral(red: 0.9275460839, green: 0.8759741187, blue: 0.1975739598, alpha: 1)
        
        self.comicBookLabel.layer.cornerRadius = 15
        self.comicBookLabel.layer.borderWidth = 2
        self.comicBookLabel.layer.borderColor = #colorLiteral(red: 0.3218200207, green: 1, blue: 0.9816333652, alpha: 1)
        self.comicBookLabel.text = "ComicBook"
        self.comicBookLabel.textAlignment = .center
        self.comicBookLabel.textColor = #colorLiteral(red: 0.9275460839, green: 0.8759741187, blue: 0.1975739598, alpha: 1)
        
        self.charactersLabel.text = "Characters"
        self.charactersLabel.textAlignment = .left
        self.charactersLabel.textColor = #colorLiteral(red: 0.9275460839, green: 0.8759741187, blue: 0.1975739598, alpha: 1)

        self.getComicBooksCharacters()
    }

    func getComicBooksCharacters(){
        DatabaseManagerDetail.shared.getInformationDetail { (info, message) in
            if(message != nil){
                print(message ?? "")
            }else if((info?.count ?? 0) > 0){
                self.information = info ?? []
                self.detailTableView.reloadData()
            }
        }
    }

}

extension DetailViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.information.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellTwo = self.detailTableView.dequeueReusableCell(withIdentifier: "cellTwo") as! DetailTableViewCell
        let comicDetail = self.information[indexPath.row]
        cellTwo.itemNameCharacter.text = comicDetail.name
        cellTwo.itemImageCharacter.loadC(url: (comicDetail.getUrlCharacterImage()!))
        return cellTwo
    }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            self.detailTableView.deselectRow(at: indexPath, animated: true)
        }
}

extension UIImageView {
    func loadC(url : URL) {
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

