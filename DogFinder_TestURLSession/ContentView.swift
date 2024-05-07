//
//  ContentView.swift
//  DogFinder_TestURLSession
//
//  Created by Gerson Janhuel on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        
        VStack {
           
            AsyncImage(url: URL(string: "\(viewModel.dogImage.imageURL)")) { theDogImage in
                theDogImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 250)
                    .clipped()
        
            } placeholder: {
                Rectangle()
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .frame(width: 250, height: 250)
            .padding(.bottom, 50)
            
            
            
            Button {
                Task {
                    await viewModel.getDogImage()
                }
                
            } label: {
                Text("Get Dog Image")
            }
            .buttonStyle(BorderedProminentButtonStyle())

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
