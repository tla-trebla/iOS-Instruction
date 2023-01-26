//
//  OrderMethodView.swift
//  iOS-Instruction
//
//  Created by Albert on 26/01/23.
//

import UIKit

final class OrderMethodView: UIView {
    private lazy var imageView: UIImageView = {
        let image = UIImage(named: "delivery")
        let imageView = UIImageView(image: image)
        
        return imageView
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "Delivery"
        
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 8
        button.setTitle("Ubah Metode", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(imageView)
        addSubview(title)
        addSubview(button)
    }
    
    private func setupLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 32),
            imageView.widthAnchor.constraint(equalToConstant: 32),
            
            title.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 12),
            title.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            
            button.leftAnchor.constraint(equalTo: title.rightAnchor, constant: 12),
            button.rightAnchor.constraint(equalTo: rightAnchor),
            button.topAnchor.constraint(equalTo: topAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
