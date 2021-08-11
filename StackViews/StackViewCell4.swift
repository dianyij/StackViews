//
//  StackViewCell4.swift
//  StackViews
//
//  Created by djiang on 7/07/21.
//

import UIKit

class StackViewCell4: UITableViewCell, Reuseable {
    private lazy var vStackView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .blue
//        view.distribution = .fillEqually
        view.axis = .vertical
        return view
    }()

    private lazy var hStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
//        view.distribution = .fillProportionally
        view.axis = .horizontal
        view.alignment = .leading
        
        return view
    }()

    private lazy var label0: UILabel = {
        let view = UILabel()
        view.backgroundColor = .cyan
        view.text = "label 0"
        return view
    }()

    private lazy var label1: UILabel = {
        let view = UILabel()
        view.backgroundColor = .orange
        view.text = "label 1"
        view.heightAnchor.constraint(equalToConstant: 30).isActive = true
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return view
    }()

    private lazy var label2: UILabel = {
        let view = UILabel()
        view.backgroundColor = .yellow
        view.text = "label 22222222"
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUIs()
        setupCons()
    }

    func setupUIs() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.label1.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        }
        contentView.addSubview(vStackView)
        vStackView.addArrangedSubview(hStackView)
        vStackView.addArrangedSubview(label0)
        hStackView.addArrangedSubview(label1)
        hStackView.addArrangedSubview(label2)
    }

    func setupCons() {
        vStackView.snp.makeConstraints { m in
            m.top.equalTo(contentView.snp.top)
            m.leading.equalTo(contentView.snp.leading)
            m.bottom.equalTo(contentView.snp.bottom)
            m.trailing.equalTo(contentView.snp.trailing)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
