//
//  recipe.swift
//  Gram
//
//  Created by EPF Projets Sceaux on 12/11/2019.
//  Copyright © 2019 EPF Projets Sceaux. All rights reserved.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let recipe = try recipe(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.recipeTask(with: url) { recipe, response, error in
//     if let recipe = recipe {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - recipe
struct recipe: Codable {
    let name, recipeDescription, pictureID: String
    let videoID: String
    let price, id: Int
    let category: String

    enum CodingKeys: String, CodingKey {
        case name
        case recipeDescription
        case pictureID
        case videoID
        case price, id, category
    }
}

// MARK: recipe convenience initializers and mutators

extension recipe {
    init(data: Data) throws {
        self = try JSONDecoder().decode(recipe.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        name: String? = nil,
        recipeDescription: String? = nil,
        pictureID: String? = nil,
        videoID: String? = nil,
        price: Int? = nil,
        id: Int? = nil,
        category: String? = nil
    ) -> recipe {
        return recipe(
            name: name ?? self.name,
            recipeDescription: recipeDescription ?? self.recipeDescription,
            pictureID: pictureID ?? self.pictureID,
            videoID: videoID ?? self.videoID,
            price: price ?? self.price,
            id: id ?? self.id,
            category: category ?? self.category
        )
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}


// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? JSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func recipeTask(with url: URL, completionHandler: @escaping (recipe?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}
