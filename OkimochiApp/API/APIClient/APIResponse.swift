//
//  APIResponse.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/02/04.
//

protocol APIResponse {
    associatedtype Response: Decodable
    var para: [String: Any] { get }
}
