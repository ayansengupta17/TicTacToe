//
//  ViewController.swift
//  TicTacToe
//
//  Created by Ayan Sengupta on 21/06/16.
//  Copyright © 2016 Ayan Sengupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var turns = 0
    let oddSet : [Int] = [1, 3, 5, 7, 9]
    var game = GameBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    @IBOutlet weak var Button5: UIButton!
    @IBOutlet weak var Button6: UIButton!
    @IBOutlet weak var Button7: UIButton!
    @IBOutlet weak var Button8: UIButton!
    @IBOutlet weak var Button9: UIButton!
    @IBOutlet weak var ImageView1: UIImageView!
    @IBOutlet weak var ImageView2: UIImageView!
    @IBOutlet weak var ImageView3: UIImageView!
    @IBOutlet weak var ImageView4: UIImageView!
    @IBOutlet weak var ImageView5: UIImageView!
    @IBOutlet weak var ImageView6: UIImageView!
    @IBOutlet weak var ImageView7: UIImageView!
    @IBOutlet weak var ImageView8: UIImageView!
    @IBOutlet weak var ImageView9: UIImageView!
    @IBOutlet weak var GameResultLabel: UILabel!
    
    @IBAction func RestartGame(sender: UIButton) {
        restartGame()
        game.restartBrain()
    }
    
    
    @IBAction func PlayerTappedOnCell(sender: UIButton) {
        turns++
        UpdateCellImage(sender.tag)
        UpdatePlayerTapValue(sender.tag)
        printWinner()
    }
    
    func UpdateCellImage(senderTag : Int){
        
        var imageName : String = ""
        
        if oddSet.contains(turns) {
            imageName = "cross"
        }
        else {
            imageName = "circle"
        }
        
        switch senderTag{
            case 1: ImageView1.image = UIImage(named: imageName)
                    Button1.enabled = false
            case 2: ImageView2.image = UIImage(named: imageName)
                    Button2.enabled = false
            case 3: ImageView3.image = UIImage(named: imageName)
                    Button3.enabled = false
            case 4: ImageView4.image = UIImage(named: imageName)
                    Button4.enabled = false
            case 5: ImageView5.image = UIImage(named: imageName)
                    Button5.enabled = false
            case 6: ImageView6.image = UIImage(named: imageName)
                    Button6.enabled = false
            case 7: ImageView7.image = UIImage(named: imageName)
                    Button7.enabled = false
            case 8: ImageView8.image = UIImage(named: imageName)
                    Button8.enabled = false
            case 9: ImageView9.image = UIImage(named: imageName)
                    Button9.enabled = false
        default: break
        }
    }
    
    func UpdatePlayerTapValue(tag : Int){
        if oddSet.contains(turns){
            
            game.cellTappedByPlayer1 = tag
        }else{
            game.cellTappedByPlayer2 = tag
        }

    }
    func printWinner(){
        if game.didSomeOneWin() == true {
            GameResultLabel.text = " \(game.Winner()) wins"
            buttonsDisable()
        }
        else if game.gameDraw(turns) == true{
               GameResultLabel.text = "Game Draw"
                
            }
        }
    func restartGame(){
        turns = 0
        Button1.enabled = true
        Button2.enabled = true
        Button3.enabled = true
        Button4.enabled = true
        Button5.enabled = true
        Button6.enabled = true
        Button7.enabled = true
        Button8.enabled = true
        Button9.enabled = true
        ImageView1.image = nil
        ImageView2.image = nil
        ImageView3.image = nil
        ImageView4.image = nil
        ImageView5.image = nil
        ImageView6.image = nil
        ImageView7.image = nil
        ImageView8.image = nil
        ImageView9.image = nil
        GameResultLabel.text = ""

    }
    
    func buttonsDisable(){
        Button1.enabled = false
        Button2.enabled = false
        Button3.enabled = false
        Button4.enabled = false
        Button5.enabled = false
        Button6.enabled = false
        Button7.enabled = false
        Button8.enabled = false
        Button9.enabled = false
        
    }
        

}

