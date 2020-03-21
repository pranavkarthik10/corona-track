//
//  Webservice.swift
//  CoronaTrack
//
//  Created by Pranav Karthik on 2020-03-15.
//  Copyright © 2020 Pranav Karthik. All rights reserved.
//

import Foundation

class Webservice {
    
    func getCurrent(completion: @escaping ([CountryData]) -> ()) {
        
        guard let url = URL(string: "https://covid2019-api.herokuapp.com/v2/current")
            else {
                fatalError("URL is not correct!")
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            guard let data = data else { return }
            print(data)
            let countries = try! JSONDecoder().decode(Countries.self, from: data)
            let c = countries.data
            print(c[0])
            
            print("completed fetching json")
            
            DispatchQueue.main.async {
                completion(c)
            }
            
            
        }.resume()
    }
    
    func getTotal(completion: @escaping (PatientData) -> ()) {
        guard let url = URL(string: "https://covid2019-api.herokuapp.com/v2/total")
            else {
                fatalError("URL is not correct!")
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            guard let data = data else { return }
            let patient = try! JSONDecoder().decode(Total.self, from: data)
            let c = patient.data
            print(c)
            print("completed fetching json")
            
            DispatchQueue.main.async {
                completion(c)
            }
            
            
        }.resume()
        
    }
    
}

