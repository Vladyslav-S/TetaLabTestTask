//
//  NewsTableViewCell.swift
//  TetaLabTest
//
//  Created by MACsimus on 18.03.2023.
//

import UIKit
import SnapKit

class NewsTableViewCell: UITableViewCell {

    // MARK: - UI Elements

    private lazy var containerView: UIView = {
        let view = UIView()
        view.defaultViewRoundedStyle()
        view.backgroundColor = .white
        view.apply(shadow: .basic)
        return view
    }()

    private lazy var textFieldsView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()

    private lazy var profileImageView: UIImageView = {
        let img = UIImageView()
        img.set(image: .defaultPhoto)
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 10
        img.clipsToBounds = true
        return img
    }()

    private lazy var newsTitle: UILabel = {
        let label = UILabel()
        label.text = "cardNameSurname"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 25)
        label.textColor = .black
        return label
    }()

    private lazy var newsSource: UILabel = {
        let label = UILabel()
        label.text = "cardDepartment"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15)
        label.textColor =  .black
        return label
    }()

    private lazy var newsInformation: UILabel = {
        let label = UILabel()
        label.text = "cardPosition"
        label.font = UIFont(name: "AppleSDGothicNeo-Light", size: 10)
        label.textColor = .gray
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        accessoryType = .disclosureIndicator
        setupAllVieWContainer()
        setupContainerView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Methods

    func setup(with data: String) {
        newsTitle.text = data
        newsSource.text = data
        newsInformation.text = data
       }

    // MARK: - Methods

    private func setupAllVieWContainer() {
        contentView.addSubview(containerView)

        containerView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(5)
            make.leading.equalTo(contentView.snp.leading).offset(5)
            make.trailing.equalTo(contentView.snp.trailing).inset(5)
            make.bottom.equalTo(contentView.snp.bottom).inset(5)
//            make.height.equalTo(150)
        }

        containerView.addSubview(profileImageView)
        containerView.addSubview(textFieldsView)

        profileImageView.snp.makeConstraints { make in
            make.centerY.equalTo(containerView)
            make.leading.equalTo(containerView).offset(10)
            make.top.equalTo(containerView).offset(10)
            make.bottom.equalTo(containerView).inset(10)
            make.width.equalTo(profileImageView.snp.height)
        }

        textFieldsView.snp.makeConstraints { make in
            make.top.equalTo(containerView).offset(10)
            make.leading.equalTo(profileImageView.snp.trailing).offset(16)
            make.trailing.equalTo(containerView).offset(5)
            make.bottom.equalTo(containerView.snp.bottom).inset(10)
        }
    }

    private func setupContainerView() {
        textFieldsView.addSubview(newsTitle)
        textFieldsView.addSubview(newsSource)
        textFieldsView.addSubview(newsInformation)

        newsTitle.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(textFieldsView)
            make.height.equalTo(30)
        }

        newsSource.snp.makeConstraints { make in
            make.top.equalTo(newsTitle.snp.bottom).offset(2)
            make.leading.trailing.equalTo(textFieldsView)
            make.height.equalTo(20)
        }

        newsInformation.snp.makeConstraints { make in
            make.top.equalTo(newsSource.snp.bottom).offset(2)
            make.leading.trailing.equalTo(textFieldsView)
            make.height.equalTo(15)
        }
    }
}
