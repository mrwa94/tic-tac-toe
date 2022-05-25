//
//  GameButton.swift
//  Tic Tac Toe
//
//  Created by Ayman alsubhi on 23/10/1443 AH.
//

import SwiftUI

struct GameButton: View {
    let title :String
    let background : Color
    var body: some View {
        
        Text(title)
            .font(.title)
            .fontWeight(.semibold)
            .frame(width: 150, height: 50)
            .background(background)
            .foregroundColor(.black)
            .shadow(radius: 2.5)
            .cornerRadius(20)
    }
}

struct GameButton_Previews: PreviewProvider {
    static var previews: some View {
        GameButton(title: "Start Play", background: Color(red: 0.542, green: 0.946, blue: 0.812))
    }
}
