//
//  ContentView.swift
//  vocabproject
//
//  Created by Developer on 07/06/2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        VStack (spacing: 20){
            VStack {
                Text("Instant Developer")
                    .fontWeight(.medium)
                    .font(.system(size: 40))
                .foregroundColor(.indigo)
                Text("Get help from experts in 15 minutes")
            }
            
            
            HStack (alignment: .center, spacing: 20){
                Image("user1")
                    .resizable()
                .scaledToFit()
                
                Image("user2")
                    .resizable()
                .scaledToFit()

                Image("user3")
                    .resizable()
                .scaledToFit()

            }.padding(.horizontal, 20)
            
            Text("Need help with coding problems? Register!")
            
            Spacer()
            if verticalSizeClass == .compact{
                HSignUpButtonGroup()
            } else{
                VSignUpButtonGroup()
            }
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)

        }
        .background{
            Image("background")
                .resizable()
                .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
                .previewDisplayName("iPhone 12 Pro")
                .previewInterfaceOrientation(.portrait)
            
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
            .previewInterfaceOrientation(.landscapeRight)
        }
    }
}

struct VSignUpButtonGroup: View {
    var body: some View {
        VStack {
            Button{
                
            }label: {
                Text("Sign Up")
                    .fontWeight(.heavy)
            }
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(Color.indigo)
            .cornerRadius(10)
            
            Button{
                
            }label: {
                Text("Log in")
                    .fontWeight(.heavy)
            }
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(Color.gray)
            .cornerRadius(10)
            
        }
    }
}
struct HSignUpButtonGroup: View {
    var body: some View {
        HStack {
            Button{
                
            }label: {
                Text("Sign Up")
                    .fontWeight(.heavy)
            }
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(Color.indigo)
            .cornerRadius(10)
            
            Button{
                
            }label: {
                Text("Log in")
                    .fontWeight(.heavy)
            }
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(Color.gray)
            .cornerRadius(10)
            
        }.padding(.horizontal, 200)
    }
}
