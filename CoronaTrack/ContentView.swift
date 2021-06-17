//
//  ContentView.swift
//  CoronaTrack
//
//  Created by Pranav Karthik on 2020-03-13.
//  Copyright © 2020 Pranav Karthik. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = CountryListViewModel()
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
            HStack{
                Image(systemName: "magnifyingglass")
                TextField("Search for countries", text: $searchText)
                
            }.padding()
                List(model.countries.filter{$0.location.hasPrefix(searchText) || searchText == "" }, id: \.self) {country in
                VStack {
                    HStack {
                        Text(country.location).bold()
                        Spacer()
                    }
                    HStack {
                        ZStack {
                            Rectangle().foregroundColor(Color.blue).cornerRadius(10)
                            HStack {
                                Image(systemName: "staroflife").foregroundColor(Color.white)
                                Text(String(country.confirmed)).foregroundColor(Color.white)
                            }.padding(.vertical, 20)
                        }.padding()
                        ZStack {
                            Rectangle().foregroundColor(Color.red).cornerRadius(10)
                            HStack {
                                Image("skullicon").foregroundColor(Color.white)
                                Text(String(country.deaths)).foregroundColor(Color.white)
                            }.padding(.vertical, 20)
                        }.padding()
                    }
                    ZStack {
                        Rectangle().foregroundColor(Color.green).cornerRadius(CGFloat(10))
                        HStack {
                            Image(systemName: "heart").foregroundColor(Color.white)
                            Text(String(country.recovered)).foregroundColor(Color.white)
                        }.padding(.vertical, 20)
                    }.padding()
                }
            }
            .navigationBarTitle(Text("CoronaTrack"))
        }
    }
}

//struct CountryRow: View {
//
//
//}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
}
