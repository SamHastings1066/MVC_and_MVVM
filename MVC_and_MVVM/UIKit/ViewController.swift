//
//  ViewController.swift
//  MVC_and_MVVM
//
//  Created by sam hastings on 21/09/2025.
//

import UIKit

class ViewController: UIViewController {

    private var document = Document(isSigned: false)

    private let documentView = DocumentView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.addSubview(documentView)
        documentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            documentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            documentView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        documentView.onToggleSigned = { [weak self] in
            self?.toggleSigned()
        }
        updateView()
    }

    @objc private func toggleSigned() {
        document.isSigned.toggle()
        updateView()
    }

    // Method through which Controller communicates with View to ensure view updates to reflect model state.
    private func updateView() {
        documentView.configure(isSigned: document.isSigned)
    }

}
