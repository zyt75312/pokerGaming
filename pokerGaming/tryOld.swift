//
//  OldBigTwoView.swift
//  pokerGaming
//
//  Created by User22 on 2021/3/17.
//

import SwiftUI




struct tryOld: View {
    @EnvironmentObject var setting : Setting
    @State var xoffset = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    @State var yoffset = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    
    var body: some View {
        
        ZStack{
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack{
                ZStack{
                    ForEach(0..<13){item in
                        let temp = (item*50)-250
                        Button(action:{
                            if yoffset[item] < -10 {
                                yoffset[item] = 0.0
                            }
                            else {
                                yoffset[item] = -150
                            }
                        }){
                            Image("\(setting.cards[item].number)_of_\(setting.cards[item].suit)")
                        }
                        .offset(x: CGFloat(temp),y: CGFloat(yoffset[item]))
                    }
                }
                HStack{
                    ZStack{}
                    ZStack{}
                    ZStack{}
                }
                ZStack{}
            }
        }
    }
}

struct tryOld_Preview: PreviewProvider {
    static var previews: some View {
        tryOld()
            .previewLayout(.fixed(width: 1000, height: 500))
    }
}
