//
//  GameView.swift
//  Tic Tac Toe
//
//  Created by Ayman alsubhi on 22/10/1443 AH.
//

import SwiftUI

struct GameView: View {
    @StateObject var viewModel : GameViewModel
    @Environment(\.presentationMode) var mod 
   
   
   
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack{
               
                HStack{
                    Button {
                        viewModel.reSetGame()
                    }label: {
                        GameButton(title: "Reset", background: Color(red: 0.542, green: 0.946, blue: 0.812))
                    }
                    
                    Button {
                        mod.wrappedValue.dismiss()
                    }label: {
                        GameButton(title: "Quit", background: Color(red: 0.542, green: 0.946, blue: 0.812))
                    }
                    
                    
                }
            
                Spacer()
                VStack{
                    LazyVGrid(columns: viewModel.columns , spacing: 5){
                        
                        ForEach(0..<9){ i in
                            ZStack{
                                
                                GameSquerView(proxy: geometry)
                                
                              PlayerIndecoterView(nameOfImage: viewModel.moves[i]?.indecator ?? "")
                            }.onTapGesture {
                                viewModel.processPlayerMove(for: i)
                            }
                            
                        }
                        
                     }
                    
                }
                Spacer()
            }.disabled(viewModel.isGameboardDisabled)
                .padding(.top,40)
                .alert(item: $viewModel.alertItem, content: { alertItem in
                    
                    Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.buttonTitle, action: {viewModel.reSetGame()}))
                    
                })
               
                    
                
        }
         
        
    }
}
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel())
    }
}



