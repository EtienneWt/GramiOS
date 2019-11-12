//
//  promotion.swift
//  Gram
//
//  Created by EPF Projets Sceaux on 12/11/2019.
//  Copyright © 2019 EPF Projets Sceaux. All rights reserved.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let promotion = try promotion(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.promotionTask(with: url) { promotion, response, error in
//     if let promotion = promotion {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - promotion
struct promotion: Codable {
    let id: Int
    let name, promotionDescription: String
    let priceValue, recipeID: JSONNull?
    let offerType: String
    let percentageValue: Int
    let numberOfArticle: JSONNull?
    let categoryID: Int
    let recipeName: JSONNull?
    let categoryName: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case promotionDescription
        case priceValue
        case recipeID
        case offerType
        case percentageValue
        case numberOfArticle
        case categoryID
        case recipeName
        case categoryName
    }
}

// MARK: promotion convenience initializers and mutators

extension promotion {
    init(data: Data) throws {
        self = try JSONDecoder().decode(promotion.self, from: data)
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
        promotionDescription: String? = nil,
        priceValue: JSONNull?? = nil,
        recipeID: JSONNull?? = nil,
        offerType: String? = nil,
        percentageValue: Int? = nil,
        numberOfArticle: JSONNull?? = nil,
        categoryID: Int? = nil,
        recipeName: JSONNull?? = nil,
        categoryName: String? = nil
    ) -> promotion {
        return promotion(
            id: id ?? self.id,
            name: name ?? self.name,
            promotionDescription: promotionDescription ?? self.promotionDescription,
            priceValue: priceValue ?? self.priceValue,
            recipeID: recipeID ?? self.recipeID,
            offerType: offerType ?? self.offerType,
            percentageValue: percentageValue ?? self.percentageValue,
            numberOfArticle: numberOfArticle ?? self.numberOfArticle,
            categoryID: categoryID ?? self.categoryID,
            recipeName: recipeName ?? self.recipeName,
            categoryName: categoryName ?? self.categoryName
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

    func promotionTask(with url: URL, completionHandler: @escaping (promotion?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
