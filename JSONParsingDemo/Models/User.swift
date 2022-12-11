    //
    //  User.swift
    //  JSONParsingDemo
    //
    //  Created by user on 27/11/2022.
    //

import Foundation

// MARK: - USER
struct User: Codable {
    let id: Int
    let email, first_name, last_name, avatar : String
}
