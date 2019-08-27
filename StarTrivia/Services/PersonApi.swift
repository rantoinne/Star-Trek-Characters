//
//  PersonApi.swift
//  StarTrivia
//
//  Created by Ravi on 21/08/19.
//  Copyright © 2019 Ravi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PersonApi {
    
//    Web request with Alamofire and Codable
    func getRandomPersonAlamo(id: Int, completion: @escaping PersonResponseCompletion) {
        guard let url = URL(string: "\(PERSON_URL)\(1)") else { return }
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else { return completion(nil) }
            let jsonDecoder = JSONDecoder()
            do {
                let person = try jsonDecoder.decode(Person.self, from: data)
                print("Some Data \(person)")
                completion(person)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
//    Web request with alamofire and swiftyjson
//    func getRandomPersonAlamo(id: Int, completion: @escaping PersonResponseCompletion) {
//        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
//        Alamofire.request(url).responseJSON { (response) in
//            if let error = response.result.error {
//                debugPrint(error.localizedDescription)
//                completion(nil)
//                return
//            }
//
//            guard let data = response.data else { return completion(nil) }
//
//            do {
//                let json = try JSON(data: data)
//                let person = self.parsePersonSwifty(json: json)
//                completion(person)
//            } catch {
//                debugPrint(error.localizedDescription)
//                completion(nil)
//            }
//        }
//    }
    
//    Parsing with Alamofire
//    func getRandomPersonAlamo(id: Int, completion: @escaping PersonResponseCompletion) {
//        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
//        Alamofire.request(url).responseJSON { (response) in
//            if let error = response.result.error {
//                debugPrint(error.localizedDescription)
//                completion(nil)
//                return
//            }
//
//            guard let json = response.result.value as? [String: Any] else { return
//                completion(nil)
//            }
//            let person = self.parsePersonManual(json: json)
//            completion(person)
//        }
//    }
    
//    Web Request with URLSession
    func getRandomPersonUrlSession(id: Int, completion: @escaping PersonResponseCompletion) {
        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                debugPrint(error.debugDescription)
                completion(nil)
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = jsonAny as? [String: Any] else { return }
                let person = self.parsePersonManual(json: json)
                DispatchQueue.main.async {
                    completion(person)
                }
            } catch {
                debugPrint(error.localizedDescription)
                return
            }
        }
        task.resume()
    }
    
//    Parsing with Swifty
    private func parsePersonSwifty(json: JSON) -> Person {
        let name = json["name"].stringValue
        let height = json["height"].stringValue
        let mass = json["mass"].stringValue
        let hair = json["hair_color"].stringValue
        let birthYear = json["birth_year"].stringValue
        let gender = json["gender"].stringValue
        let homeWorldUrl = json["homeworld"].stringValue
        let filmUrls = json["films"].arrayValue.map({$0.stringValue})
        let vehicleUrls = json["vehicles"].arrayValue.map({$0.stringValue})
        let startshipUrls = json["starships"].arrayValue.map({$0.stringValue})
        
        let person = Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeWorldUrl: homeWorldUrl, filmUrls: filmUrls, vehicleUrls: vehicleUrls, starshipUrls: startshipUrls)
        
        return person
    }
    
//    Parsing Manually
    private func parsePersonManual(json: [String: Any]) -> Person {
        let name = json["name"] as? String ?? ""
        let height = json["height"] as? String ?? ""
        let mass = json["mass"] as? String ?? ""
        let hair = json["hair_color"] as? String ?? ""
        let birthYear = json["birth_year"] as? String ?? ""
        let gender = json["gender"] as? String ?? ""
        let homeWorldUrl = json["homeworld"] as? String ?? ""
        let filmUrls = json["films"] as? [String] ?? [String]()
        let vehicleUrls = json["vehicles"] as? [String] ?? [String]()
        let startshipUrls = json["starships"] as? [String] ?? [String]()
        
        let person = Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeWorldUrl: homeWorldUrl, filmUrls: filmUrls, vehicleUrls: vehicleUrls, starshipUrls: startshipUrls)
        
        return person
    }
}
