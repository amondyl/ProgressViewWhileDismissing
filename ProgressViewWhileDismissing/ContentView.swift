//
//  ContentView.swift
//  ProgressViewWhileDismissing
//
//  Created by Klaus Menning on 12.02.23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var myStates: MyStates
    var body: some View {
        
        VStack {
            Button(action: {
                //showingSheet.toggle()
                myStates.inProgress = true
                myStates.toPresent = true
            }) {
                HStack {
                    Image(systemName: "music.mic").renderingMode(.original).font(.system(size: 80, weight: .ultraLight)).sheet(isPresented: $myStates.toPresent) {
                        SingerOverView()
                    }
                    Text("Go Ahead").font(.system(size: 20))
                }
            }
        }
        .padding()
    }
}


struct HomeButtonView: View {
    @EnvironmentObject var myStates : MyStates
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button(action: {
            myStates.inProgress = true
            myStates.toPresent = false
            dismiss()
        }, label: {
            Image(systemName: "house")
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
