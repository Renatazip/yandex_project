//
//  ContentView.swift
//  yandex1
//
//  Created by Renatazip on 29.03.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ActionView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ActionView : View {
    var columns = Array(repeating: GridItem(.flexible()), count: 2)
    @State var categoryIndex = 0
    
    var body: some View{
        
        ZStack{
            VStack(alignment: .leading){
                HStack{
                Text("")
                    Spacer()
                Image(systemName: "cart")
                    .font(.system(size: 20))
                    .foregroundColor(Color("Color"))
                }
                
                Text("Акции")
                    .font(.title)
                    .padding(.top, 30)
                    .foregroundColor(Color("mainfont"))
                
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)){
                    VStack(spacing:0){
                        
                    }.zIndex(1)
                    
                    SearchBar(text: .constant(""))
                        .padding(.top, 30)
                }
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 30){
                        ForEach(0..<categories.count, id: \.self){ data in
                            
                            Categories(data: data, index: $categoryIndex)
                        }
                    }
                }
                .padding(.top, 30)
                
                ScrollView(.vertical, showsIndicators: false){
                    LazyVGrid(columns: columns, spacing: 20){
                        ForEach(fData){action in
                            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                                VStack{
                                    Image("\(action.image)")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 150)
                                    
                                    HStack{
                                        VStack(alignment: .leading){
                                            Text(action.title)
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color("mainfont"))
                                            
                                            Text(action.amount)
                                                .foregroundColor(Color("subfont"))
                                            
                                            Text(action.price)
                                                .font(.headline)
                                                .foregroundColor(Color("mainfont"))
                                                .fontWeight(.semibold)
                                        }
                                        
                                        Spacer()
                                    }
                                }
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                    .frame(width: 45, height: 45)
                                    .overlay(
                                        Image(systemName: "cart")
                                            .resizable()
                                            .frame(width: 20, height: 20, alignment: .center)
                                            .foregroundColor(Color("mainfont"))
                                    )
                                    .shadow(color: Color("mainfont").opacity(0.05), radius: 0, x:0, y:5)
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 20)
                            .background(Color(action.cardColor))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(color: Color(action.cardColor).opacity(0.5), radius: 10, x: 0, y:10)
                        }
                    }
                }
                .padding(.top, 30)
                
                Spacer()
            }.padding(.top, 20)
        }
        .padding(.horizontal, 20)
    }
}
struct Categories: View {
    
    var data: Int
    @Binding var index: Int
    
    var body: some View{
        VStack(spacing: 8) {
            Text(categories[data])
                .font(.system(size: 22))
                .fontWeight(index == data ? .bold : .none)
                .foregroundColor(Color(index == data ? "mainfont" : "subfont"))
            
            Capsule()
                .fill(Color("mainfont"))
                .frame(width: 30, height: 4)
                .opacity(index == data ? 1:0)
        }.onTapGesture {
            withAnimation{
                index = data
            }
        }
    }
}

struct Action: Identifiable{
    var id = UUID()
    var title : String
    var image: String
    var amount: String
    var cardColor: String
    var price: String
}

var categories = ["Stocks", "Favourites"]

var fData = [
    Action(title: "Yandex", image: "1", amount: "1 ac", cardColor: "Color-1", price: "120$"),
    Action(title: "Apple", image: "2", amount: "1 ac", cardColor: "Color-2", price: "240$"),
    Action(title: "Google", image: "3", amount: "1 ac", cardColor: "Color-1", price: "134$"),
    Action(title: "Amazon", image: "4", amount: "1 ac", cardColor: "Color-2", price: "106$"),
    Action(title: "Microsoft", image: "5", amount: "1 ac", cardColor: "Color-1", price: "231$")
]
