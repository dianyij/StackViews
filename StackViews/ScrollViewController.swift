//
//  ScrollViewController.swift
//  StackViews
//
//  Created by djiang on 7/07/21.
//

import Foundation
import UIKit

class ScrollViewController: UIViewController {
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        view.backgroundColor = .red
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var button: UIButton = {
        let view = UIButton()
        view.backgroundColor = .purple
        view.setTitle("click me", for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        return view
    }()

    let deboundcer = Debouncer(timeInterval: 1)
    
    @objc
    func onClick() {

        Debouncer.shared.run(timeInterval:1 ) {
            print("Debouncer.shared.run")
            print(Unmanaged.passUnretained(Debouncer.shared).toOpaque())
        }
        
        deboundcer.run { [weak self] in
            guard let self = self else { return }
            print("deboundcer run")
            print(Unmanaged.passUnretained(self.deboundcer).toOpaque())
        }
    }
    
    private lazy var headerLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .blue
        view.text = "headerLabel headerLabel headerLabel headerLabel headerLabel headerLabel"
        view.textAlignment = .center
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    private lazy var footerLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .blue
        view.text = "footerLabel footerLabel footerLabel footerLabel footerLabel footerLabel footerLabel footerLabel footerLabel footerLabel footerLabel footerLabel footerLabel footerLabel footerLabel "
        view.textAlignment = .center
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIs()
        setupCons()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(onButtonClick))
    }

    deinit {
        print("deinit \(String(describing: ScrollViewController.self))")
    }
    
    private func setupUIs() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(headerLabel)
        contentView.addSubview(footerLabel)
        contentView.addSubview(button)
    }
    
    func setupCons() {
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
      
        button.topAnchor.constraint(equalTo: headerLabel.bottomAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: headerLabel.trailingAnchor).isActive = true
        
        footerLabel.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor).isActive = true
        footerLabel.trailingAnchor.constraint(equalTo: headerLabel.trailingAnchor).isActive = true
        footerLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        let con = footerLabel.topAnchor.constraint(equalTo: headerLabel.topAnchor)
        con.constant = 1000
        con.isActive = true
    }
}

extension ScrollViewController {
    @objc func onButtonClick() {
        navigationController?.pushViewController(ViewController(), animated: true)
    }
}
