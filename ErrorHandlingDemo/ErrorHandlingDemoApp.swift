//
//  ErrorHandlingDemoApp.swift
//  ErrorHandlingDemo
//
//  Created by Frederick Javalera on 10/27/21.
//

import SwiftUI

@main
struct ErrorHandlingDemoApp: App {
  @StateObject var viewModel: ContentViewModel = ContentViewModel()
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(viewModel)
    }
  }
}
