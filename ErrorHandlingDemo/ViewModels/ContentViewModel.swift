//
//  ContentViewModel.swift
//  ErrorHandlingDemo
//
//  Created by Frederick Javalera on 10/27/21.
//

import Foundation
import UIKit

class ContentViewModel: ObservableObject {
  @Published var errorText = ""
  @Published var applicationNumber = ""
  @Published var showErrorMessage: Bool = false
  
  // Validate string newValue.
  func validate(_ newValue: String) {
    var allowed = CharacterSet()
    allowed.formUnion(.decimalDigits)
    
    let newValueContainsOnlyNumbers = newValue.unicodeScalars.allSatisfy { appNumber in
      allowed.contains(appNumber)
    }
    
    if !newValueContainsOnlyNumbers {
      showErrorMessage = true
      errorText = "Invalid Application Number"
    } else {
      showErrorMessage = false
      errorText = " "
    }
  }
}
