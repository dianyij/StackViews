//
//  StackViewCell0.swift
//  StackViews
//
//  Created by djiang on 7/07/21.
//

import UIKit

class StackViewCell0: UITableViewCell {
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    private lazy var label1: UILabel = {
        let view = UILabel()
        view.backgroundColor = .orange
        view.text = "label 1"
        return view
    }()

    private var dict: [String: String] = {
        var a = [String: String]()
        a["1"] = "aaa"
        a["2"] = "aa3a"
        a["6"] = "aa4a"
        return a
    }()

    private lazy var label2: UILabel = {
        let view = UILabel()
        view.backgroundColor = .yellow
        view.text = "label 2"
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.frame = UIScreen.main.bounds
        setupUIs()
        setupCons()
    }

    func setupUIs() {
        contentView.addSubview(containerView)
        containerView.addSubview(label1)
        containerView.addSubview(label2)
    }

    func setupCons() {
        containerView.snp.makeConstraints { m in
            m.top.equalTo(contentView.snp.top)
            m.leading.equalTo(contentView.snp.leading)
            m.bottom.equalTo(contentView.snp.bottom)
            m.trailing.equalTo(contentView.snp.trailing)
        }

        label1.snp.makeConstraints { m in
            m.top.equalTo(containerView.snp.top)
            m.leading.equalTo(containerView.snp.leading)
            m.trailing.equalTo(containerView.snp.trailing)
            m.height.equalTo(30).priority(.high)
        }

        label2.snp.makeConstraints { m in
            m.top.equalTo(label1.snp.bottom)
            m.leading.equalTo(containerView.snp.leading)
            m.trailing.equalTo(containerView.snp.trailing)
            m.bottom.equalTo(containerView.snp.bottom)
            m.height.equalTo(50).priority(.high)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
