//
//  AppView.swift
//
//
//   Created by 蔡文彬 on 2021/1/6.
//
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView{
            ChooseCity().tabItem{
                Image(systemName: "flag.fill")
                Text("咖啡廳")
            }
            Color.blue
                .tabItem{
                Text("123")
            }
        }
        .accentColor(.purple)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
