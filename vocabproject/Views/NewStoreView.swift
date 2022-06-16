//
//  NewStoreView.swift
//  vocabproject
//
//  Created by Developer on 13/06/2022.
//

import SwiftUI
import Combine

struct NewStoreView: View {
    
    //State Form Restaurant
    @ObservedObject private var store: RestaurantFormViewModel
    @Environment(\.managedObjectContext) var context
    
    init(){
        let viewModel = RestaurantFormViewModel()
        viewModel.image = UIImage(named: "newphoto")!
        store = viewModel
    }
        
    ///Source Image : Photo and Camera
    @State private var showPhotoOptions = false
    @State private var showPicker = false
    @State private var showCamera = false

    @State private var photoSource: PhotoSource?
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Image(uiImage: store.image!)
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 200)
                        .background(Color.red)
                        .cornerRadius(20)
                        .onTapGesture {
                            self.showPhotoOptions.toggle()
                        }
                    TextFormField(label: "Name", placeholder: "Fill name Store", value: $store.name)
                    TextFormField(label: "Location", placeholder: "Your location...", value: $store.location)
                    TextFormField(label: "Type", placeholder: "Type Store ... Food, Drink", value: $store.type)
                    TextFormField(label: "Phone", placeholder: "Phone your Store", value: $store.phone)

                    FormTextField(label: "Description", value: $store.info)
                    
                    Button{
                        //MARK:Todo
                    }label: {
                        Text("Create Store")
                            .font(.custom("Nunito-Bold", size: 20))
                            .frame(minWidth: 0, maxWidth: .infinity)

                    }
                    .padding(.horizontal)
                    .tint(Color.red)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)

                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("New Store")
                        .fontWeight(.semibold)
                        .font(.custom("Nunito-Bold", size: 20))
                        .foregroundColor(Color.red)
                    }
                ToolbarItem(placement: .navigationBarLeading) {
                                    Image(systemName: "arrowshape.turn.up.backward")
                                        .foregroundColor(Color.red)
                                        .onTapGesture {
                                            dismiss()
                                        }
                            }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("Save")
                        .font(.custom("Nunito-Bold", size: 20))
                        .foregroundColor(Color.red)
                        .onTapGesture {
                            print("Save ... ")
                            saveStore()
                        }
                    }
            }
            .fullScreenCover(item: $photoSource, content: { Source in
                switch Source{
                case .photoLibrary:
                    ImagePicker(image: $store.image)
                case .camera:
                    CameraPicker(image:  $store.image)
                        .ignoresSafeArea()
                }
            })
            .confirmationDialog(
                Text("Choose your photo source"),
                isPresented: $showPhotoOptions)
            {
                Button("Camera") {
                    self.photoSource = .camera
                }
                Button("Library") {
                    self.photoSource = .photoLibrary
                }
                Button("Cancel", role: .cancel){
                    print("Dismiss \(showPhotoOptions)")
                }

            }message: {
                Text("Choose your source photo")
            }
        }
        .navigationBarHidden(true)
        .padding(.horizontal)
    }
    
    //MARK: Function save to Persistence Data
    private func saveStore(){
        
        let newStore = Restaurant(context: context)
        newStore.addRestaurant(
            name: store.name,
            location: store.location,
            type: store.type,
            phone: store.phone,
            info: store.info, image: (store.image?.pngData()!)!
        )
        
        do{
            try context.save()
        }catch{
            print("Failed to save the record...")
            print(error.localizedDescription)
        }
        
    }
    
}

struct NewStoreView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NewStoreView()
                .previewDevice("iPhone 12 Pro")
            TextFormField(label: "Name", placeholder: "Finoll name Store", value: .constant(""))
                .previewLayout(.fixed(width: 300, height: 200))
            FormTextField(label: "Description", value: .constant(""))
                .previewLayout(.fixed(width: 400, height: 300))
        }
    }
}
