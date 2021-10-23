//
//  UpdateGameView.swift
//  Tetris Game Tracker
//
//  Created by Jay Miller on 10/23/21.
//

import SwiftUI

struct UpdateGameView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    let formatter = NumberFormatter()
    @ObservedObject var game: Game
    @State private var score: String
    @State private var lines: String
    @State private var timeStamp: Date
    @State private var startLevel: Int64
    @State private var endLevel: Int64
    @State private var playStyle: String
    @State private var gameType: String
    
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
               Picker("Ending Level", selection: $endLevel){
                                       ForEach (gameLevels, id:\.self) {gameLevel in
                                           
                                           if (gameLevel >= startLevel){
                                           Text(String(gameLevel))
                                           }
                                       }
                                   }
           }
           
           Button("Save changes") {
                           updateItem()
           }.navigationBarTitle("Save New Score", displayMode: .inline)
        }
        }

    init(game: Game){
        self.game = game
        self._score = State(wrappedValue: String(game.score))
        self._lines = State(wrappedValue: String(game.lines))
        self._startLevel = State(wrappedValue: game.startLevel)
        self._gameType = State(wrappedValue: game.gameType ?? "")
        self._playStyle = State(wrappedValue: game.playStyle ?? "")
        self._endLevel = State(wrappedValue: game.endLevel)
        self._timeStamp = State(wrappedValue: game.timestamp ?? Date())
        }

    private func updateItem() {
        withAnimation {
            game.timestamp = self.timeStamp
            game.score = Int64(self.score) ?? 0
            game.lines = Int64(self.lines) ?? 0
            game.playStyle = self.playStyle
            game.gameType = self.gameType
            game.startLevel = Int64(self.startLevel)
            game.endLevel = Int64(self.endLevel)

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
