//
//  LoadingView.swift
//  Tic Tac Toe
//
//  Created by Ayman alsubhi on 23/10/1443 AH.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack{
            
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(2)
            
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
