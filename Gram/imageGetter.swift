//
//  ImageGetter.swift
//  Gram
//
//  Created by EPF Projets Sceaux on 15/11/2019.
//  Copyright © 2019 EPF Projets Sceaux. All rights reserved.
//

import UIKit

struct imageGetter: Decodable {
    let url: URL
    let image = 
    static func getImage(Link : String) -> UIImage {
        let url = URL(string: Link)!
        var Image : UIImage?
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error { print(error); return }
            do {
               let decoder = JSONDecoder()
               // this line is only needed if all JSON keys are decoded
               decoder.keyDecodingStrategy = .convertFromSnakeCase
               let result = try decoder.decode(imageGetter.self, from: data!)
               let imageTask = URLSession.shared.dataTask(with: result.url) { (imageData, _, imageError) in
                   if let imageError = imageError { print(imageError); return }
                   DispatchQueue.main.async {
                       let apodImage = UIImage(data: imageData!)
                       Image = apodImage!
                   }
               }
               imageTask.resume()
           } catch { print(error) }
        }
        task.resume()
    }
}
