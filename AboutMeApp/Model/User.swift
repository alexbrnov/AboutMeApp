//
//  User.swift
//  AboutMeApp
//
//  Created by Alexandr Baranov on 11.10.2023.
//

import Foundation

import Foundation

struct User {
    let username: String
    let password: String
    let photo: String
    let personalInfo: Person
    
    static func getInfo() -> User {
        User(
            username: "user",
            password: "pass",
            photo: "",
            personalInfo: Person.getInfo()
            )
    }
}

struct Person {
    // Name & age
    let firstname: String
    let surname: String
    let age: Int
    let city: String
    // Current job
    let company: String
    let position: String
    // Social media
    let instagram: SocialMedia
    let spotify: SocialMedia
    // Outside interest
    let hobby: String
    let bio: String
    
    static func getInfo() -> Person {
        Person(
            firstname: "Александр",
            surname: "Баранов",
            age: 28,
            city: "Санкт-Петербург",
            company: "Самокат",
            position: "Kоординатор",
            instagram: .instagram,
            spotify: .spotify,
            hobby: "Электронная музыка",
            bio: "Родился в городе Вятка(Киров)"
            )
    }
    
    var getFullName: String {
        "\(firstname) \(surname)"
    }
}

enum SocialMedia: String {
    case instagram = "sashabrnov"
    case spotify = "Rough Peach"
    
    var url: String {
        switch self {
        case .instagram:
            return "https://www.instagram.com/sashabrnov"
        case .spotify:
            return "https://open.spotify.com/artist/66uphUJlKvZpFKyuX7AGOo"
        }
    }
}

