//
//  MainViewController.swift
//  iOS-Instruction
//
//  Created by Albert on 26/01/23.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var orderMethodView: OrderMethodView = {
        let orderMethodView = OrderMethodView()
        
        return orderMethodView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMainView()
        setupNavigationBar()
        setupViews()
        setupLayout()
    }
    
    private func setupMainView() {
        view.backgroundColor = .white
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Checkout"
    }
    
    private func setupViews() {
        view.addSubview(orderMethodView)
    }
    
    private func setupLayout() {
        orderMethodView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            orderMethodView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            orderMethodView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            orderMethodView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
        ])
    }
}
