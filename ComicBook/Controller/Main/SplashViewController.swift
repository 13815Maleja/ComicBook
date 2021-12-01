//
//  SplashViewController.swift
//  ComicBook
//
//  Created by Diego Leon Puerta on 11/23/21.
//

import UIKit
import SVProgressHUD

class SplashViewController: UIViewController {

    func loadNextVC() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.doSegue()
        }
    }
    
    func doSegue() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController")
        self.view.window?.rootViewController = vc
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNextVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SVProgressHUD.show(withStatus: "Loading")
    }
    
}

