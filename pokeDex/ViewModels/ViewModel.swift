//
//  ViewModel.swift
//  pokeDex
//
//  Created by karen cofré on 16-02-22.
//

import Foundation


final class ViewModel: ObservableObject{
    
    @Published var pokemons: [PokemonDataModel] = []
    @Published var habilidades: [PokeDataModel] = []
    @Published var imagen_back: String = ""
    @Published var imagen_front: String = ""
    func getPokemons(){
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=80")
        URLSession.shared.dataTask(with: url!){ data, response, error in//haciendo peticion
            if let _ = error{
                
                print("Error")
            }
            
            if let data = data,
               let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
                let pokemonDataModel = try! JSONDecoder().decode(PokemonResponseDataModel.self,from:data)
                //print("Pokemons \(pokemonDataModel)")
                
                
                DispatchQueue.main.async{
                    self.pokemons = pokemonDataModel.pokemons//un hilo en back no debe update la ui
                    
                }
                
                 
                
            }
            
        }.resume()
    }
    //habilidades
  
    func getPokemonHabilidades(_ pokeName: String){
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokeName)")
        URLSession.shared.dataTask(with: url!){ data, response, error in
            if let _ = error{
                
                print("Error")
            }
            
            if let data = data,
               let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
                let pokeDataModel = try! JSONDecoder().decode(PokeResponseDataModel.self,from:data)
                print("habilidades pokemon \(pokeDataModel)")
                
                
                DispatchQueue.main.async{
                    self.habilidades = pokeDataModel.habilidades
                    
                }
                
                 
                
            }
            
        }.resume()
        
    }
    //imagenes
    func getPokemonImages(_ pokeUrl: String) -> String {
        let url = URL(string: pokeUrl)
        URLSession.shared.dataTask(with: url!){ data, response, error in//haciendo peticion
            if let _ = error{
                
                print("Error")
            }
            
            if let data = data,
               let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
                let imageDataModel = try! JSONDecoder().decode(PokeImageDataModel.self, from: data)
                 
                
                
                DispatchQueue.main.async{
                    //self.imagen_back = imageDataModel.sprites.back_default//un hilo en back no debe update la ui
                    self.imagen_front = imageDataModel.sprites.front_default
                    
                    
                }
                
                 
                
            }
            
        }.resume()
        
        return self.imagen_front
    }
}
