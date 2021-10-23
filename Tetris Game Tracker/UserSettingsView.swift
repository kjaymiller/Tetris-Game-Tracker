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
    @AppStorage("startingLevel") var startingLevel = "18"
    @AppStorage("gamerTag") var gamertag = ""
    var body: some View {
        Form {
            VStack {
                TextField("Play Style", text: $playStyle)
            }
        }
    }
}

struct UserSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingsView()
    }
}
