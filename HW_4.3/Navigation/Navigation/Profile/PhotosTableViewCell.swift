//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Simon Pegg on 23.09.2021.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    static let  identifier = "photos"
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier )
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    private var tempStorage:[UIImage] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    let viewAllButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "rightArrow"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(ProfileViewController.openGallery), for: .touchUpInside)
       return btn
    }()
    
    let photosLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Photos"
        label.textColor = UIColor.black
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    private func setupViews()  {
        translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(photosLabel)
        contentView.addSubview(viewAllButton)
        contentView.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        let constraints = [
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            viewAllButton.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            viewAllButton.heightAnchor.constraint(equalToConstant: 20),
            viewAllButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            viewAllButton.widthAnchor.constraint(equalToConstant: 20),
            
            collectionView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 60),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupConstraints()
    }

}

extension PhotosTableViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        cell.source = PhotoStorage.photoGrid[indexPath.row]
        return cell
    }
    
}

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (contentView.bounds.width - 8*5)/4, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("hooow")
    }
}
