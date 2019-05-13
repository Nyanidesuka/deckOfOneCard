//
//  PersonController.swift
//  deckOfOneCard
//
//  Created by Haley Jones on 5/13/19.
//  Copyright © 2019 HaleyJones. All rights reserved.
//

import Foundation

class PersonController{
    
    static let shared = PersonController()
    let baseURL = "https://swapi.co/api/"
    //MARK: CRUD
    func fetchPersonWith(identifier: Int, completion: @escaping (Person?) -> Void){
        guard var fetchURL = URL(string: baseURL) else {completion(nil); return}
        fetchURL.appendPathComponent("people")
        fetchURL.appendPathComponent("\(identifier)")
        
        let dataTask = URLSession.shared.dataTask(with: fetchURL) { (data, _, error) in
            if let anError = error{
                print(error?.localizedDescription)
                completion(nil)
                return
            }
            guard let data = data else {completion(nil); return}
            let decoder = JSONDecoder()
            do{
                let decodedData = try decoder.decode(Person.self, from: data)
                completion(decodedData)
            } catch {
                print(error.localizedDescription)
                completion(nil)
                return
            }
        }
        dataTask.resume()
    }
}
