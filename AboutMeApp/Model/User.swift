//
//  User.swift
//  AboutMeApp
//
//  Created by Alexandr Baranov on 11.10.2023.
//

struct User {
    let username: String
    let password: String
    let photo: String
    let personalInfo: Person
    
    static func getInfo() -> User {
        User(
            username: "user",
            password: "pass",
            photo: "photo",
            personalInfo: Person.getInfo()
            )
    }
}

struct Person {
    let firstname: String
    let surname: String
    let age: Int
    let city: String
    let company: String
    let position: String
    let instagram: SocialMedia
    let spotify: SocialMedia
    let hobby: String
    let bio: String
    
    var getFullName: String {
        "\(firstname) \(surname)"
    }
    
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
            bio: "Типичный миллениал из СПБ). Работаю из дома и слежу за розовыми курьерами, иногда пишу треки. Воспитываем с женой собаку, живем обычным питерский лайфстайлом: фильтр-кофе, рамены, фо-бо, смузи сауры, булки из Вольчека(if you know you know) вот это вот все). К 28 годам становится невыносима местная зима, поэтому мечтаю стать разработчиком, чтобы эвакуироваться ближе к экватору на этот период)."
            )
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

