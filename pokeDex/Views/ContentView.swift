//
//  ContentView.swift
//  pokeDex
//
//  Created by karen cofré on 15-02-22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor(named:"red")!)
                VStack {
                    Image("pokemon")
                        .resizable()
                        .frame(width: 180, height: 220)
                    Text("Recuerda que puedes volver a desplegar la lista de pokemones")
                        .foregroundColor(Color(UIColor(named:"white")!))
                        .multilineTextAlignment(.center)
                        .padding()
                    .font(.largeTitle)
                }.offset(x: 0, y: 0)
                VStack {
                    ListView()
                    Text("Welcome To My PokeDex")
                        .foregroundColor(.init( UIColor(named: "black")!))
                        .padding(.bottom, 80)
                        .contextMenu{
                            Link("See my Github", destination: URL(string: "https://github.com/karencofre")!)
                                                     }
                        
                }
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }.onAppear{
            
            viewModel.getPokemons()
            
            
        }
        .environmentObject(viewModel)
    
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
