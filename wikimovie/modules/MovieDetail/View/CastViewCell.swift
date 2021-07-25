//
//  CastViewCell.swift
//  wikimovie
//
//  Created by Salim Wijaya on 24/07/21.
//

import UIKit

class CastViewCell: UICollectionViewCell {
    static let identifier: String = "CastViewCellIdentifier"
    let imageView: UIImageView = {
        let imgvw: UIImageView = UIImageView()
        imgvw.layer.cornerRadius = 8
        imgvw.layer.masksToBounds = true
        imgvw.translatesAutoresizingMaskIntoConstraints = false
        imgvw.backgroundColor = UIColor.green
        imgvw.contentMode = .scaleToFill
        imgvw.layer.shadowColor = UIColor(red: 74/255, green: 71/255, blue: 166/255, alpha: 1).cgColor
        imgvw.layer.shadowOpacity = 0.5
        imgvw.layer.shadowOffset = .zero
        imgvw.layer.shadowRadius = 10
//        imgvw.layer.borderWidth = 2
//        imgvw.layer.borderColor = UIColor(red: 74/255, green: 71/255, blue: 166/255, alpha: 1).cgColor
        return imgvw
    }()
    
    let nameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Jay Baruchel"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = UIColor(red: 74/255, green: 71/255, blue: 166/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    let characterLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hiccup"
        label.textAlignment = .center
        label.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.contentView.backgroundColor = UIColor.red
        
        self.setupView()
    }
    
    func setupView() {
        self.contentView.addSubview(self.imageView)
        self.imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 2).isActive = true
        self.imageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        self.imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        self.imageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        self.imageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/75PvULemW8BvheSKtPMoBBsvPLh.jpg")!)
        
        self.contentView.addSubview(self.nameLabel)
        self.nameLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 4).isActive = true
        self.nameLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 4).isActive = true
        self.nameLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -4).isActive = true
        
        self.contentView.addSubview(self.characterLabel)
        self.characterLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 4).isActive = true
        self.characterLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 4).isActive = true
        self.characterLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -4).isActive = true
//        self.imageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 1).isActive = true
//        self.imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4).isActive = true
//        self.imageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
