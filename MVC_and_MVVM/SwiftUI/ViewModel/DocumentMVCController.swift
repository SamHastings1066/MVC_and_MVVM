//
//  DocumentMVCController.swift
//  MVC_and_MVVM
//
//  Created by sam hastings on 21/09/2025.
//

import UIKit
import SwiftUI

/// MVC Controller that owns the Model and the SwiftUI View.
/// It depends on the View by constructing it and updating it when the Model changes.
/// No @Observable / ObservableObject is used.
final class DocumentMVCController: UIViewController {

    // MARK: - Model
    private var document = Document(isSigned: false)

    // MARK: - View
    private lazy var hostingController = UIHostingController(rootView: makeView())

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MVC"
        view.backgroundColor = .systemBackground

        addChild(hostingController)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hostingController.view)
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        hostingController.didMove(toParent: self)
    }

    // MARK: - Intent
    private func toggleSignature() {
        document.isSigned.toggle()
        // Controller drives the refresh by rebuilding the SwiftUI View with new data.
        hostingController.rootView = makeView()
    }

    // MARK: - View Factory
    private func makeView() -> DocumentMVCView {
        DocumentMVCView(
            prompt: document.isSigned ? "Undo signature" : "Please sign this document",
            isDocSigned: document.isSigned,
            onTap: { [weak self] in
                self?.toggleSignature()
            }
        )
    }
}
