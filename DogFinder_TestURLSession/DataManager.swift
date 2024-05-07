//
//  DataManager.swift
//  DogFinder_TestURLSession
//
//  Created by Gerson Janhuel on 07/05/24.
//

import Foundation

struct DogImage: Codable {
    enum CodingKeys: String, CodingKey {
        case imageURL = "message"
    }
    
    var imageURL: String
}


class DataManager {
    let apiURL = URL(string: "https://dog.ceo/api/breeds/image/random")!
    
    static let shared = DataManager()
    
    func getDogImage() async throws -> DogImage {
        
        let (data, _) = try await URLSession.shared.data(from: apiURL)
        
        let dogImage = try JSONDecoder().decode(DogImage.self, from: data)
        
        return dogImage
    }
    
    
    // This is for demoi: JSON encoder & decoder
    func processExampleData() {
        // ENCODE
        let person = Person(name: "Budi", gender: "Male", website: "http://testlink.com")
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try! encoder.encode(person)
        print(String(data: data, encoding: .utf8)!)
        
        
        // DECODE
        let jsonString = """
        {
            "name": "Budi",
            "gender": "Male",
            "url": "http://urlrulrul.com"
        }
        """
        let jsonData = jsonString.data(using: .utf8)!
        let personDecoded = try! JSONDecoder().decode(Person.self, from: jsonData)
        print(personDecoded)
    }
}

// This struct is only for extra example for function processExampleData()
struct Person: Codable {
    enum CodingKeys: String, CodingKey {
        case name, gender
        case website = "url"
    }
    
    var name: String
    var gender: String
    var website: String
}

