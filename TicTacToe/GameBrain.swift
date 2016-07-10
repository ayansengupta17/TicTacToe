//
//  GameBrain.swift
//  TicTacToe
//
//  Created by Ayan Sengupta on 21/06/16.
//  Copyright © 2016 Ayan Sengupta. All rights reserved.
//

import Foundation

class GameBrain{
    //private var turns = 0
   // private var maxTurns = 9
    private var Player1 = Set<Int>()
    private var Player2 = Set<Int>()
    private var _cellTappedByPlayer1 = 0
    private var _cellTappedByPlayer2 = 0
    
    private var winningSet : Set<Set<Int>> = [ [1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7] ]
    
    var cellTappedByPlayer2 : Int {
        get{
            return _cellTappedByPlayer2
        }
        set{
            if newValue >= 0{
                _cellTappedByPlayer2 = newValue
            }
            
        }
    }
    var cellTappedByPlayer1 : Int {
        get{
            return _cellTappedByPlayer1
        }
        set{
            if newValue >= 0{
                _cellTappedByPlayer1 = newValue
            }
            
        }
    }
//    func getPlayer1(values: Int) -> Int {
//        return Player1.
//    }
    
        
    func updatePlayer1Set()-> Set<Int>{
        
        Player1.insert(_cellTappedByPlayer1)
        return Player1
    }
    func updatePlayer2Set()->Set<Int>{
        
        Player2.insert(_cellTappedByPlayer2)
        return Player2
    }
    

    
    
    
    func gameDraw(turns: Int) -> Bool{
        
        let anyWinner = didSomeOneWin()
        if anyWinner == false && turns == 9 {
            return true
            }
        else {
            return false
        }
    }
    
    func didSomeOneWin() -> Bool {
        updatePlayer1Set()
        updatePlayer2Set()
        
        for sets in winningSet {
            if sets.isSubsetOf(Player1) || sets.isSubsetOf(Player2){
                return true
            }
        }
                return false
            
        
    }
    
    func Winner() -> String {
    
        if didSomeOneWin() == true {
            for sets in winningSet {
            if sets.isSubsetOf(Player1){
                return "Player1"
            }
            else if sets.isSubsetOf(Player2){
                return "Player2"
                }
            }
        }
            return "Unknown Winner"
        
    }
    func restartBrain(){
        _cellTappedByPlayer2 = 0
        _cellTappedByPlayer1 = 0
        Player1 = Set<Int>()
        Player2 = Set<Int>()
        
    }

    
    }
    

    
