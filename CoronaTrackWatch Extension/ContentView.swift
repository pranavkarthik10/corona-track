//
//  ContentView.swift
//  CoronaTrackWatch Extension
//
//  Created by Pranav Karthik on 2020-03-16.
//  Copyright © 2020 Pranav Karthik. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var model = CountryListViewModel()
    
    var body: some View {
        List(model.countries, id: \.self) {country in
        VStack {
            HStack {
                Text(country.location).bold()
                Spacer()
            }
            VStack {
                ZStack {
                    Rectangle().foregroundColor(Color.blue).cornerRadius(10)
                    HStack {
                        Image(systemName: "staroflife").foregroundColor(Color.white)
                        Text(String(country.confirmed)).foregroundColor(Color.white)
                    }
                }
                ZStack {
                    Rectangle().foregroundColor(Color.red).cornerRadius(10)
                    HStack {
                        Image("skullicon").foregroundColor(Color.white)
                        Text(String(country.deaths)).foregroundColor(Color.white)
                    }
                }
                ZStack {
                    Rectangle().foregroundColor(Color.green).cornerRadius(CGFloat(10))
                    HStack {
                        Image(systemName: "heart").foregroundColor(Color.white)
                        Text(String(country.recovered)).foregroundColor(Color.white)
                    }
                }
                Spacer()
            }
    }
}
    }
    
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
