//
//  GameViewModel.swift
//  Tic Tac Toe
//
//  Created by Ayman alsubhi on 23/10/1443 AH.
//

import SwiftUI

final class  GameViewModel : ObservableObject{
  
    let columns : [GridItem] = [GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible())
                                
                                   ]
    
    
    @Published  var moves:[Move?] = Array(repeating: nil, count: 9)
    @Published  var isHumanTurn = true
    @Published var isGameboardDisabled = false
    @Published var alertItem : AlertItem?
    
    
    
    
    func processPlayerMove(for position :Int ) {
       if isSquareOccuer(in: moves, forIndex: position) {return }
        moves[position] = Move(player: .human, boaderIndex: position)
        
        //check for win condition or draw
        if checkWinPlayer(for: .human, in: moves){
            alertItem = AlertContext.humanWin
            return
        }
        
        if checkDraw(in: moves){
            
            alertItem = AlertContext.draw
            return
        }
      
        
        isGameboardDisabled = true
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) { [self] in
            let computerPostion = determineComputerMovePostion(in: moves)
            moves[computerPostion] = Move(player: .computer, boaderIndex: computerPostion)
            isGameboardDisabled = false
            
            if checkWinPlayer(for: .computer, in: moves){
                alertItem = AlertContext.computerWin
                return
            }
              
            if checkDraw(in: moves){
                alertItem = AlertContext.draw
                return
            }
            
        }
        
        
    }
    
    
    
    
    
    
    
//
//   @Published var game = Game(id: UUID().uuidString, player1ID: "player1", plater2ID: "player2", blockForPlayerID: "player2", winPLayerID: "", rematchPlayerID: [], moves:Array(repeating: nil, count: 9) )

    
    
    
    func isSquareOccuer(in moves : [Move?], forIndex index : Int )->Bool{
        
        return moves.contains(where: {$0?.boaderIndex == index})
    }
    
    func determineComputerMovePostion(in moves : [Move?])-> Int{
        
        let winPatren : Set<Set<Int>> = [ [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]  ]
        let computerMoves = moves.compactMap{$0}.filter{$0.player == .computer}
        let computerPostion = Set(computerMoves.map {$0.boaderIndex})
        
        for pattern in winPatren {
            let winPostion = pattern.subtracting(computerPostion)
            
            if winPostion.count == 1 {
                let isAvaiable = !isSquareOccuer(in: moves, forIndex: winPostion.first!)
                if isAvaiable {return winPostion.first!}
            }
       }
        
        let centerSquare = 4
        if !isSquareOccuer(in: moves, forIndex:centerSquare){
            return centerSquare
        }

        
        var movePostion = Int.random(in: 0..<9)
        while isSquareOccuer(in: moves, forIndex: movePostion){
            movePostion = Int.random(in: 0..<9)
        }
        
        return movePostion
    }
        
  
        
//    //wrire win Condition..
   func checkWinPlayer(for player : Player , in moves : [Move?])-> Bool{
      let winPatren : Set<Set<Int>> = [ [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]  ]

//        //remove all nill
  let playerMove = moves.compactMap{$0}.filter{$0.player == player}
   let playerPostion = Set(playerMove.map{$0.boaderIndex})

        for pattern in winPatren where pattern.isSubset(of: playerPostion){
          return true
      }
//
       return false
   }
//
    func checkDraw(in moves:[Move?])-> Bool {
       return moves.compactMap{$0}.count == 9
}

    func reSetGame(){
        moves = Array(repeating: nil, count: 9)
    }
    
    
}

