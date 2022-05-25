//
//  HomeView.swift
//  Tic Tac Toe
//
//  Created by Ayman alsubhi on 22/10/1443 AH.
//

import SwiftUI

struct HomeView: View {
   @StateObject var viewmodel = HomeViewModel()
    var body: some View {
     
        VStack{
            Image("tic")
                .resizable()
                .frame(width: 250, height:250)
                .padding(.top,40)
             
          
            Text("Tic Tac Toe")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .padding(.top,40)
          
              
          
            
            Button{
                viewmodel.isGameViewPrsented = true
                
            }label: {
               GameButton(title: "Start Play", background: Color(red: 0.542, green: 0.946, blue: 0.812))
            }
            
            Spacer()
            
        }.fullScreenCover(isPresented: $viewmodel.isGameViewPrsented){
            GameView(viewModel: GameViewModel())
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
