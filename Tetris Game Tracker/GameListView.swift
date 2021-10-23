//
//  GameListView.swift
//  Tetris Game Tracker
//
//  Created by Jay Miller on 10/22/21.
//

import SwiftUI

struct GameListView: View {
@Environment(\.managedObjectContext) private var viewContext
@FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \Game.timestamp, ascending: true)],
    animation: .default)
private var games: FetchedResults<Game>

var body: some View {
        List {
            ForEach(games) { game in
                NavigationLink {
                    
                } label: {
                    Text(game.timestamp!, formatter: itemFormatter)
                }
            }
            .onDelete(perform: deleteItems)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
            ToolbarItem {
                NavigationLink(destination: NewGameView()) {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
        Text("Select an item")
    }



private func deleteItems(offsets: IndexSet) {
    withAnimation {
        offsets.map { games[$0] }.forEach(viewContext.delete)

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

private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()


struct GameListView_Preview: PreviewProvider {
static var previews: some View {
    GameListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
}

