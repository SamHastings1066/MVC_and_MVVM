//
//  DocumentMVCView.swift
//  MVC_and_MVVM
//
//  Created by sam hastings on 28/09/2025.
//

import UIKit

class DocumentView: UIButton {

    // Closure through which View communicates user interations back to Controller.
    var onToggleSigned: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }

    func configure(isSigned: Bool) {
        let title = isSigned ? "☑︎ Signed" : "☐ Unsigned"
        setTitle(title, for: .normal)
        setTitleColor(.systemBlue, for: .normal)
    }

    @objc private func handleTap() {
        onToggleSigned?()
    }
}
