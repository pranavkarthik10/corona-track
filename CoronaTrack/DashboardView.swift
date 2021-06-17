//
//  DashboardView.swift
//  CoronaTrack
//
//  Created by Pranav Karthik on 2020-03-15.
//  Copyright © 2020 Pranav Karthik. All rights reserved.
//

import Foundation
import SwiftUI
import SwiftUICharts

struct DashboardView: View {
    
    @ObservedObject var model = TotalViewModel()
    
    let patients: [Patient]
    
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle().foregroundColor(.blue).cornerRadius(25)
                    VStack {
                        HStack {
                            ZStack {
                                Rectangle().cornerRadius(25).foregroundColor(.init(.sRGB, white: 1.0, opacity: 0.6)).frame(maxHeight:0.05*UIScreen.main.bounds.height )
                                Text("Confirmed").font(.headline).bold().foregroundColor(.white)
                            }.padding()
                            Spacer()
                        }
                        Text(String(Int(model.patients.confirmed))).font(.title).bold().foregroundColor(.white)
                        Spacer()
                    }
                }.shadow(radius: 10).padding().frame(minHeight: 0, maxHeight: 0.3*UIScreen.main.bounds.height).cornerRadius(25)
                ZStack {
                    Rectangle().foregroundColor(.red).cornerRadius(25)
                    VStack {
                        HStack {
                            ZStack {
                                Rectangle().cornerRadius(25).foregroundColor(.init(.sRGB, white: 1.0, opacity: 0.6)).frame(maxHeight:0.05*UIScreen.main.bounds.height )
                                Text("Deaths").font(.headline).bold().foregroundColor(.white)
                            }.padding()
                            Spacer()
                        }
                        Text(String(Int(model.patients.deaths))).font(.title).bold().foregroundColor(.white)
                        Spacer()
                    }
                }.shadow(radius: 10).padding().frame(minHeight: 0, maxHeight: 0.3*UIScreen.main.bounds.height).cornerRadius(25)
                ZStack {
                    Rectangle().foregroundColor(.green).cornerRadius(25)
                    VStack {
                        HStack {
                            ZStack {
                                Rectangle().cornerRadius(25).foregroundColor(.init(.sRGB, white: 1.0, opacity: 0.6)).frame(maxHeight:0.05*UIScreen.main.bounds.height )
                                Text("Recovered").font(.headline).bold().foregroundColor(.white)
                            }.padding()
                            Spacer()
                        }
                        Text(String(Int(model.patients.recovered))).font(.title).bold().foregroundColor(.white)
                        Spacer()
                    }
                }.shadow(radius: 10).padding().frame(minHeight: 0, maxHeight: 0.3*UIScreen.main.bounds.height).cornerRadius(25)
                
//                HStack(alignment: .lastTextBaseline) {
//                    BarView(type: "Confirmed", vvalue: model.patients.confirmed, color: Color.blue)
//                    BarView(type: "Deaths", vvalue: model.patients.deaths, color: Color.red)
//                    BarView(type: "Recovered", vvalue: model.patients.recovered, color: Color.green)
////                    ForEach(self.patients, id: \.type) { patient in
////                        BarView(patient: patient)
////                    }
//                }
            Spacer()
                .navigationBarTitle(Text("Dashboard"))
            }
        }
    }
}

struct BarView: View {
    
    let type: String
    let vvalue: Int
    let color: Color
    
    var body: some View {
        
        let value = vvalue / 500000
        let yValue = Swift.min(value * 20, 600)
        
        return VStack {
            
            Text(String(Int(vvalue)))
            Rectangle()
                .fill(color)
                .frame(width: 100, height: CGFloat(yValue))
            Text(type)
        }
    }
    
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(patients: Patient.all())
    }
}
