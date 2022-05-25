//
//  AlertItem.swift
//  Tic Tac Toe
//
//  Created by Ayman alsubhi on 24/10/1443 AH.
//

import SwiftUI
struct AlertItem : Identifiable{

    
    
    let id = UUID()
    var title : Text
    var message : Text
    var buttonTitle : Text
    
}

struct AlertContext {
  static   let humanWin    = AlertItem(title: Text("You Win!"), message: Text("You are so smart"), buttonTitle: Text("OK"))
  static   let computerWin = AlertItem(title: Text("You Lost!"), message: Text("Try again "), buttonTitle: Text("OK"))
  static   let draw        = AlertItem(title: Text("Draw!"), message: Text("Uh"), buttonTitle: Text("Try again"))


}
