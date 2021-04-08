//
//  ContentView.swift
//  pokerGaming
//
//  Created by Jun3631 on 2021/3/15.
//

import SwiftUI
import CoreData


 

struct ContentView : View {
    @StateObject var setting = Setting()
    var body : some View{
        switch setting.mode  {
        case 0:
            if setting.start { GamingSelectionView().environmentObject(setting)
            }
            else{
                StartView().environmentObject(setting)
            }
        case 1:
            MahjongView().environmentObject(setting)
        case 2:
            OldBigTwoView().environmentObject(setting)
        default:
            StartView().environmentObject(setting)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 1000, height: 500))
    }
}
