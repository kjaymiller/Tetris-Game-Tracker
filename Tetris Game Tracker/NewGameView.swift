//
//  NewGameView.swift
//  Tetris Game Tracker
//
//  Created by Jay Miller on 10/22/21.
//

import SwiftUI

struct NewGameView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var score: String = ""
    @State private var lines: String = ""
    @AppStorage("playStyle") var playStyle: String = "DAS"
    @AppStorage("gameType") var gameType: String = "A-Type"
    @AppStorage("startLevel") private var startLevel: Int = 18
    @State private var endLevel: Int = 18
    @State private var timeStamp: Date = Date()
        
    var body: some View {
            Form {
                Section(header: Text("Game Scoring")){
                                   TextField("Score", text: $score)
                                   TextField("Lines", text: $lines)
                               }
                Section(header: Text("Game Metadata")){
                    DatePicker("Date", selection: $timeStamp)
                    Picker("Game Type", selection: $gameType){
                        ForEach (gameTypeOptions, id:\.self) {option in
                            Text(option)}
                    }.pickerStyle(.segmented)
                    Picker("Play Style", selection: $playStyle){
                        ForEach (playStyleOptions, id:\.self) {option in
                                                   Text(option)}
                    }.pickerStyle(.segmented)
                    Picker("Starting Level", selection: $startLevel){
                        ForEach (gameLevels, id:\.self) {gamelevel in
                            Text(String(gamelevel))
                        }
                    }
                    Picker("Starting Level", selection: $endLevel){
                                            ForEach (gameLevels, id:\.self) {gameLevel in
                                                
                                                if (gameLevel >= startLevel){
                                                Text(String(gameLevel))
                                                }
                                            }
                                        }
                }
                
                Button("Save changes") {
                                addItem()
                }.navigationBarTitle("Save New Score", displayMode: .inline)
            }
    }

    private func addItem() {
        withAnimation {
            let newGame = Game(context: viewContext)
            newGame.timestamp = Date()
            newGame.score = Int64(self.score) ?? 0
            newGame.lines = Int64(self.score) ?? 0
            newGame.playStyle = self.playStyle
            newGame.gameType = self.gameType
            newGame.startLevel = Int64(self.startLevel)
            newGame.endLevel = Int64(self.endLevel)

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

struct NewGameView_Previews: PreviewProvider {
    static var previews: some View {
        NewGameView()
    }
}
