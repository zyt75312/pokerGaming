//
//  MahjongView.swift
//  pokerGaming
//
//  Created by User22 on 2021/3/17.
//

import SwiftUI

struct MahjongView: View {
    @EnvironmentObject var setting : Setting
    var body: some View {
            ZStack{
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    Text("嘿嘿我憲哥來到明星三缺一啦")
                }
            }
    }
}

struct MahjongView_Previews: PreviewProvider {
    static var previews: some View {
        MahjongView()
            .previewLayout(.fixed(width: 1000, height: 500))
    }
}
