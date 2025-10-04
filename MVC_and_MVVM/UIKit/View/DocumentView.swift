//
//  DocumentMVCView.swift
//  MVC_and_MVVM
//
//  Created by sam hastings on 28/09/2025.
//

import UIKit

class DocumentView: UIButton {
    let signedTitle = "☑︎ Signed"
    let unsignedTitle = "☐ Unsigned"

    // Closure through which the view communicates user interactions back to the controller.
    var onPrimaryAction: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        addTarget(self, action: #selector(handlePrimaryAction), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addTarget(self, action: #selector(handlePrimaryAction), for: .touchUpInside)
    }

    func updateAppearance(isSigned: Bool) {
        let title = isSigned ? signedTitle : unsignedTitle
        setTitle(title, for: .normal)
        setTitleColor(.systemBlue, for: .normal)
    }

    @objc private func handlePrimaryAction() {
        onPrimaryAction?()
    }
}
