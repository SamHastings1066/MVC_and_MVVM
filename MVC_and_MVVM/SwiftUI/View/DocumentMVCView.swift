//
//  DocumentMVCView.swift
//  MVC_and_MVVM
//
//  Created by sam hastings on 21/09/2025.
//

import SwiftUI

/// Pure SwiftUI View that knows nothing about any controller.
/// It renders given data and calls back via a closure.
struct DocumentMVCView: View {
    let prompt: String
    let isDocSigned: Bool
    let onTap: () -> Void

    private let signatureSymbol = "signature"

    var body: some View {
        VStack {
            Button(prompt) {
                onTap()
            }
            Image(systemName: signatureSymbol)
                .symbolEffect(.drawOn, isActive: !isDocSigned)
        }
        .padding()
    }
}

#Preview {
    DocumentMVCView(
        prompt: "Please sign this document",
        isDocSigned: false,
        onTap: {}
    )
}
