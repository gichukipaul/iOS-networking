//
//  ResponseResult.swift
//  JSONParsingDemo
//
//  Created by user on 27/11/2022.
//

import Foundation

//MARK: - API RESPONSE RESULT
struct ResponseResult: Decodable{
    let page, per_page, total, total_pages : Int
    let data: [User]
    let support : Support
}
