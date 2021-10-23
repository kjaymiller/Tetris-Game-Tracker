//
//  UpdateGameView.swift
//  Tetris Game Tracker
//
//  Created by Jay Miller on 10/23/21.
//

import SwiftUI

struct UpdateGameView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var game: Game = Game()
    let formatter = NumberFormatter()
   
    @State private var score = game.score
    @State private var lines = game.lines
    
    
    var body: some View {
            Form {
                Section(header: Text("Game Scoring")){
                    TextField("Score", value: $game.score, formatter: formatter)
                    TextField("Lines", value: $game.lines, formatter: formatter)
                               }
                    
            }.navigationBarTitle("Save New Score", displayMode: .inline)
                Button("Save changes") {
                                addItem()
                }
            }
    }

    private func addItem() {
        withAnimation {
            let newGame = Game(context: viewContext)
            newGame.timestamp = Date()
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}


struct UpdateGameView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateGameView()
    }
}
