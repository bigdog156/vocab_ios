//
//  NewStoreView.swift
//  vocabproject
//
//  Created by Developer on 13/06/2022.
//

import SwiftUI

struct NewStoreView: View {
    
    @State var storeName = ""
    @State var location = ""
    @State var type = ""
    @State var phone = ""

    @State var desciption = ""
    @State private var storeImage = UIImage(named: "newphoto")!
    
    ///Source Image : Photo and Camera
    @State private var showPhotoOptions = false
    @State private var photoSource: PhotoSource?
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Image(uiImage: storeImage)
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 200)
                        .background(Color.red)
                        .cornerRadius(20)
                        .onTapGesture {
                            self.showPhotoOptions.toggle()
                        }
                    TextFormField(label: "Name", placeholder: "Fill name Store", value: $storeName)
                    TextFormField(label: "Location", placeholder: "Your location...", value: $location)
                    TextFormField(label: "Type", placeholder: "Type Store ... Food, Drink", value: $type)
                    TextFormField(label: "Phone", placeholder: "Phone your Store", value: $phone)

                    FormTextField(label: "Description", value: $desciption)
                    
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
                                HStack {
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(Color.red)
                                    Text("New Store")
                                        .fontWeight(.semibold)
                                        .font(.custom("Nunito-Bold", size: 20))
                                        .foregroundColor(Color.red)
                                    
                                }
                            }
                ToolbarItem(placement: .navigationBarLeading) {
                                    Image(systemName: "arrowshape.turn.up.backward")
                                        .foregroundColor(Color.red)
                                        .onTapGesture {
                                            dismiss()
                                        }
                            }
            }
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
                    print("Dismiss")
                }
                
            }message: {
                Text("Choose your source photo")
            }
        }
        .navigationBarHidden(true)
        .padding(.horizontal)
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
