//
//  CharacterEditor.swift
//  HW4
//
//

import SwiftUI

struct CharacterEditor: View {
    @Environment(\.presentationMode) var presentationMode
    var charactersData = CharactersData()
    @State private var name = "濃縮咖啡"
    var character = ["濃縮咖啡", "美式咖啡", "白咖啡", "拿鐵", "康寶藍", "卡布奇諾", "焦糖瑪奇朵", "摩卡", "愛爾蘭咖啡"]
    @State private var job = "冰"
    var occupation = ["冰", "熱"]
    @State private var useful = 3
    @State private var favourite = true
    @Binding var showAlert:Bool
    @State private var sameCharacter = false
    var editCharacter: Character?
    
    var body: some View {
        Form{
            VStack{
                Image("\(name)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .clipped()
                Picker(selection: self.$name, label: Text("種類")){
                    ForEach(character, id: \.self){(index) in
                        Text(index)
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            Picker(selection: self.$job, label: Text("溫度喜好")){
                ForEach(occupation, id: \.self){(index) in
                    Text(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            Stepper("好喝分數\(useful) 分", value: $useful,in: 1...5)
            Toggle("我的最愛", isOn: $favourite)
        }
        .navigationBarTitle(editCharacter == nil ? "新增清單" : "編輯資料")
        .navigationBarItems(trailing: Button("儲存"){
            let character = Character(name: self.name, useful: self.useful, favourite: self.favourite, job: self.job)
          
            if let editCharacter = self.editCharacter{
        
                let index = self.charactersData.characters.firstIndex{
                    $0.id == editCharacter.id
                }!
                for nowCharacter in self.charactersData.characters.indices{
                    if nowCharacter != index {
                        if self.charactersData.characters[nowCharacter].name == character.name{
                            self.showAlert = true
                            self.sameCharacter = true
                            break
                        }
                    }
                }
                if self.sameCharacter == false{
                    self.charactersData.characters[index] = character
                }
            }else{
                for nowCharacter in self.charactersData.characters.indices{
                    if self.charactersData.characters[nowCharacter].name == character.name{
                        self.showAlert = true
                        self.sameCharacter = true
                        break
                    }
                }
                if self.sameCharacter == false{
                    self.charactersData.characters.insert(character, at: 0)
                }
            }
            self.presentationMode.wrappedValue.dismiss()
        })
        
        .onAppear{
            if let editCharacter = self.editCharacter{
                self.name = editCharacter.name
                self.useful = editCharacter.useful
                self.favourite = editCharacter.favourite
            }
        }
    }
}

struct CharacterEditor_Previews: PreviewProvider {
    static var previews: some View {
        CharacterEditor(charactersData: CharactersData(),showAlert: .constant(false))
    }
}
