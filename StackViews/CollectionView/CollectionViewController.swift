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
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = UICollectionViewFlowLayout.automaticSize
            layout.estimatedItemSize = CGSize(width: 100, height: 100)
        }
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.reuseIdentifier)
        collectionView.register(CollectionViewCell0.self, forCellWithReuseIdentifier: CollectionViewCell0.reuseIdentifier)
        collectionView.register(CollectionViewCell1.self, forCellWithReuseIdentifier: CollectionViewCell1.reuseIdentifier)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(onButtonClick))
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section % 2 == 0, let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell0.reuseIdentifier, for: indexPath) as? CollectionViewCell0 {
            return cell
        }

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell1.reuseIdentifier, for: indexPath) as? CollectionViewCell1 else { return UICollectionViewCell() }
        cell.isLabel2Hidden = indexPath.row % 2 == 0
//        cell.useFrame = indexPath.row % 2 == 0
        return cell
    }
}

// extension CollectionViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        retu≤≤rn CGSize(width: 100, height: 40)
//    }
// }

extension CollectionViewController {
    @objc func onButtonClick() {
        navigationController?.pushViewController(ScrollViewController(), animated: true)
    }
}
