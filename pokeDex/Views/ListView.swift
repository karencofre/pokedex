//
//  ListView.swift
//  pokeDex
//
//  Created by karen cofré on 15-02-22.
//

import SwiftUI

struct ListView: View {
    @State private var isShow: Bool = true
    @EnvironmentObject var viewModel: ViewModel
    let transform = CGAffineTransform(rotationAngle: -48 * (.pi / 180))
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    var body: some View {
        VStack {
            ZStack {
                Color(UIColor(named:"black")!)
                VStack {
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            
                            ForEach(viewModel.pokemons, id: \.name) {poke in
                                
                                NavigationLink(destination: DetailView(poke: poke)) {
                                   
                                     
                                        Text("\(poke.name)")
                                        .foregroundColor(Color(UIColor(named:"white")!))
                                            .frame(width: 100, height: 140)
                                            .overlay{Rectangle().stroke(Color(UIColor(named:"white")!),lineWidth: 2).frame(width: 65, height:65).transformEffect(transform).offset(x: -13,y:35)}
                                            .background(RoundedRectangle(cornerRadius: 20).fill(Color(UIColor(named:"red")!)))
                                        
                                    
                                }
                                    
                            }.padding(.top)
                        }
                    }.padding(.top, 140)
                    Button(action: {isShow.toggle()}) {
                       Text("")
                            .frame(width: 380, height: 40)
                            .padding()
                    }
                    .tint(Color(UIColor(named:"black")!))
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .padding(.top)
                    .frame(width:390)
                    .offset(x: 0, y: 35)
                }
            }
        }.onAppear{
            viewModel.getPokemons()
        }
        .position(x: 214, y: isShow ? 314 : -300)
        .animation(.easeIn, value: isShow)

    }
}
/*
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}


 
 ImageHelper(widthPokemon: 100, heightPokemon: 140, pokemon: poke.url)
 
 */
