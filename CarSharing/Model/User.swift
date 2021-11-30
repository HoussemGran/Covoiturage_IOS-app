//
//  User.swift
//  CarSharing
//
//  Created by Bouabid Wassim on 30/11/2021.
//

import Foundation


struct User: Codable {

    enum CodingKeys: String, CodingKey {
        case id
        case login
        case email
        case password
    }

    var id: Int?
    var login: String?
    var email: String?
    var password: String?

    

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        email = try container.decodeIfPresent(String.self, forKey: .email)
        login = try container.decodeIfPresent(String.self, forKey: .login)
        password = try container.decodeIfPresent(String.self, forKey: .password)
    }
}

