//
//  Demo.swift
//  MVC_and_MVVM
//
//  Created by sam hastings on 21/09/2025.
//

import SwiftUI

@Observable
class ViewModelSwiftUI {
    var isDocSigned = false
    let signatureSymbol = "signature"

    var prompt: String {
        isDocSigned ? "Undo signature" : "Please sign this document"
    }

    func sign() {
        isDocSigned.toggle()
    }
}

struct Demo: View {
    @State private var viewModel = ViewModelSwiftUI()

    var body: some View {

        VStack {
            Button(viewModel.prompt) {
                viewModel.sign()
            }

            Image(systemName: viewModel.signatureSymbol)
                .symbolEffect(.drawOn, isActive: !viewModel.isDocSigned)
                

        }
    }
}

#Preview {
    Demo()
}
