//
//  MovieTableViewCell.swift
//  wikimovie
//
//  Created by Salim Wijaya on 25/07/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    static let identifier: String = "MovieViewCellIdentifier"
    
    let imageViewMovie: UIImageView = {
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
        vw.layer.shadowRadius = 8
//        vw.layer.cor
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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.setupView()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.setupView()
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setupView(){
        self.contentView.addSubview(self.container)
        self.container.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 30).isActive = true
        self.container.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12).isActive = true
//        self.container.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4).isActive = true
        self.container.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -12).isActive = true
        self.container.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
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
        
//        self.container.addSubview(self.genre1View)
//        self.genre1View.leftAnchor.constraint(equalTo: self.container.leftAnchor, constant: 120 + 10).isActive = true
//        self.genre1View.bottomAnchor.constraint(equalTo: self.container.bottomAnchor, constant: -30).isActive = true
//        
//        self.container.addSubview(self.genre2View)
//        self.genre2View.leftAnchor.constraint(equalTo: self.genre1View.rightAnchor, constant: 4).isActive = true
//        self.genre2View.bottomAnchor.constraint(equalTo: self.container.bottomAnchor, constant: -30).isActive = true
//        
//        self.setupGenreView()
        
        self.contentView.addSubview(self.imageViewMovie)
        self.imageViewMovie.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        self.imageViewMovie.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12).isActive = true
//        self.imageViewMovie.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -30).isActive = true
        self.imageViewMovie.widthAnchor.constraint(equalToConstant: 110).isActive = true
        self.imageViewMovie.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
    }

    weak var movie:Movie? {
        willSet {
            self.titleLabel.text = newValue?.title
            let imageUrl: String = newValue?.poster_path ?? ""
            self.imageViewMovie.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(imageUrl)")!)
            let rate: Double = newValue?.vote_average ?? 0
            self.ratingLabel.text = "\(rate)/10 TMDb"
        }
    }
}
