//
//  StackViewCell3.swift
//  StackViews
//
//  Created by djiang on 7/07/21.
//

import UIKit

class StackViewCell3: UITableViewCell {
    deinit {
        print("StackViewCell3 deinit")
    }

    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.distribution = .fillEqually
        view.alignment = .firstBaseline
        view.axis = .horizontal
        return view
    }()

    private lazy var stackViewLeft: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.axis = .vertical
        return view
    }()

    private lazy var labelLeftTop: UILabel = {
        let view = UILabel()
        view.backgroundColor = .orange
        view.text = "label Left Top"
        return view
    }()

    private lazy var labelLeftBottom: UILabel = {
        let view = UILabel()
        view.backgroundColor = .yellow
        view.text = "label Left Bottom"
        return view
    }()

    private lazy var stackViewRight: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.axis = .vertical
        view.distribution = .fill
        return view
    }()

    private lazy var labelRightTop: UILabel = {
        let view = UILabel()
        view.backgroundColor = .purple
        view.text = "label Right Top"
        return view
    }()

    private lazy var subStackViewRight: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .blue
        view.axis = .horizontal
        view.alignment = .firstBaseline
        view.distribution = .fill
        return view
    }()

    private lazy var labelRightBottomLeft: UILabel = {
        let view = UILabel()
        view.backgroundColor = .green
        view.text = "label Right Bottom Left"
        return view
    }()

    private lazy var labelRightBottomRight: UILabel = {
        let view = UILabel()
        view.backgroundColor = .cyan
        view.text = "label Right Bottom Right"
        return view
    }()

    weak var tableView: UITableView?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIView.animate(withDuration: 0.2) {
                self.stackViewLeft.alpha = 0
            }
            UIView.animate(withDuration: 1) {
                self.stackViewLeft.isHidden = true
            }
            self.tableView?.beginUpdates()
            self.tableView?.endUpdates()
        }
    }

    func commonInit() {
        setupUIs()
        setupCons()
        layoutIfNeeded()
    }

    func setupUIs() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(stackViewLeft)
        stackView.addArrangedSubview(stackViewRight)

        stackViewLeft.addArrangedSubview(labelLeftTop)
        stackViewLeft.addArrangedSubview(labelLeftBottom)

        stackViewRight.addArrangedSubview(labelRightTop)
        stackViewRight.addArrangedSubview(subStackViewRight)
        subStackViewRight.addArrangedSubview(labelRightBottomLeft)
        subStackViewRight.addArrangedSubview(labelRightBottomRight)
    }

    func setupCons() {
        stackView.snp.makeConstraints { m in
            m.top.equalTo(contentView.snp.top)
            m.leading.equalTo(contentView.snp.leading)
            m.bottom.equalTo(contentView.snp.bottom)
            m.trailing.equalTo(contentView.snp.trailing)
        }

        labelLeftTop.snp.makeConstraints { m in
            m.height.equalTo(50).priority(.high)
        }

        labelLeftBottom.snp.makeConstraints { m in
            m.height.equalTo(60).priority(.high)
        }

        labelRightTop.snp.makeConstraints { m in
            m.top.equalTo(stackViewRight.snp.top)
            m.leading.equalTo(stackViewRight.snp.leading)
            m.trailing.equalTo(stackViewRight.snp.trailing)
            m.height.equalTo(30).priority(.high)
        }

        labelRightBottomLeft.snp.makeConstraints { m in
            m.height.equalTo(40).priority(.high)
        }

        labelRightBottomRight.snp.makeConstraints { m in
            m.height.width.equalTo(20).priority(.high)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
