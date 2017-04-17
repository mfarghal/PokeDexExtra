//
//  PokeDetailVC.swift
//  PokeDexExtra
//
//  Created by DevX on 4/17/17.
//  Copyright © 2017 DevSwift__. All rights reserved.
//

import UIKit

class PokeDetailVC: UIViewController {

    @IBOutlet weak var typelbl: UILabel!
    @IBOutlet weak var defenselbl: UILabel!
    @IBOutlet weak var heightlbl: UILabel!
    @IBOutlet weak var weightlbl: UILabel!
    @IBOutlet weak var pokedexIdlbl: UILabel!
    @IBOutlet weak var attacklbl: UILabel!
    @IBOutlet weak var desclbl: UILabel!
    @IBOutlet weak var imgPoke: UIImageView!
    @IBOutlet weak var imgPokeCurrentEvo: UIImageView!
    @IBOutlet weak var evolbl: UILabel!
    
    @IBOutlet weak var nextEvoImg: UIImageView!
    var poke:Pokemon!
    override func viewDidLoad() {
        super.viewDidLoad()
        pokedexIdlbl.text = "\(poke.pokeId)"
        imgPoke.image = UIImage(named: "\(poke.pokeId)")
        imgPokeCurrentEvo.image = UIImage(named: "\(poke.pokeId)")
        poke.downloadPokemonDetail {
            self.updateUI()
        }
    }
    
    
    
    @IBAction func backbtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func updateUI() {
        
        attacklbl.text = poke.attack
        defenselbl.text = poke.defense
        heightlbl.text = poke.height
        weightlbl.text = poke.weight
        typelbl.text = poke.type
        desclbl.text = poke.description
        
        if poke.nextEvolutionId == "" {
            
            evolbl.text = "No Evolutions"
            nextEvoImg.isHidden = true
            
        } else {
            
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: poke.nextEvolutionId)
            let str = "Next Evolution: \(poke.nextEvolutionName) - LVL \(poke.nextEvolutionLevel)"
            evolbl.text = str
        }


    }
}
