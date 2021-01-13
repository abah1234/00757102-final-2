//
//  ChooseCity.swift
//
//
//   Created by 蔡文彬 on 2021/1/6.
//  
//

import SwiftUI
import PartialSheet

struct ChooseCity: View {
    @State private var sheetOn = false
    var citiesChi: [String] = ["基隆","臺北","臺南"]
    var citiesEng: [String] = ["keelung","taipei","tainan"]
    @State private var buttonIndex:Int = 0
    var body: some View {
        GeometryReader { (geometry) in
            ZStack{
                ScrollView {
                    VStack{
                        ForEach(0..<3) {(index) in
                            Button(action: {self.sheetOn = true
                                self.buttonIndex = index
                            }) {
                                ZStack{
                                    Image(self.citiesChi[index])
                                        .resizable()
                                        .renderingMode(.original)
                                        .scaledToFill()
                                        .frame(width: geometry.size.width * 250 / 414, height: geometry.size.height * 100 / 414)
                                        .opacity(0.8)
                                    Text(self.citiesChi[index])
                                        .foregroundColor(Color.white)
                                        .font(Font.system(size: 50))
                                }
                                .cornerRadius(20)
                                .shadow(radius: 5)
                                .padding(20)
                            }
                            .sheet(isPresented: self.$sheetOn) {
                                ShopList(urlStr: "https://cafenomad.tw/api/v1.2/cafes/"+self.citiesEng[self.buttonIndex],districts: Districts[self.buttonIndex])
                            }
                        }
                    }
                }.zIndex(1).frame(height: geometry.size.height * 400 / 414)
                Image("coffee").resizable().zIndex(0).opacity(0.8).scaledToFill()
                    .frame(minWidth: geometry.size.width * 0, maxWidth: geometry.size.height * 800 / 414)
            }
        }
    }
}

struct ChooseCity_Previews: PreviewProvider {
    static var previews: some View {
        ChooseCity()
    }
}
