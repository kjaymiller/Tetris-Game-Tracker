//
//  ContentView.swift
//  Tetris Game Tracker
//
//  Created by Jay Miller on 10/22/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Tetris Game Tracker")
                    .padding(.vertical, 50)
                    .font(.largeTitle)
                NavigationLink(
                    destination: NewGameView()
                ){Text("Add Score")}
                    .font(.largeTitle)
                    .foregroundColor(.purple)
                    .frame(width: 150)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15).strokeBorder(Color.purple, lineWidth: 2)
                    )

                NavigationLink(
                    destination: GameListView()
                ){Text("See All Stats")}
                .padding(.vertical, 50)
                .padding(.vertical, 50)
            }.navigationBarItems(
                trailing: NavigationLink(
                    destination: GameListView()
                ){Image(systemName: "gear")})
        }
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

