//
//  CountryListViewModel.swift
//  CoronaTrack
//
//  Created by Pranav Karthik on 2020-03-15.
//  Copyright © 2020 Pranav Karthik. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class CountryListViewModel: ObservableObject {
    
    init() {
        fetchCountries()
    }

    @Published var countries = [CountryData]()
    
    private func fetchCountries() {
        Webservice().getCurrent {data in
            self.countries = data
        }
    }
    
    
}
