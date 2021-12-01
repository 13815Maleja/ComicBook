//
//  ViewController.swift
//  ComicBook
//
//  Created by Diego Leon Puerta on 11/23/21.
//

import UIKit
import Foundation
import Alamofire
import AlamofireImage
import SVProgressHUD

class ViewController: UIViewController {
    
    var datosComic : [ComicBook] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var comicBookLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        self.tableView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.tableView.layer.cornerRadius = 15
        
        self.comicBookLabel.layer.cornerRadius = 15
        self.comicBookLabel.layer.borderWidth = 2
        self.comicBookLabel.layer.borderColor = #colorLiteral(red: 1, green: 0.9473578334, blue: 0, alpha: 1)
        
        self.getComicBooks()
        
    }

    func getComicBooks(){
        SVProgressHUD.show()
        DatabaseManager.shared.getPhotos { (foto, mensaje) in
            if(mensaje != nil){
                print(mensaje ?? "")
            }else if((foto?.count ?? 0) > 0){
                self.datosComic = foto ?? []
                self.tableView.reloadData()
            }
        }
        SVProgressHUD.dismiss()
    }

}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datosComic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        let comic = self.datosComic[indexPath.row]
        cell.itemName.text = comic.volume?.name
        cell.itemData.text = comic.data
        cell.issueNumber.text = comic.number
        cell.original_url.load(url: (comic.comicImage?.getUrl()!)!)
        return cell
   }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detail", sender: self)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
//    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "detail" {
//            if let destinationVC = segue.destination as? ExampleSegueVC {
//                destinationVC.exampleStringProperty = "GeneralDetailViewControllerr"
//            }
//        }
//    }

}

extension UIImageView {
    
    func load(url : URL) {
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
