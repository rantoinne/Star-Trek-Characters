//
//  StarshipApi.swift
//  StarTrivia
//
//  Created by Ravi on 27/08/19.
//  Copyright © 2019 Ravi. All rights reserved.
//

import Foundation
import Alamofire

class StarshipApi {
    func getStarship(url: String, completion: @escaping StarshipResponseCompletion) {
        guard let url = URL(string: url) else { return }
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else {
                return completion(nil)
            }
            
            let jsonDecoder = JSONDecoder()
            do {
                let starship = try jsonDecoder.decode(Starship.self, from: data)
                completion(starship)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
