//
//  ReviewView.swift
//  vocabproject
//
//  Created by Developer on 11/06/2022.
//

import SwiftUI

struct ReviewView: View {
    @Binding var isShow: Bool
    @State var isEmoj: Bool = false
    @ObservedObject var store: Restaurant
    var body: some View {
        ZStack{
            if let image = store.image {
                Image(uiImage: UIImage(data: image) ?? UIImage())
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .ignoresSafeArea()
            }
            Color.black
                .opacity(0.4)
                .background(.ultraThinMaterial)
                .ignoresSafeArea()
            
            VStack(alignment: .leading){
                ForEach(Restaurant.Rating.allCases, id: \.self){ rating in
                    HStack {
                        Image(rating.image)
                        Text(rating.rawValue.capitalized)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .onTapGesture {
                        store.rating = rating
                        self.isEmoj.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                            isShow.toggle()
                        }
                        print("Store Emoj: \(String(describing: store.ratingText))")
                    }
                    .opacity(isEmoj ? 1.0 : 0)
                    .offset(x: isEmoj ? 0: 100)
                    .animation(.easeInOut.delay(Double(Restaurant.Rating.allCases.firstIndex(of: rating)!) * 0.05), value: isEmoj)
                }
            }
            
        }
        .onAppear{
            isEmoj.toggle()
        }
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView(isShow: .constant(true), store: (PersistenceController.testData?.first)!)
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
            .previewDisplayName("iPhone 12 Pro")
    }
}
