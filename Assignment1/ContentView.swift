//
// ContentView.swift : Assignment1
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

class EmojiCounter: ObservableObject {
    @Published var count: Int
    
    init(initialCount: Int) {
        self.count = initialCount
    }
    
    func increase() {
        count += 1
    }
    
    func decrease() {
        count -= 1
    }
}

struct ContentView: View {
    @StateObject var tiltLaughEmoji = EmojiCounter(initialCount: 3)
    @StateObject var winkEmoji = EmojiCounter(initialCount: -2)
    @StateObject var smileEmoji = EmojiCounter(initialCount: 2)
    @StateObject var starEmoji = EmojiCounter(initialCount: 1)
    @StateObject var laughEmoji = EmojiCounter(initialCount: -1)
    
    var body: some View{
        NavigationView{
            VStack(spacing: 6){
                emojiRow(emoji: "🤣", viewModel: tiltLaughEmoji)
                emojiRow(emoji: "😜", viewModel: winkEmoji)
                emojiRow(emoji: "😀", viewModel: smileEmoji)
                emojiRow(emoji: "🤩", viewModel: starEmoji)
                emojiRow(emoji: "😂", viewModel: laughEmoji)
                
                Spacer()
            }
            
            .padding()
            .background(Color(.white))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Emoji Counter")
                        .font(.title.bold())
                        .foregroundColor(.red)
                }
            }
        }
    }
    func emojiRow(emoji: String, viewModel: EmojiCounter) -> some View {
        HStack {
            Text(emoji)
                .font(.system(size: 40))
            
            Spacer()
            
            Text("Counter: \(viewModel.count)")
                .font(.title2)
                .foregroundColor(.red)
            
            Spacer()
            
            Button(action: {
                viewModel.increase()
            }) {
                Text("+")
                    .padding()
                    .background(Color.white)
                    .foregroundColor(Color.red)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.red, lineWidth: 1))
            }
            
            Button(action: {
                viewModel.increase()
            }) {
                Text("-")
                    .padding()
                    .background(Color.white)
                    .foregroundColor(Color.red)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.red, lineWidth: 1))
            }
        }
        .frame(height: 55)
        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
        .cornerRadius(8)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
