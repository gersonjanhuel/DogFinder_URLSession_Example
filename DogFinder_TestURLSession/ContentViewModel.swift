//
//  ContentViewModel.swift
//  DogFinder_TestURLSession
//
//  Created by Gerson Janhuel on 07/05/24.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var dogImage: DogImage = DogImage(message: "")
    
    @MainActor
    func getDogImage() async {
        do {
            dogImage = try await DataManager.shared.getDogImage()
        } catch {
            print("Oopsss! Error fetching dog image. \(error.localizedDescription)")
        }
        
        
        
    }
}



