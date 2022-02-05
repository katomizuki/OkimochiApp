//
//  APIResponse.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/02/04.
//

import Foundation

protocol APIResponse {
    associatedtype Response: Decodable
    var para: [String: Any] { get }
}
