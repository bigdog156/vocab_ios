//
//  SettingView.swift
//  vocabproject
//
//  Created by Developer on 07/06/2022.
//

import SwiftUI

struct SettingView: View {
    @FetchRequest(entity: Restaurant.entity(), sortDescriptors: [])
    var restaurants: FetchedResults<Restaurant>
    @State var searchText: String = ""
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.managedObjectContext) var context
    
    private func deleteRecord(index: Int) {
        context.delete(restaurants[index])
        DispatchQueue.main.async {
            do{
                try context.save()
            }catch{
                print("Delete Error: \(error)")
            }
        }
    }
    var body: some View {
        NavigationView {
            List{
                if(restaurants.count == 0){
                    Text("Empty List ...")
                        .listRowSeparator(.hidden)
                }else {
                    ForEach(restaurants.indices, id: \.self){ index in
                        ZStack(alignment: .leading){
                            NavigationLink(destination: DetailStore(store: restaurants[index])) {
                                EmptyView()
                            }.opacity(0)
                            StoreView(store: restaurants[index] )
                        }
                        .swipeActions(edge: .leading, allowsFullSwipe: false) {
                            Button{
                                restaurants[index].isFavorite.toggle()
                                try? context.save()
                            }label: {
                                Image(systemName: "heart")
                                    .foregroundColor( restaurants[index].isFavorite ? Color.red : Color.gray)
                            }
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button{
                                deleteRecord(index: index)
                                try? context.save()
                            }label: {
                                Image(systemName: "trash.fill")
                                    .foregroundColor(.red)
                            }
                            .tint(.red)
                        }
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .navigationTitle("FoodPin")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink{
                        NewStoreView()
                    }label: {
                        Image(systemName: "doc.fill.badge.plus")
                            .foregroundColor(colorScheme == .light ? Color.gray : Color.white.opacity(0.7))
                            .padding()
                    }
                }
            }
        }
        .accentColor(.primary)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always),prompt: "Search store ..."){
            Text("\(Image(systemName: "scribble.variable")) Lam store")
                .searchCompletion("lam")
            Text("Cafe").searchCompletion("cafe")
        }
        .onChange(of: searchText) { newValue in
            if !searchText.isEmpty {
                let predicate = NSPredicate(format: "name CONTAINS[c] %@", searchText)
                restaurants.nsPredicate = predicate
            }else{
                restaurants.nsPredicate = NSPredicate(value: true)
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .preferredColorScheme(.light)
    }
}
