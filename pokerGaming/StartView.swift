//
//  StartView.swift
//  pokerGaming
//
//  Created by Jun3631 on 2021/3/16.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var setting :Setting
    var body: some View {
        ZStack{
            Image("background2")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("oldbig2")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width*0.35, height: UIScreen.main.bounds.height*0.3)
                HStack{
                    Button(action: {
                        setting.start = true
                    }){
                        Text("開始遊戲")
                            .fontWeight(.bold)
                            .font(.title)
                            .padding()
                            .background(Color.purple)
                            .cornerRadius(40)
                            .foregroundColor(.white)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color.purple, lineWidth: 5)
                            )
                    }
                    .offset(x: 0.0, y: 10)
                    Link(destination: URL(string: "https://en.wikipedia.org/wiki/Big_two")!, label:{
                        Text("規則說明")
                            .fontWeight(.bold)
                            .font(.title)
                            .padding()
                            .background(Color.purple)
                            .cornerRadius(40)
                            .foregroundColor(.white)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color.purple, lineWidth: 5)
                            )
                    })
                    .offset(x: 1.0, y: 10)
                }
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
            .previewLayout(.fixed(width: 1000, height: 500))
    }
}
