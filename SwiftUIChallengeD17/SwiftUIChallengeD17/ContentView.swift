//
//  ContentView.swift
//  SwiftUIChallengeD17
//
//  Created by Bernardino Guerrero on 08/02/20.
//  Copyright © 2020 Bernardino Guerrero. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show alert") {
            self.showingAlert = true
        }.alert(isPresented: $showingAlert) {
            Alert(title: Text("Hello Swift UI"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
