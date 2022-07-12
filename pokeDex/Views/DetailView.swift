//
//  DetailView.swift
//  pokeDex
//
//  Created by karen cofré on 15-02-22.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State var poke: PokemonDataModel
    var body: some View {
        ZStack {
            Color(UIColor(named:"red")!)
            VStack {
                VStack {
                    Rectangle()
                        .frame(height:400)
                    ImageHelper(widthPokemon: 300, heightPokemon: 300,pokeUrl: poke.url as String)
                        .offset(y:-180)
                    Divider()
                    Spacer()
                    VStack {
                        Text("\(poke.name)")
                            .font(.title)
                            .tracking(20)
                            .lineLimit(1)
                            .padding(.top,-130)
                        Text("Abilities:").font(.title)
                            .padding(.bottom)
                        ForEach(viewModel.habilidades, id: \.self) {pokeh in 
                            Text("\(pokeh.ability.name), power: \(pokeh.slot)").font(.subheadline)
                        }.padding(.bottom)
                    }.offset(y: -80)
                    Spacer()
                }
            }
        }.onAppear{
            viewModel.getPokemonHabilidades(poke.name)
        }
        
        .ignoresSafeArea()
            .padding(.bottom,-100)
             
            
    }
}
/*
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(poke: )
    }
}
*/
