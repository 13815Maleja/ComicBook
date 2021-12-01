//
//  Extension.swift
//  ComicBook
//
//  Created by Diego Leon Puerta on 11/23/21.
//

import Foundation
import UIKit

extension UIFont {
    enum ComicBook: String {
        case boldItalic = "Comic-Book-Bold-Italic"
        case bold = "Comic-Book-Bold"
        case italic = "Comic-Book-Italic"
        case regular = "Comic-Book"
        
        func font(_ size: CGFloat) -> UIFont {
            return UIFont(name: self.rawValue, size: size)!
        }
    }
}

extension UIView {

    func addShadow(_ opacity: Float = 0.5){
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowOpacity = opacity
        layer.shadowRadius = 4.0
    }
}

extension String {
    
    static var OOPS : String { get { return NSLocalizedString("OOPS", comment: "OOPS") } }
    
}
