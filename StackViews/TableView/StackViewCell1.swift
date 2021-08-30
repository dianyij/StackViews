//
//  StackViewCell1.swift
//  StackViews
//
//  Created by djiang on 7/07/21.
//

import UIKit

class StackViewCell1: UITableViewCell {
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .blue
        view.distribution = .fillEqually
        view.axis = .vertical
        return view
    }()

    private lazy var label1: UILabel = {
        let view = UILabel()
        view.backgroundColor = .orange
        view.text = "label 1"
        return view
    }()

    private lazy var label2: UILabel = {
        let view = UILabel()
        view.backgroundColor = .yellow
        view.text = "label 2"
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUIs()
        setupCons()
    }

    func setupUIs() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label2)
    }

    func setupCons() {
        stackView.snp.makeConstraints { m in
            m.top.equalTo(contentView.snp.top)
            m.leading.equalTo(contentView.snp.leading)
            m.bottom.equalTo(contentView.snp.bottom)
            m.trailing.equalTo(contentView.snp.trailing)
            m.height.equalTo(50).priority(.high)
        }

        label1.snp.makeConstraints { m in
            m.height.equalTo(50).priority(.high)
        }

        label2.snp.makeConstraints { m in
            m.height.equalTo(30).priority(.high)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
