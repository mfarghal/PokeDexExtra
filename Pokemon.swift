//
//  Pokemon.swift
//  PokeDex
//
//  Created by DevX on 4/15/17.
//  Copyright © 2017 DevSwift__. All rights reserved.
//

import Foundation
class Pokemon {
    private var _name:String!
    private var _pokeId:Int16!
    
    
    var name:String{
        return _name
    }
    var pokId:Int16{
        return _pokeId
    }
    
    
    init(Name:String,PokId:Int16) {
        _name = Name
        _pokeId = PokId
    }
}
