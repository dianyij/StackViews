//
//  StackViewCell2.swift
//  StackViews
//
//  Created by djiang on 7/07/21.
//

import UIKit

class StackViewCell2: UITableViewCell, Reuseable {
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.distribution = .fillEqually
        view.alignment = .firstBaseline
        view.axis = .horizontal
        return view
    }()

    private lazy var labelLeft: UILabel = {
        let view = UILabel()
        view.backgroundColor = .orange
        view.text = "label Left"
        return view
    }()

    private lazy var labelRight: UILabel = {
        let view = UILabel()
        view.backgroundColor = .purple
        view.text = "label Right"
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUIs()
        setupCons()
    }

    func setupUIs() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(labelLeft)
        stackView.addArrangedSubview(labelRight)
    }

    func setupCons() {
        stackView.snp.makeConstraints { m in
            m.top.equalTo(contentView.snp.top)
            m.leading.equalTo(contentView.snp.leading)
            m.bottom.equalTo(contentView.snp.bottom)
            m.trailing.equalTo(contentView.snp.trailing)
        }

        labelLeft.snp.makeConstraints { m in
            m.height.equalTo(20).priority(.high)
        }

        labelRight.snp.makeConstraints { m in
            m.height.equalTo(60).priority(.high)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
