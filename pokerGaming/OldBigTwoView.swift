//
//  OldBigTwoView.swift
//  pokerGaming
//
//  Created by User22 on 2021/3/17.
//

import SwiftUI



func changeStateofStart(isStartPlay : inout Bool) -> Void {
    isStartPlay = true
}

func judgeifOK(judgingCards : [Card],revealCards : [Card], setting : Setting) -> Bool{
    if setting.player0ShouldPass{
        return false
    }
    else if judgingCards.count>5 || judgingCards.count < 1 {
        print("Cards should not more than 5 or less than 1")
        return false
    }
    else if setting.player1ShouldPass == true && setting.player2ShouldPass == true && setting.player3ShouldPass == true{
        print("You are boss now")
        if judgingCards.count == 2{
            if judgingCards[0].number == judgingCards[1].number{
                print("\(judgingCards[0].number)pair!")
                setting.NowMustType = "pair"
                setting.player1ShouldPass = false
                setting.player2ShouldPass = false
                setting.player3ShouldPass = false
                return true
            }
            else{
                return false
            }
        }
        if judgingCards.count == 5{
            if judgingCards[0].number == judgingCards[1].number-1{
                for i in 1...3{
                    if judgingCards[i].number != judgingCards[i+1].number-1{
                        return false
                    }
                }
                print("順子！")
                setting.NowMustType = "12345"
                setting.player1ShouldPass = false
                setting.player2ShouldPass = false
                setting.player3ShouldPass = false
                return true
            }
            else if judgingCards[0].number == judgingCards[1].number{
                if judgingCards[1].number == judgingCards[2].number{
                    if judgingCards[2].number == judgingCards[3].number{
                        print("鐵支！")
                        setting.NowMustType = "four_of_a_kind"
                        setting.player1ShouldPass = false
                        setting.player2ShouldPass = false
                        setting.player3ShouldPass = false
                        return true
                    }
                    else if judgingCards[3].number == judgingCards[4].number{
                        print("葫蘆！")
                        setting.NowMustType = "2-3"
                        setting.player1ShouldPass = false
                        setting.player2ShouldPass = false
                        setting.player3ShouldPass = false
                        return true
                    }
                }
                else if judgingCards[2].number == judgingCards[3].number{
                    if judgingCards[3].number == judgingCards[4].number{
                        print("葫蘆")
                        setting.NowMustType = "2-3"
                        setting.player1ShouldPass = false
                        setting.player2ShouldPass = false
                        setting.player3ShouldPass = false
                        return true
                    }
                }
                return false
            }
        }
        if judgingCards.count == 1{
            setting.player1ShouldPass = false
            setting.player2ShouldPass = false
            setting.player3ShouldPass = false
            setting.NowMustType = "single"
            return true
        }
    }
    else if judgingCards.count == 1 && revealCards.count == 1 {
        print("entering 1 card compare")
        if judgingCards[0].value < revealCards[0].value{
            return false
        }
        else {
            return true
        }
    }
    else if revealCards.count == 2{
        if judgingCards.count == 2{
            
        }
    }
    else if revealCards.count == 0{
        if judgingCards.count == 2{
            if judgingCards[0].number == judgingCards[1].number{
                print("\(judgingCards[0].number)pair!")
                setting.NowMustType = "pair"
                return true
            }
            else{
                return false
            }
        }
        else if judgingCards.count == 5{
            print("judgingCards.count = 5")
            if judgingCards[0].number == judgingCards[1].number-1{
                for i in 1...3{
                    if judgingCards[i].number != judgingCards[i+1].number-1{
                        return false
                    }
                }
                print("順子！")
                setting.NowMustType = "12345"
                return true
            }
            else if judgingCards[0].number == judgingCards[1].number{
                if judgingCards[1].number == judgingCards[2].number{
                    if judgingCards[2].number == judgingCards[3].number{
                        print("鐵支！")
                        setting.NowMustType = "four_of_a_kind"
                        return true
                    }
                    if judgingCards[3].number == judgingCards[4].number{
                        print("葫蘆！")
                        setting.NowMustType = "2-3"
                        return true
                    }
                }
                else if judgingCards[2].number == judgingCards[3].number{
                    if judgingCards[3].number == judgingCards[4].number{
                        print("葫蘆")
                        setting.NowMustType = "2-3"
                        return true
                    }
                }
                return false
            }
            else if judgingCards[1].number == judgingCards[2].number{
                if judgingCards[2].number == judgingCards[3].number && judgingCards[3].number == judgingCards[4].number{
                    print("鐵支！")
                    setting.NowMustType = "four_of_a_kind"
                    return true
                }
            }
        }
        else if judgingCards.count == 1{
            print("出一張卡卡")
            setting.NowMustType = "single"
            return true
        }
        print("為什麼要return true呢？")
        return false
    }
    print("default false is entering")
    return false
}
func remake(setting: Setting) -> Void {
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
}
func searchFirstPlayer(setting : Setting) ->Int{
    for i in (0..<setting.player0Cards.count) {
        //print("\(setting.player0Cards[i].number)_of_\(setting.player0Cards[i].suit)")
        if setting.player0Cards[i].number == 3 && setting.player0Cards[i].suit == "clubs"{
            return 0
        }
    }
    for i in (0..<setting.player1Cards.count) {
        //print("\(setting.player1Cards[i].number)_of_\(setting.player1Cards[i].suit)")
        if setting.player1Cards[i].number == 3 && setting.player1Cards[i].suit == "clubs"{
            return 1
        }
    }
    for i in (0..<setting.player2Cards.count) {
        //print("\(setting.player2Cards[i].number)_of_\(setting.player2Cards[i].suit)")
        if setting.player2Cards[i].number == 3 && setting.player2Cards[i].suit == "clubs"{
            return 2
        }
    }
    for i in (0..<setting.player3Cards.count) {
        //print("\(setting.player3Cards[i].number)_of_\(setting.player3Cards[i].suit)")
        if setting.player3Cards[i].number == 3 && setting.player3Cards[i].suit == "clubs"{
            return 3
        }
    }
    return 45
}

func find1Min(cards : [Card],compareCard : Card) -> Int{
    for i in 0..<cards.count{
        if cards[i].value >= compareCard.value{
            return i
        }
    }
    //print("U should pass because u have no more card better than the reveal one!")
    return -1
}

func  doBotMove(_ setting : Setting ,op : (Setting) -> Void) -> Void {
    var  time  = 1
    while setting.turn != 0{
        op(setting)
        time = time + 1
    }
}

func botMove(setting :Setting) -> Void{
    switch  setting.turn{
    case 1:
        DispatchQueue.main.asyncAfter(deadline: .now()+1){
            print("player1's turn")
            if setting.player1ShouldPass {
                print("player 1 pass!")
            }
            else if setting.player0ShouldPass && setting.player2ShouldPass && setting.player3ShouldPass{
                print("player 1 : \(setting.player1Cards[0])")
                setting.cardShouldRevealintheMiddle.removeAll()
                setting.cardShouldRevealintheMiddle.append(setting.player1Cards[0])
                setting.player1Cards.remove(at: 0)
                setting.player0ShouldPass = false
                setting.player2ShouldPass = false
                setting.player3ShouldPass = false
                setting.NowMustType = "single"
            }
            else if setting.cardShouldRevealintheMiddle.count > 0 && setting.NowMustType == "single"{
                let temp = find1Min(cards: setting.player1Cards,compareCard: setting.cardShouldRevealintheMiddle[0])
                if temp == -1{
                    print("player 1 pass!")
                    setting.player1ShouldPass = true
                }
                else{
                    print("player 1 : \(setting.player1Cards[temp])")
                    setting.cardShouldRevealintheMiddle.removeAll()
                    setting.cardShouldRevealintheMiddle.append(setting.player1Cards[temp])
                    setting.player1Cards.remove(at: temp)
                }
            }
            else if setting.NowMustType != "single" && setting.NowMustType != "all"{
                setting.player1ShouldPass = true
                print("player 1 pass! because i have write the code to compete the card type without single")
            }
            else{
                for i in 0..<setting.player1Cards.count {
                    if setting.player1Cards[i].suit == "clubs" && setting.player1Cards[i].number == 3 {
                        setting.cardShouldRevealintheMiddle.append(setting.player1Cards[i])
                        setting.player1Cards.remove(at: i)
                        setting.NowMustType = "single"
                        break
                    }
                }
            }
            if setting.player1Cards.count == 0{
                print("該結束瞜！player1贏了")
                setting.coin = setting.coin - 1000
                setting.ifWin = false
                setting.ifEnd = true
                
            }
            setting.turn = 2
            print("next one may be \(setting.turn)")
        }
        fallthrough
    case 2:
        DispatchQueue.main.asyncAfter(deadline: .now()+2){
            print("player2's turn")
            if setting.player2ShouldPass {
                print("player 2 pass!")
            }
            else if setting.player0ShouldPass && setting.player1ShouldPass && setting.player3ShouldPass{
                print("player 2 : \(setting.player2Cards[0])")
                setting.cardShouldRevealintheMiddle.removeAll()
                setting.cardShouldRevealintheMiddle.append(setting.player1Cards[0])
                setting.player2Cards.remove(at: 0)
                setting.player0ShouldPass = false
                setting.player1ShouldPass = false
                setting.player3ShouldPass = false
                setting.NowMustType = "single"
            }
            else if setting.cardShouldRevealintheMiddle.count > 0 && setting.NowMustType == "single"{
                let temp = find1Min(cards: setting.player2Cards,compareCard: setting.cardShouldRevealintheMiddle[0])
                if temp == -1{
                    print("player 2 pass!")
                    setting.player2ShouldPass = true
                }
                else{
                    print("player 2 : \(setting.player2Cards[temp])")
                    setting.cardShouldRevealintheMiddle.removeAll()
                    setting.cardShouldRevealintheMiddle.append(setting.player2Cards[temp])
                    setting.player2Cards.remove(at: temp)
                }
            }
            else if setting.NowMustType != "single" && setting.NowMustType != "all"{
                setting.player2ShouldPass = true
                print("player 2 pass!because i have write the code to compete the card type without single")
            }
            else{
                for i in 0..<setting.player2Cards.count {
                    if setting.player2Cards[i].suit == "clubs" && setting.player2Cards[i].number == 3 {
                        setting.cardShouldRevealintheMiddle.append(setting.player2Cards[i])
                        setting.player2Cards.remove(at: i)
                        setting.NowMustType = "single"
                        break
                    }
                }
            }
            if setting.player2Cards.count == 0{
                print("該結束瞜！player2贏了")
                setting.coin = setting.coin - 1000
                setting.ifWin = false
                setting.ifEnd = true
            }
            setting.turn = 3
            print("next one may be \(setting.turn)")
        }
        fallthrough
    case 3:
        DispatchQueue.main.asyncAfter(deadline: .now()+3){
            print("player3's turn")
            if setting.player3ShouldPass {
                print("player 3 pass!")
            }
            else if setting.player0ShouldPass && setting.player1ShouldPass && setting.player2ShouldPass{
                print("player 3 : \(setting.player3Cards[0])")
                setting.cardShouldRevealintheMiddle.removeAll()
                setting.cardShouldRevealintheMiddle.append(setting.player3Cards[0])
                setting.player3Cards.remove(at: 0)
                //print("目前player3的卡牌數量：\(setting.player3Cards.count)")
                setting.player0ShouldPass = false
                setting.player1ShouldPass = false
                setting.player2ShouldPass = false
                setting.NowMustType = "single"
            }
            else if setting.cardShouldRevealintheMiddle.count > 0 && setting.NowMustType == "single"{
                let temp = find1Min(cards: setting.player3Cards,compareCard: setting.cardShouldRevealintheMiddle[0])
                if temp == -1{
                    print("player 3 pass!")
                    setting.player3ShouldPass = true
                }
                else{
                    print("player 3 : \(setting.player3Cards[temp])")
                    setting.cardShouldRevealintheMiddle.removeAll()
                    setting.cardShouldRevealintheMiddle.append(setting.player3Cards[temp])
                    setting.player3Cards.remove(at: temp)
                }
            }
            else if setting.NowMustType != "single" && setting.NowMustType != "all"{
                setting.player3ShouldPass = true
                print("player 3 pass!because i have write the code to compete the card type without single")
            }
            else{
                for i in 0..<setting.player3Cards.count {
                    if setting.player3Cards[i].suit == "clubs" && setting.player3Cards[i].number == 3 {
                        setting.cardShouldRevealintheMiddle.append(setting.player3Cards[i])
                        setting.player3Cards.remove(at: i)
                        setting.NowMustType = "single"
                        break
                    }
                }
            }
            print("目前player3的卡牌數量：\(setting.player3Cards.count)")
            if setting.player3Cards.count == 0{
                print("該結束瞜！player3贏了")
                setting.coin = setting.coin - 1000
                setting.ifWin = false
                setting.ifEnd = true
            }
            setting.turn = 0
            print("next one may be \(setting.turn)")
        }
    default:
        print("entering Default maybe is your turn")
    }
}

struct endView : View {
    var setting : Setting
    var body: some View{
        ZStack{
            if setting.ifWin{
                Image("winbackground")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
            }
            else {
                Image("losebackground")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
            }
            VStack{
                if setting.ifWin{
                    Text("水啦！贏錢摟$$+1000")
                        .frame(width: 500, height: 50)
                        .background(Color(.yellow))
                        .cornerRadius(60)
                }
                else {
                    Text("輸啦！扣錢摟$$-1000")
                        .frame(width: 500, height: 50)
                        .background(Color(.yellow))
                        .cornerRadius(60)
                }
                Button(action : {
                    remake(setting: setting)
                }){
                    Text("再來啊")
                        .frame(width: 100, height: 50)
                        .background(Color.blue)
                        .foregroundColor(Color.yellow)
                        .cornerRadius(60)
                }
                .offset(x: 0.0, y: 10)
                Button(action: {
                    setting.start = false
                    setting.mode = 0
                }){
                    Text("返回大廳")
                        .frame(width: 100, height: 50)
                        .background(Color.blue)
                        .foregroundColor(Color.yellow)
                        .cornerRadius(60)
                }
                .offset(x: 0.0, y: 20)
                
            }
        }
    }
}

struct playingView :View {
    @EnvironmentObject var setting : Setting
    @State private var yoffset = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    @State private var playerMoveDistance :CGFloat = 0
    @State private var bot1MoveDistance :CGFloat = 0
    @State private var bot2MoveDistance :CGFloat = 0
    @State private var bot3MoveDistance :CGFloat = 0
    @State private var showAlert = false
    @State private var showPassAlert = false
    var firstPlayer : Int
    
    var body: some View{
        ZStack{
            Image("background3")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                ZStack{
                    ForEach(0..<setting.player2Cards.count , id : \.self){item in
                        let temp = (item*50)-300
                        Image("cardBack")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width*0.1, height: UIScreen.main.bounds.height*0.25, alignment: .center)
                            .offset(x: CGFloat(temp),y: CGFloat(0.0))
                    }
                    if setting.player2ShouldPass{
                        Image("pass1")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width*0.1, height: UIScreen.main.bounds.height*0.1, alignment: .center)
                    }
                    HStack{
                        Image("coin2")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("\(setting.coin)")
                    }
                    .offset(x:UIScreen.main.bounds.width*0.4,y:0)
                }
                Spacer()
                HStack{
                    ZStack{
                        ForEach(0..<setting.player3Cards.count , id : \.self){item in
                            let temp = (item*15)-50
                            Image("cardBack")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width*0.1, height: UIScreen.main.bounds.height*0.25, alignment: .center)
                                .offset(x: CGFloat(0.0),y: CGFloat(temp))
                        }
                        if setting.player3ShouldPass{
                            Image("pass1")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width*0.1, height: UIScreen.main.bounds.height*0.1, alignment: .center)
                        }
                    }
                    Spacer()
                    ZStack{
                        ForEach(0..<setting.cardShouldRevealintheMiddle.count, id:\.self){item in
                            Image("\(setting.cardShouldRevealintheMiddle[item].number)_of_\(setting.cardShouldRevealintheMiddle[item].suit)")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width*0.1, height: UIScreen.main.bounds.height*0.25, alignment: .center)
                                .offset(x: CGFloat(item*50) , y: 0.0)
                        }
                    }
                    Spacer()
                    ZStack{
                        ForEach(0..<setting.player1Cards.count , id : \.self){item in
                            let temp = (item*15)-50
                            Image("cardBack")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width*0.1, height: UIScreen.main.bounds.height*0.25, alignment: .center)
                                .offset(x: CGFloat(0.0),y: CGFloat(temp))
                        }
                        if setting.player1ShouldPass{
                            Image("pass1")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width*0.1, height: UIScreen.main.bounds.height*0.1, alignment: .center)
                        }
                    }
                }
                Spacer()
                ZStack{
                    ForEach(0..<setting.player0Cards.count,id : \.self){item in
                        let temp = (item*50)-300
                        Button(action:{
                            if setting.player0Cards[item].isChosen{
                                yoffset[item] = 0.0
                                setting.player0Cards[item].isChosen = false
                            }
                            else {
                                yoffset[item] = -50
                                setting.player0Cards[item].isChosen = true
                                
                            }
                        }){
                            Image("\(setting.player0Cards[item].number)_of_\(setting.player0Cards[item].suit)")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width*0.1, height: UIScreen.main.bounds.height*0.25, alignment: .center)
                        }
                        .offset(x: CGFloat(temp),y: CGFloat(yoffset[item]))
                        Button(action: {
                            print("目前turn 是 \(setting.turn)")
                            if setting.turn == 0{
                                setting.judgeCards.removeAll()
                                for item in (0..<setting.player0Cards.count).reversed(){
                                    if (setting.player0Cards[item].isChosen){
                                        setting.judgeCards.append(setting.player0Cards[item])
                                    }
                                }
                                setting.judgeCards=setting.judgeCards.sorted{$0.value < $1.value}
                                print(setting.judgeCards)
                                if judgeifOK(judgingCards : setting.judgeCards, revealCards : setting.cardShouldRevealintheMiddle, setting: setting){
                                    setting.cardShouldRevealintheMiddle.removeAll()
                                    for item in (0..<setting.player0Cards.count).reversed(){
                                        yoffset[item] = 0
                                        if setting.player0Cards[item].isChosen{
                                            setting.cardShouldRevealintheMiddle.append(setting.player0Cards[item])
                                            setting.player0Cards.remove(at: item)
                                        }
                                    }
                                    setting.cardShouldRevealintheMiddle = setting.cardShouldRevealintheMiddle.sorted{$0.value < $1.value}
                                    print(setting.cardShouldRevealintheMiddle)
                                    setting.turn = 1
                                    //doBotMove(setting ,op : botMove)
                                    if setting.player0Cards.count > 0{
                                        botMove(setting: setting)
                                    }
                                    else{
                                        setting.coin = setting.coin + 1000
                                        setting.ifWin = true
                                        setting.ifEnd = true
                                    }
                                }
                                else {
                                    showAlert = true
                                }
                                print("\(setting.NowMustType)")
                            }
                        }) {
                            Text("出牌")
                                .frame(width: 50,height: 20)
                                .background(Color.red)
                                .foregroundColor(Color.white)
                                .cornerRadius(60)
                            
                        }
                        .offset(x: UIScreen.main.bounds.width*0.3, y: -UIScreen.main.bounds.height*0.2)
                        .alert(isPresented: $showAlert) { () -> Alert in
                            if setting.player0ShouldPass{
                                return Alert(title: Text("竟然點pass就要好好pass啦"))
                            }
                            else{
                                return Alert(title: Text("不能這樣出啦傻孩子"))
                            }
                        }
                        Button(action: {
                            if setting.cardShouldRevealintheMiddle.count == 0{
                                showPassAlert = true
                            }
                            else if setting.turn == 0{
                                setting.turn = 1
                                setting.player0ShouldPass = true
                                //doBotMove(setting,op : botMove)
                                botMove(setting: setting)
                            }
                        }){
                            Text("Pass")
                                .frame(width: 50,height: 20)
                                .background(Color.red)
                                .foregroundColor(Color.white)
                                .cornerRadius(60)
                        }
                        .offset(x: UIScreen.main.bounds.width*0.2, y: -UIScreen.main.bounds.height*0.2)
                        .alert(isPresented: $showPassAlert) { () -> Alert in
                            Alert(title: Text("Hello"),message: Text("你有梅花三就給我快點出"))
                        }
                        if setting.player0ShouldPass{
                            Image("pass1")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width*0.1, height: UIScreen.main.bounds.height*0.1, alignment: .center)
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $setting.ifEnd, content: {
            endView(setting: setting)
        })
    }
}

struct OldBigTwoView: View {
    @EnvironmentObject var setting : Setting
    @State var yoffset = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    var body: some View {
        if setting.isStartPlay{
            playingView(firstPlayer : searchFirstPlayer(setting: setting))
        }
        else{
            ZStack{
                Image("background3")
                    .resizable()
                    .ignoresSafeArea()
                ForEach(0..<13){item in
                    Image("cardBack")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width*0.1, height: UIScreen.main.bounds.height*0.25, alignment: .center)
                        .offset(x: 0.0, y: setting.playerMoveDistance)
                        .opacity(setting.cardOpacity)
                        .animation(Animation.linear(duration : 0.5).delay(0.1*Double(item)))
                }
                ForEach(0..<13){item in
                    Image("cardBack")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width*0.1, height: UIScreen.main.bounds.height*0.25, alignment: .center)
                        .offset(x: setting.bot1MoveDistance, y: 0.0)
                        .opacity(setting.cardOpacity)
                        .animation(Animation.linear(duration : 0.5).delay(0.1*Double(item)))
                }
                ForEach(0..<13){item in
                    Image("cardBack")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width*0.1, height: UIScreen.main.bounds.height*0.25, alignment: .center)
                        .offset(x: 0.0, y: setting.bot2MoveDistance)
                        .opacity(setting.cardOpacity)
                        .animation(Animation.linear(duration : 0.5).delay(0.1*Double(item)))
                }
                ForEach(0..<13){item in
                    Image("cardBack")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width*0.1, height: UIScreen.main.bounds.height*0.25, alignment: .center)
                        .offset(x: setting.bot3MoveDistance, y: 0.0)
                        .opacity(setting.cardOpacity)
                        .animation(Animation.linear(duration : 0.5).delay(0.1*Double(item)))
                }
                Button(action: {
                    setting.cardOpacity = 1
                    setting.playerMoveDistance += UIScreen.main.bounds.height*0.35
                    setting.bot1MoveDistance += UIScreen.main.bounds.width*0.35
                    setting.bot2MoveDistance -= UIScreen.main.bounds.height*0.35
                    setting.bot3MoveDistance -= UIScreen.main.bounds.width*0.35
                    setting.turn = searchFirstPlayer(setting: setting)
                    DispatchQueue.main.asyncAfter(deadline: .now()+2){
                        changeStateofStart(isStartPlay: &setting.isStartPlay)
                        botMove(setting: setting)
                    }
                    print(searchFirstPlayer(setting: setting))
                }){
                    Text("點我發牌")
                        .font(.system(size: 25))
                        .frame(width: 150, height: 50)
                        .background(Color.blue)
                        .foregroundColor(Color.yellow)
                        .cornerRadius(60)
                }
            }
        }
    }
}

struct OldBigTwoView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            OldBigTwoView()
                .previewLayout(.fixed(width: 1000, height: 500))
        }
    }
}
