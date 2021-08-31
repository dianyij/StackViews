//
//  CollectionViewCell.swift
//  StackViews
//
//  Created by djiang on 7/07/21.
//

import UIKit

class CollectionViewCell0: UICollectionViewCell {
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    lazy var label1: UILabel = {
        let view = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        view.backgroundColor = .orange
        view.text = "label 1"
        return view
    }()

    lazy var label2: UILabel = {
        let view = UILabel(frame: CGRect(x: 0, y: 20, width: 100, height: 20))
        view.backgroundColor = .yellow
        view.text = "label 2"
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setupUIs()
    }

    func setupUIs() {
        contentView.addSubview(containerView)
        containerView.addSubview(label1)
        containerView.addSubview(label2)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
