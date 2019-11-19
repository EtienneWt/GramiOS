//
//  category.swift
//  Gram
//
//  Created by EPF Projets Sceaux on 12/11/2019.
//  Copyright © 2019 EPF Projets Sceaux. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let category = try Category(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.categoryTask(with: url) { category, response, error in
//     if let category = category {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Category
struct Category: Codable {
    let id: Int
    let name, imageID: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageID = "image_id"
    }
}

// MARK: Category convenience initializers and mutators

extension Category {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Category.self, from: data)
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
        id: Int? = nil,
        name: String? = nil,
        imageID: String? = nil
    ) -> Category {
        return Category(
            id: id ?? self.id,
            name: name ?? self.name,
            imageID: imageID ?? self.imageID
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
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func categoryTask(with url: URL, completionHandler: @escaping (Category?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}
