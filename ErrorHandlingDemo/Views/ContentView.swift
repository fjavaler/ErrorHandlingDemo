//
//  ContentView.swift
//  ErrorHandlingDemo
//
//  Created by Frederick Javalera on 10/27/21.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var vm: ContentViewModel
  var body: some View {
    ZStack {
      LinearGradient(colors: [.gray, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
        .ignoresSafeArea()
      
      VStack {
        VStack (alignment: .leading) {
          TextField("", text: $vm.applicationNumber, prompt: Text("Enter An Application Number"))
            .onChange(of: vm.applicationNumber) { newValue in
              vm.validate(newValue)
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.gray))
        }
        
        VStack(alignment: .center) {
          Label("Error Message", systemImage: "xmark.octagon")
            .opacity(vm.showErrorMessage ? 1 : 0)
            .font(.title)
            .foregroundColor(Color.red)
          
          Text(vm.errorText)
            .foregroundColor(Color.red)
            .font(.body)
        }
      }
      .padding(.horizontal)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(ContentViewModel())
  }
}
