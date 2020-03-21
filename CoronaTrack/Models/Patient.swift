//
//  Patient.swift
//  CoronaTrack
//
//  Created by Pranav Karthik on 2020-03-15.
//  Copyright © 2020 Pranav Karthik. All rights reserved.
//

import Foundation
import SwiftUI

var confirmed = 0
var deaths = 0
var recovered = 0

var patientData: PatientData = PatientData(confirmed: 0, deaths: 0, recovered: 0)


struct Total: Decodable {
    private enum CodingKeys : String, CodingKey { case data = "data"}
    let data: PatientData
}

struct PatientData: Codable, Hashable {
    var confirmed: Int
    var deaths: Int
    var recovered: Int
}

struct Patient {
    let type: String
    var value: Int
    let color: Color
}

extension Patient {
    static func all() -> [Patient] {
        
        Webservice().getTotal {a in
            print(a)
            patientData = a
        }
        
        return [
            Patient(type: "Confirmed", value: patientData.confirmed, color: Color.blue),
            Patient(type: "Deaths", value: patientData.deaths, color: Color.red),
            Patient(type: "Recovered", value: patientData.recovered, color: Color.green),
            
        
        ]
    }
}
