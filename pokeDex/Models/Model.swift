//
//  Model.swift
//  pokeDex
//
//  Created by karen cofré on 16-02-22.
//

import Foundation


struct PokemonDataModel: Decodable{
    
    let name: String
    let url: String
}

struct PokemonResponseDataModel: Decodable{
    
    let pokemons: [PokemonDataModel]
    
    enum CodingKeys: String, CodingKey{
        
        case results
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy :CodingKeys.self)
        self.pokemons = try container.decode([PokemonDataModel].self,forKey: .results)
    }
}
