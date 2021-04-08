//
//  GamingView.swift
//  pokerGaming
//
//  Created by Jun3631 on 2021/3/16.
//

import SwiftUI

struct GamingSelectionView: View {
    @EnvironmentObject var setting : Setting
    var body: some View {
        ZStack{
            Image("background2")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("選擇模式")
                    .font(.system(size:50))
                    .bold()
                    .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.yellow)
                    .cornerRadius(60)
                Button(action: {
                    setting.playerMoveDistance = 0
                    setting.bot2MoveDistance = 0
                    setting.bot3MoveDistance = 0
                    setting.bot1MoveDistance = 0
                    setting.isStartPlay = false
                    setting.cards.removeAll()
                    for i in 3...13{
                        for j in 0..<4{
                            setting.cards.append(Card(suit: setting.suits[j], number: i, isChosen: false, value: j+4*i))
                        }
                    }
                    for i in 1...2{
                        for j in 0..<4{
                            setting.cards.append(Card(suit: setting.suits[j], number: i, isChosen: false, value: j+4*(i+13)))
                        }
                    }
                    setting.cards.shuffle()
                    setting.player0Cards.removeAll()
                    setting.player1Cards.removeAll()
                    setting.player2Cards.removeAll()
                    setting.player3Cards.removeAll()
                    for i in 0..<13{
                        setting.player0Cards.append(setting.cards[i])
                    }
                    for i in 13..<26{
                        setting.player1Cards.append(setting.cards[i])
                    }
                    for i in 26..<39{
                        setting.player2Cards.append(setting.cards[i])
                    }
                    for i in 39..<52{
                        setting.player3Cards.append(setting.cards[i])
                    }
                    setting.player0Cards = setting.player0Cards.sorted{$0.value < $1.value}
                    setting.player1Cards = setting.player1Cards.sorted{$0.value < $1.value}
                    setting.player2Cards = setting.player2Cards.sorted{$0.value < $1.value}
                    setting.player3Cards = setting.player3Cards.sorted{$0.value < $1.value}
                    setting.cardOpacity = 0
                    setting.cardShouldRevealintheMiddle.removeAll()
                    setting.NowMustType = "all"
                    setting.player0ShouldPass = false
                    setting.player1ShouldPass = false
                    setting.player2ShouldPass = false
                    setting.player3ShouldPass = false
                    setting.mode = 2
                }){
                    Text("大老二")
                        .font(.system(size: 25))
                        .frame(width: 100, height: 50)
                        .background(Color.blue)
                        .foregroundColor(Color.yellow)
                        .cornerRadius(60)
                }
                
                .offset(x: 0.0, y: 10)
            }
        }
    }
}

struct GamingSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GamingSelectionView()
                .previewLayout(.fixed(width: 1000, height: 500))
        }
    }
}
