//
//  MainViewCtrl.swift
//  PokeDexExtra
//
//  Created by DevX on 4/15/17.
//  Copyright © 2017 DevSwift__. All rights reserved.
//

import UIKit
import AVFoundation
import AnimatedCollectionViewLayout
class MainViewCtrl: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource ,UISearchBarDelegate{
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var isFilterEnable:Bool = false
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var pokemons:[Pokemon] = [Pokemon]()
    var pokemonsFilterd:[Pokemon] = [Pokemon]()

    var animator: (LayoutAttributesAnimator, Bool, Int, Int)!
    var direction: UICollectionViewScrollDirection = .horizontal
    var audioMusic: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator = (SnapInAttributesAnimator(), true, 3, 6)
        // Turn on the paging mode for auto snaping support.
        collectionView?.isPagingEnabled = true
        searchBar.returnKeyType = .done

        
        if let layout = collectionView?.collectionViewLayout as? AnimatedCollectionViewLayout {
            layout.scrollDirection = direction
            layout.animator = animator?.0
        }
        
        LoadAudio()
        LoadPokeFromCSV()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == "" || searchBar.text == nil{
            isFilterEnable = false
            collectionView.reloadData()
            view.endEditing(true)
        }else{
            isFilterEnable = true
            let lower = searchBar.text?.lowercased()
            pokemonsFilterd = pokemons.filter({$0.name.range(of: lower!) != nil})
            collectionView.reloadData()
        }
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    
    @IBAction func btnMusicPressed(_ sender: Any) {
        
        let btn = sender as? UIButton
        if audioMusic.isPlaying {
            audioMusic.pause()
            btn?.alpha = 0.5
        }else{
            audioMusic.play()
            btn?.alpha = 1.0
        }
        
    }
    
    //****************
    
    
    func LoadAudio(){
        
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")
        do{
            audioMusic = try AVAudioPlayer(contentsOf: URL(string: path!)!)
            audioMusic.prepareToPlay()
            audioMusic.numberOfLoops = -1
            audioMusic.play()
            
        }catch{
            
        }

    }
    func LoadPokeFromCSV(){
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")
        do{
            let pokes = try CSV(contentsOfURL: path!)
            let rows = pokes.rows
            for row in rows{
                let pokeId = Int16(row["id"]!)
                let PokeName = row["identifier"]
                
                let poke = Pokemon(Name: PokeName!, PokeId: pokeId!)
                pokemons.append(poke)
            }
        }catch {
            //
        }
    }
    

}

