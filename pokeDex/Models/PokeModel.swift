//
//  PokeModel.swift
//  pokeDex
//
//  Created by karen cofré on 16-02-22.
//

import Foundation
//mapeo de habilidades
struct PokeDataModel: Decodable, Hashable{
    
    let ability: Hab 
    let slot: Int
}

struct Hab: Decodable, Hashable{
    
    let name: String
    
}
 

struct PokeResponseDataModel: Decodable, Hashable{
    
    let habilidades: [PokeDataModel]
    
    enum CodingKeys: String, CodingKey{
        
        case abilities
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy :CodingKeys.self)
        self.habilidades = try container.decode([PokeDataModel].self,forKey: .abilities)
    }
}
