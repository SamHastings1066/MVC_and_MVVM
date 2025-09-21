//
//  SwiftUIMVVMDemo.swift
//  MVC_and_MVVM
//
//  Created by sam hastings on 21/09/2025.
//

import SwiftUI

struct Document {
    var isSigned: Bool
}

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

struct SwiftUIMVVMDemo: View {
    @Bindable var viewModel: ViewModelSwiftUI
    private let signatureSymbol = "signature"

    init(viewModel: ViewModelSwiftUI = ViewModelSwiftUI()) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Button(viewModel.prompt) {
                viewModel.sign()
            }
            Image(systemName: signatureSymbol)
                .symbolEffect(.drawOn, isActive: !viewModel.isDocSigned)
        }
    }
}

#Preview {
    SwiftUIMVVMDemo()
}
