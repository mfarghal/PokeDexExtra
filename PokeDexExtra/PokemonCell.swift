//
//  PokemonCell.swift
//  PokeDexExtra
//
//  Created by DevX on 4/15/17.
//  Copyright © 2017 DevSwift__. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    
    
    @IBOutlet weak var ImagePoke: UIImageView!
    @IBOutlet weak var NamePoke: UILabel!
    
    
    private var colorBG_HEX:String!
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
    
    
    func bind(imageId:String,name:String,Hexa:String){
        
        ImagePoke.image = UIImage(named: imageId)
        NamePoke.text = name
        backgroundColor = Hexa.hexColor
    }
    func bind(poke:Pokemon,Hexa:String){
        
        ImagePoke.image = UIImage(named: "\(poke.pokeId)")
        NamePoke.text = poke.name
        backgroundColor = Hexa.hexColor
    }
    
}
extension String {
    var hexColor: UIColor {
        let hex = trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            return .clear
        }
        return UIColor(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

