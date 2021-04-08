//
//  File.swift
//  pokerGaming
//
//  Created by Jun3631 on 2021/3/16.
//
import SwiftUI
import Foundation

struct Card {
    var suit : String
    var number : Int
    var isChosen : Bool
    var value : Int
}

class Setting : ObservableObject{
    @Published var coin = 10000
    @Published var start = false
    @Published var mode = 0
    @Published var cards = [Card]()
    @Published var youAreBoss = false
    @Published var player0ShouldPass = false
    @Published var player1ShouldPass = false
    @Published var player2ShouldPass = false
    @Published var player3ShouldPass = false
    @Published var suits = ["clubs","diamonds","hearts","spades"]
    @Published var player0Cards = [Card]()
    @Published var player1Cards = [Card]()
    @Published var player2Cards = [Card]()
    @Published var player3Cards = [Card]()
    @Published var cardShouldRevealintheMiddle = [Card]()
    @Published var judgeCards = [Card]()
    @Published var NowMustType = "all"
    @Published var turn = 0
    @Published var ifWin = false
    @Published var ifEnd = false
    @Published var isStartPlay = false
    @Published var playerMoveDistance :CGFloat = 0
    @Published var bot1MoveDistance :CGFloat = 0
    @Published var bot2MoveDistance :CGFloat = 0
    @Published var bot3MoveDistance :CGFloat = 0
    @Published var cardOpacity = 0.0
}
