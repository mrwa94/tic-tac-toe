//
//  MoveModel.swift
//  Tic Tac Toe
//
//  Created by Ayman alsubhi on 23/10/1443 AH.
//

import Foundation


enum Player {
    case human , computer
}

struct Move  {
    var player: Player
    var boaderIndex : Int
    
    
    var indecator:String {
        return player == .human ? "xmark" : "heart"
    }
}



