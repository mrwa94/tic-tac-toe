//
//  GameSquerView.swift
//  Tic Tac Toe
//
//  Created by Ayman alsubhi on 23/10/1443 AH.
//

import SwiftUI

struct GameSquerView: View {
    
    var proxy : GeometryProxy
    
    var body: some View {
       
        Circle()
            .foregroundColor(Color(red: 1.001, green: 0.64, blue: 0.764))
            .frame(width:proxy.size.width/3-15 , height: proxy.size.width/3-15  )
        
        
        
    }
}

//struct GameSquerView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameSquerView()
//    }
//}
