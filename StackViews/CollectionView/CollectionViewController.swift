//
//  TableViewController.swift
//  StackViews
//
//  Created by djiang on 7/07/21.
//

import UIKit

extension UICollectionViewController {
    enum CollectionLayoutType {
        case flow
        case list
    }

    static var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = CGSize(width: 100, height: 100)
        return layout
    }()

    static var listLayout: UICollectionViewLayout = {
        let config = UICollectionLayoutListConfiguration(appearance: .plain)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        return layout
    }()
}

class CollectionViewController: UICollectionViewController {
    convenience init(collectionLayoutType: CollectionLayoutType = .flow) {
        let layout = collectionLayoutType == .flow ? Self.flowLayout : Self.listLayout
        self.init(collectionViewLayout: layout)
    }

    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .red
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.reuseIdentifier)
        collectionView.register(CollectionViewCell0.self, forCellWithReuseIdentifier: CollectionViewCell0.reuseIdentifier)
        collectionView.register(CollectionViewCell1.self, forCellWithReuseIdentifier: CollectionViewCell1.reuseIdentifier)
        collectionView.register(CollectionViewCell2.self, forCellWithReuseIdentifier: CollectionViewCell2.reuseIdentifier)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(onButtonClick))
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell2.reuseIdentifier, for: indexPath) as? CollectionViewCell2 else { return UICollectionViewCell() }
        configCell(cell: cell, at: indexPath)
        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func configCell(cell: CollectionViewCell2, at indexPath: IndexPath) {
        let text = "text1\ntext2\n"
        let count = indexPath.item % 3 + 2
        let s = String(repeating: text, count: count)
        cell.label1.text = s
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell2.reuseIdentifier, for: indexPath) as? CollectionViewCell2 {
            configCell(cell: cell, at: indexPath)
            let size = cell.systemLayoutSizeFitting(CGSize(width: 300, height: 1000))
            return size
        }
        return CGSize(width: 100, height: 40)
    }
}

extension CollectionViewController {
    @objc func onButtonClick() {
        navigationController?.pushViewController(ScrollViewController(), animated: true)
    }
}
