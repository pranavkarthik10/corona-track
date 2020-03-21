//
//  AppView.swift
//  CoronaTrack
//
//  Created by Pranav Karthik on 2020-03-15.
//  Copyright © 2020 Pranav Karthik. All rights reserved.
//

import Foundation
import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            DashboardView(patients: Patient.all())
            .tabItem {
                Image(systemName: "globe")
                Text("Dashboard")
            }
            
            ContentView()
            .tabItem {
                    Image(systemName: "list.dash")
                    Text("Countries")
                }

        }
    }
}
