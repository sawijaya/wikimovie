//
//  MovieViewCell.swift
//  wikimovie
//
//  Created by Salim Wijaya on 22/07/21.
//

import UIKit
import Kingfisher

class MovieViewCell: UICollectionViewCell {
    static let identifier: String = "MovieViewCellIdentifier"
    
    let imageView: UIImageView = {
        let imgvw: UIImageView = UIImageView()
        imgvw.backgroundColor = UIColor.white
        imgvw.layer.cornerRadius = 16
        imgvw.layer.masksToBounds = true
        imgvw.contentMode = .scaleAspectFill
        imgvw.layer.shadowColor = UIColor(red: 74/255, green: 71/255, blue: 166/255, alpha: 1).cgColor
        imgvw.layer.shadowOpacity = 1
        imgvw.layer.shadowOffset = .zero
        imgvw.layer.shadowRadius = 10
        imgvw.translatesAutoresizingMaskIntoConstraints = false
        return imgvw
    }()
    
    let container: UIView = {
        let vw: UIView = UIView()
        vw.backgroundColor = UIColor.white
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.layer.cornerRadius = 16
        vw.layer.shadowColor = UIColor(red: 74/255, green: 71/255, blue: 166/255, alpha: 1).cgColor
        vw.layer.shadowOpacity = 0.5
        vw.layer.shadowOffset = .zero
        vw.layer.shadowRadius = 10
        return vw
    }()
    
    let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Black Widow"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor(red: 74/255, green: 71/255, blue: 166/255, alpha: 1)
        return label
    }()
    
    let starImageView: UIImageView = {
        let imgvw: UIImageView = UIImageView()
        let img: UIImage = UIImage(named: "ic-star", in: Bundle.main, compatibleWith: nil) ?? UIImage()
        imgvw.image = img
        imgvw.translatesAutoresizingMaskIntoConstraints = false
        return imgvw
    }()
    
    let ratingLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "7.1/10 TMDb"
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(red: 166/255, green: 163/255, blue: 202/255, alpha: 1)
        return label
    }()
    
    let genre1Label: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Fantasy"
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label.textColor = UIColor(red: 166/255, green: 163/255, blue: 202/255, alpha: 1)
        return label
    }()
    
    let genre1View: UIView = {
        let view: UIView = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor(red: 236/255, green: 237/255, blue: 246/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let genre2Label: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sci-fi"
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label.textColor = UIColor(red: 166/255, green: 163/255, blue: 202/255, alpha: 1)
        return label
    }()
    
    let genre2View: UIView = {
        let view: UIView = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor(red: 236/255, green: 237/255, blue: 246/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupGenreView(){
        self.genre1View.addSubview(self.genre1Label)
        self.genre1Label.topAnchor.constraint(equalTo: self.genre1View.topAnchor, constant: 5).isActive = true
        self.genre1Label.leftAnchor.constraint(equalTo: self.genre1View.leftAnchor, constant: 8).isActive = true
        self.genre1Label.bottomAnchor.constraint(equalTo: self.genre1View.bottomAnchor, constant: -5).isActive = true
        self.genre1Label.rightAnchor.constraint(equalTo: self.genre1View.rightAnchor, constant: -8).isActive = true
        
        self.genre2View.addSubview(self.genre2Label)
        self.genre2Label.topAnchor.constraint(equalTo: self.genre2View.topAnchor, constant: 5).isActive = true
        self.genre2Label.leftAnchor.constraint(equalTo: self.genre2View.leftAnchor, constant: 8).isActive = true
        self.genre2Label.bottomAnchor.constraint(equalTo: self.genre2View.bottomAnchor, constant: -5).isActive = true
        self.genre2Label.rightAnchor.constraint(equalTo: self.genre2View.rightAnchor, constant: -8).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = UIColor.clear
        self.setupView()
    }
    
    func setupView(){
        self.contentView.addSubview(self.container)
        self.container.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 30).isActive = true
        self.container.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 1).isActive = true
        self.container.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4).isActive = true
        self.container.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0).isActive = true
        
        self.container.addSubview(self.titleLabel)
        self.titleLabel.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 20).isActive = true
        self.titleLabel.leftAnchor.constraint(equalTo: self.container.leftAnchor, constant: 120 + 10).isActive = true
        self.titleLabel.rightAnchor.constraint(equalTo: self.container.rightAnchor, constant: -10).isActive = true
        
        self.container.addSubview(self.starImageView)
        self.starImageView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10).isActive = true
        self.starImageView.leftAnchor.constraint(equalTo: self.container.leftAnchor, constant: 120 + 10).isActive = true
        self.starImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        self.starImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.container.addSubview(self.ratingLabel)
//        self.ratingLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10).isActive = true
        self.ratingLabel.leftAnchor.constraint(equalTo: self.starImageView.rightAnchor, constant: 8).isActive = true
        self.ratingLabel.centerYAnchor.constraint(equalTo: self.starImageView.centerYAnchor).isActive = true
        
        self.container.addSubview(self.genre1View)
        self.genre1View.leftAnchor.constraint(equalTo: self.container.leftAnchor, constant: 120 + 10).isActive = true
        self.genre1View.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -30).isActive = true
        
        self.container.addSubview(self.genre2View)
        self.genre2View.leftAnchor.constraint(equalTo: self.genre1View.rightAnchor, constant: 4).isActive = true
        self.genre2View.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -30).isActive = true
        
        self.setupGenreView()
        
        self.contentView.addSubview(self.imageView)
        self.imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        self.imageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0).isActive = true
        self.imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -30).isActive = true
        self.imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        self.imageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/5bFK5d3mVTAvBCXi5NPWH0tYjKl.jpg")!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
