//
//  PlayerIndecoterView.swift
//  Tic Tac Toe
//
//  Created by Ayman alsubhi on 23/10/1443 AH.
//

import SwiftUI

struct PlayerIndecoterView: View {
    var nameOfImage : String
    var body: some View {
        
        Image(systemName: nameOfImage)
            .resizable()
            .frame(width:40,height: 40)
            .foregroundColor(.white)
 
    }
}

struct PlayerIndecoterView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerIndecoterView(nameOfImage: "heard")
    }
}
