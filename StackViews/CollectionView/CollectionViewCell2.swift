//
//  CollectionViewCell.swift
//  StackViews
//
//  Created by djiang on 7/07/21.
//

import UIKit

class CollectionViewCell2: UICollectionViewCell {
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    private lazy var stackView: UIStackView = {
        let view = UIStackView(frame: bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.axis = .vertical
        return view
    }()

    lazy var label1: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        view.backgroundColor = .orange
        view.numberOfLines = 0
        view.text = "label 1"
        return view
    }()

    lazy var label2: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.backgroundColor = .yellow
        view.text = "label 2"
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        print(frame)
        setupUIs()
        setupCons()
    }

    func setupUIs() {
        backgroundColor = .cyan
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label2)
    }

    func setupCons() {
        translatesAutoresizingMaskIntoConstraints = false
        stackView.snp.makeConstraints { m in
            m.top.equalTo(contentView.snp.top)
            m.leading.equalTo(contentView.snp.leading)
            m.bottom.equalTo(contentView.snp.bottom).priority(.high)
            m.trailing.equalTo(contentView.snp.trailing).priority(.high)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
