//
//  UserSettingsView.swift
//  Tetris Game Tracker
//
//  Created by Jay Miller on 10/22/21.
//

import SwiftUI

struct UserSettingsView: View {
    @AppStorage("playStyle") var playStyle = "DAS"
    @AppStorage("gameType") var gameType = "A-Type"
    @AppStorage("startLevel") var startLevel = "18"
    @AppStorage("gamerTag") var gamertag = ""
    
    var body: some View {
            VStack {
                Form {
                    TextField("Gamertag", text: $gamertag)
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
                    
                    
                }
        }
    }
}

struct UserSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingsView()
    }
}
