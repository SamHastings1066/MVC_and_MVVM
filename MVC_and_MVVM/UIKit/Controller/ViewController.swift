//
//  ViewController.swift
//  MVC_and_MVVM
//
//  Created by sam hastings on 21/09/2025.
//

import UIKit

class ViewController: UIViewController {

    private var document = Document(isSigned: false)
    
    /*
     The ViewController holds a reference to the View. This means that the VC can "control" the View by calling the View's methods. E.g. `updateDocumentView()` calls `documentView.updateAppearance(isSigned:)`
     */
    private let documentView = DocumentView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    private func setUpView() {
        view.addSubview(documentView)
        documentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            documentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            documentView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        documentView.onPrimaryAction = { [weak self] in
            self?.updateModel()
            self?.updateView()
        }
        updateView()
    }

    private func updateModel() {
        document.isSigned.toggle()
    }

    private func updateView() {
        documentView.updateAppearance(isSigned: document.isSigned)
    }

}
