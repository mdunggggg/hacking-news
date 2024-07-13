//
//  ContentView.swift
//  Hacking News
//
//  Created by ImDung on 21/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts){
                item in
                NavigationLink(destination: DetailView(url: item.url)) {
                    HStack {
                        Text(String(item.points))
                        Text(item.title)
                    }
                }
                
            }.navigationTitle("Hacking News")
            
        }
        .onAppear(perform: {
            networkManager.fetchData()
        })
    }
}

#Preview {
    ContentView()
}

