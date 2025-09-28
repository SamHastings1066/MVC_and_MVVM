//
//  SwiftUIMVVMDemo.swift
//  MVC_and_MVVM
//
//  Created by sam hastings on 21/09/2025.
//

import SwiftUI

struct SwiftUIMVVMView: View {
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
    SwiftUIMVVMView()
}
