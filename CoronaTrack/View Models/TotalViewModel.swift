//
//  TotalViewModel.swift
//  CoronaTrack
//
//  Created by Pranav Karthik on 2020-03-15.
//  Copyright © 2020 Pranav Karthik. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class TotalViewModel: ObservableObject {
    
    init() {
        fetchTotal()
    }

    @Published var patients: PatientData = PatientData(confirmed: 0, deaths: 0, recovered: 0)
    
    private func fetchTotal() {
        Webservice().getTotal {data in
            self.patients = data
            print(self.patients)
        }
    }
    
    
}
