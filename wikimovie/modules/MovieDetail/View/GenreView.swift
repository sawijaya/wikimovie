//
//  GenreView.swift
//  wikimovie
//
//  Created by Salim Wijaya on 24/07/21.
//

import UIKit

class GenreView: UIView {
    private let label: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Fantasy"
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label.textColor = UIColor.white
        return label
    }()
    
    var backgroundView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 0.3)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        return view
    }()
    
    var labelColor: UIColor = UIColor.white {
        willSet {
            self.label.textColor = newValue
        }
    }
    
    var text: String = "" {
        willSet {
            self.label.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupView()
    }
    
    convenience init(name: String) {
        self.init(frame: CGRect.zero)
        
        self.label.text = name
    }
    
    private func setupView(){
        self.backgroundColor = UIColor.clear
        
        self.addSubview(self.backgroundView)
        self.backgroundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        self.backgroundView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        self.backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        self.backgroundView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        
        self.addSubview(self.label)
        self.label.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        self.label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        self.label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        self.label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        
        
//        self.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 0.5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
