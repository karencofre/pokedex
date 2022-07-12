//
//  ImageHelper.swift
//  pokeDex
//
//  Created by karen cofré on 15-02-22.
//

import SwiftUI

struct ImageHelper: View {
    @EnvironmentObject var viewModel: ViewModel
    @State var widthPokemon: CGFloat = 0//100
    @State var heightPokemon: CGFloat = 0//140
    @State var pokeUrl: String
    var body: some View {
      
            AsyncImage(url:URL(string:"\(viewModel.getPokemonImages(pokeUrl))")){ image in
            image.resizable()
        } placeholder:{
            ProgressView()
        }
            .frame(width: widthPokemon, height: heightPokemon)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color(UIColor(named:"red")!)))
       
    }
}
/*
struct ImageHelper_Previews: PreviewProvider {
    static var previews: some View {
        ImageHelper()
    }
}
 */
