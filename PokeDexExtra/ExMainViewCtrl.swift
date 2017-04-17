//
//  ExMainViewCtrl.swift
//  PokeDexExtra
//
//  Created by DevX on 4/16/17.
//  Copyright © 2017 DevSwift__. All rights reserved.
//

import UIKit

extension MainViewCtrl: UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFilterEnable{
            return pokemonsFilterd.count
        }
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let c = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath)
        
        if let cell = c as? PokemonCell {
            let i = indexPath.row % vcs.count
            let v = vcs[i]
            let poke:Pokemon!
            if isFilterEnable{
                poke = pokemonsFilterd[indexPath.row]
                cell.bind(poke: poke, Hexa: v)
            }else{
                poke = pokemons[indexPath.row]
                cell.bind(poke: poke, Hexa: v)
            }
            
            cell.clipsToBounds = animator?.1 ?? true
        }
        
        return c
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let poke:Pokemon!
        if isFilterEnable{
            poke = pokemonsFilterd[indexPath.row]
        }else{
            poke = pokemons[indexPath.row]
        }
        
        performSegue(withIdentifier: "PokemonDetailsVC", sender: poke)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dist  = segue.destination as? PokeDetailVC{
            dist.poke = sender as? Pokemon
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let animator = animator else { return view.bounds.size }
        return CGSize(width: view.bounds.width / CGFloat(animator.2), height: view.bounds.height / CGFloat(animator.3))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}
