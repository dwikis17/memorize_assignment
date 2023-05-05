//
//  ContentView.swift
//  Memorize_Assignment
//
//  Created by Dwiki Dwiki on 04/05/23.
//

import SwiftUI

struct ContentView: View {
    
    var vehicles = ["🚗", "🚕", "🚙" , "🚌","🚎", "🏎️","🚓","🚑","🚒","🚐","🛻","🚚"]
    
    var activities = ["🏋️","🤼‍♂️","🤸‍♀️","🤾",
                      "🤺","🏌️", "🧘", "🏊‍♀️","🤽‍♀️","🚣‍♀️" ]
    
     var flags = ["🏳️","🏴", "🏴‍☠️", "🏁",
                "🇩🇿" , "🇰🇾", "🇧🇾"]
    
    
    @State var emojiCount : Int  = 5
    
    @State  var emojiList : [String] = ["🚕", "🚙" , "🚌","🚎", "🏎️","🚓","🚑","🚒","🚐","🛻","🚚"]
    
    func getBestWidth (contentCount : Int) -> CGFloat {
        if contentCount <= 5 {
            return 100.0
        } else {
            return 80.0
        }
    }
    
    
    var body: some View {
        VStack{
            Text("Memorize!").font(.largeTitle)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: getBestWidth(contentCount: emojiCount)))] ) {
                    ForEach(emojiList[0..<emojiCount], id: \.self) {
                        CardView(content: $0)
                    }
                    
                }
                .foregroundColor(.red)
                .padding(.horizontal)
            }
            HStack (spacing: 50){
                Button{
                    emojiList = vehicles.shuffled()
                    emojiCount = Int.random(in: 4...vehicles.count)
                } label: {
                    VStack{
                        Image(systemName: "car")
                        Text("Vehicles").font(.footnote)
                    }
                }
                Button{
                    emojiList = activities.shuffled()
                    emojiCount = Int.random(in: 4...activities.count)
                } label: {
                    VStack{
                        Image(systemName: "figure.run")
                        Text("Activities").font(.footnote)
                    }
                }
                Button{
                    emojiList = flags.shuffled()
                    emojiCount = Int.random(in: 4...flags.count)
                } label: {
                    VStack{
                        Image(systemName: "flag")
                        Text("Flags").font(.footnote)
                    }
                }
            }
            .font(.title3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct CardView : View {
    @State var isFaceUp : Bool = false
    
    var content : String
    
    var body : some View {
        let cardShape = RoundedRectangle(cornerRadius: 25)
    
        ZStack {
            if isFaceUp {
                cardShape.strokeBorder(lineWidth: 3)
                Text(content)
            } else {
                cardShape.fill()
            }
        }
        .aspectRatio(2/3 , contentMode: .fit)
        .onTapGesture {
            self.isFaceUp.toggle()
            print("tapped")
        }
       
    }

}
