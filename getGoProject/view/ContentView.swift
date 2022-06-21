//
//  ContentView.swift
//  getGoProject
//
//  Created by bevan christian on 20/06/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var homeVM = HomeViewModel()
    @State var isError = false
    @State var errorMessage = ""
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List(homeVM.characterResult) { data in
                        NavigationLink {
                            DetailView(data: DetailModel(name: data.name, type: data.type, gender: data.gender, location: data.location?.name, origin: data.origin?.name, image: data.image))
                        } label: {
                            ListCard(name: data.name, spesies: data.species, status: data.status)
                                .onAppear {
                                    loadMore(currentData: data)
                                }
                        }
                    }.listStyle(.plain)
                }
                .navigationTitle(Text("Home"))
                .onAppear {
                    homeVM.loadData()
                }
                .onReceive(homeVM.$apiError) { err in
                    if let message = err?.description {
                        isError = true
                        errorMessage = message
                    }
                }
                if isError {
                    ErrorAlert(errorAlert: $errorMessage)
                }
            }
        }
        
    }
    
    func loadMore(currentData: charResult?) {
        if (self.homeVM.characterResult.last == currentData){
            print("load more")
            homeVM.loadMore()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
