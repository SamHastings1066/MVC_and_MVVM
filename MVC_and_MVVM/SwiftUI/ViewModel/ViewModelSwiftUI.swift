//
//  ViewModelSwiftUI.swift
//  MVC_and_MVVM
//
//  Created by sam hastings on 21/09/2025.
//

import Observation

@Observable
class ViewModelSwiftUI {
    var document = Document(isSigned: false)

    var prompt: String {
        document.isSigned ? "Undo signature" : "Please sign this document"
    }
    
    var isDocSigned: Bool { document.isSigned }

    func sign() {
        document.isSigned.toggle()
    }
}
