//
//  Store.swift
//  vocabproject
//
//  Created by Developer on 09/06/2022.
//

import SwiftUI

struct StoreView: View {

    @ObservedObject var store: Restaurant
    
    @State private var showOptions = false
    @State private var showActionSheet = false
    @State private var showAlert = false
    @State private var showSheet = false

    var body: some View {
        HStack{
            if let image = store.image{
                Image(uiImage: UIImage(data: image) ?? UIImage())
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90, height: 90)
                    .clipShape(RoundedRectangle(cornerRadius: 20))

            }
                        
            VStack (alignment:.leading, spacing: 10){
                
                Text(store.name)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                
                VStack ( alignment: .leading ){
                    Text("Location: \(store.location)")
                    Text("Type: \(store.type)")
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.gray)
                }
                
            }
            Spacer()
            Image(systemName: "star.fill")
                .foregroundColor(store.isFavorite ? Color.indigo: Color.gray)
        }
        .confirmationDialog(
            Text("Star Store"),
            isPresented: $showActionSheet)
        {
            Button("Star Store",role: .cancel){
                store.isFavorite.toggle()
            }
            Button("None Star",role: .destructive){
                showAlert.toggle()
            }
                
        }message: {
            VStack{
                Text("Star Store please ? ")
            
            }.padding(50)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Are you sure?"), message: Text("Do you want quick jod?") , primaryButton: .default(Text("Ok"), action: {
                showSheet.toggle()
            }), secondaryButton: .cancel())
        }
        .contextMenu {
            Button{
                self.store.isFavorite.toggle()
            }label: {
                HStack{
                    Text("Cheer Star to Store... ")
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                }
            }
        }
        .sheet(isPresented: $showSheet) {
            let defaultText = "Just kidding me ... !"
            if let image = store.image,
            let imageToShare = UIImage(data: image){
                ActivityView(activityItems: [defaultText, imageToShare])
            } else{
                ActivityView(activityItems: [defaultText])
            }
        }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView(store: (PersistenceController.testData?.first)!)
    }
}
