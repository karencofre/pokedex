//
//  ImagesModel.swift
//  pokeDex
//
//  Created by karen cofré on 16-02-22.
//

import Foundation
// arreglarlo
struct PokeImageDataModel: Codable,Hashable{
    let sprites: imagenes
    
}
struct imagenes: Codable, Hashable{
    let front_default: String
    let back_default: String
    
}
struct PokeImageResponseDataModel: Decodable{
    
    let pokeimages: [PokeImageDataModel]
    
    enum CodingKeys: String, CodingKey{
        
        case sprites
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy :CodingKeys.self)
        self.pokeimages = try container.decode([PokeImageDataModel].self,forKey: .sprites)
    }
}
 
