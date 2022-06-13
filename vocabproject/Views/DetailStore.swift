//
//  DetailStore.swift
//  vocabproject
//
//  Created by Developer on 10/06/2022.
//

import SwiftUI

struct DetailStore: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var store: Restaurant
    @State private var showReview = false
    func handlerBarButton() {
        self.showReview ? self.showReview.toggle(): dismiss()
    }
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Image(store.image)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 400)
                    .overlay (alignment: .bottomLeading) {
                        Color.black
                            .frame(height: 100)
                            .opacity(0.8)
                            .cornerRadius(20)
                            .padding()
                            .overlay {
                                VStack {
                                    Text(store.name)
                                        .font(.custom("Nunito-Bold", size: 25, relativeTo: .largeTitle))
                                    Text(store.location)
                                }
                                .foregroundColor(.white)
                                .font(.system(.headline, design: .rounded))
                            }

                    }
                HStack {
                    VStack(alignment: .leading){
                        Text(store.name)
                            .font(.custom("Nunito-Bold", size: 25))
                        Text(store.type)
                            .font(.custom("Nunito-Regular", size: 18))
                    }
                    Spacer()
                    if store.emoj != nil {
                        Image(store.emoj!.image)
                    }
                    Image(systemName: "star.fill")
                        .foregroundColor(store.isFavorite ? Color.yellow : Color.gray)
                        .onTapGesture {
                            print("Toggle star in detail")
                            store.isFavorite.toggle()
                        }
                }.padding()
                
                Text("Today I was editing a source file and I decided to widen the window a bit. I dragged too far to the right and wound up hiding the Preview")
                    .font(.custom("Nunito-Regular", size: 18))
                    .padding(.horizontal)
                Text("Today I was editing a source file and I decided to widen the window a bit. I dragged too far to the right and wound up hiding the Preview")
                    .font(.custom("Nunito-Regular", size: 18))
                    .padding(.horizontal)
            }
            Button{
                self.showReview.toggle()
            }label: {
                Text("Rate it!")
                    .font(.custom("Nunito-Bold", size: 20))
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
            .tint(Color.red)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 20))
            .controlSize(.large)
            .padding()

        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: self.showReview ? .navigationBarTrailing: .navigationBarLeading) {
                Button{
                    handlerBarButton()
                }label: {
                    self.showReview ?
                    Text("\(Image(systemName: "xmark"))")
                    :Text("\(Image(systemName: "chevron.left")) \(store.name)")
                }
                
            }
        }
        .ignoresSafeArea()
        .overlay {
            self.showReview ?
            ReviewView(isShow: $showReview, store: $store)
                .navigationBarHidden(true)
                .ignoresSafeArea()
            : nil
        }

    }
    
}

struct DetailStore_Previews: PreviewProvider {
    static var previews: some View {
        DetailStore(store: .constant(Restaurant(name: "Cafe Deadend", type: "Cafe", location: "HongKong",image: "cafedeadend", isFavorite: true)))
    }
}
