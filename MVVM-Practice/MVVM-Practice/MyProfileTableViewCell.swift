//
//  MyProfileTableViewCell.swift
//  MVVM-Practice
//
//  Created by 김윤서 on 2021/05/30.
//

import UIKit

class MyProfileTableViewCell: UITableViewCell {

    public static let identifier : String = "myProfileTableViewCell"
    
    private let profileImageButton  = UIButton()
    private let profileNameLabel    = UILabel()
    private let profileStateLabel   = UILabel()
    private let bottomLine          = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayout()
        setAttributes()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(profile : FriendDataModel){
        profileImageButton.setBackgroundImage(profile.image, for: .normal)
        profileNameLabel.text = profile.name
        profileStateLabel.text = profile.state
    }
    
    
    func setLayout(){
        addSubview(profileStateLabel)
        addSubview(profileImageButton)
        addSubview(profileNameLabel)
        addSubview(bottomLine)
        
        profileImageButton.snp.makeConstraints {
            $0.height.equalTo(58)
            $0.width.equalTo(59)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(14)
        }
        
        profileNameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageButton.snp.trailing).offset(10)
            $0.top.equalToSuperview().offset(15)
        }
        
        profileStateLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageButton.snp.trailing).offset(10)
            $0.top.equalTo(profileNameLabel.snp.bottom).offset(7)
        }
        
        bottomLine.snp.makeConstraints {
            $0.height.equalTo(0.5)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setAttributes(){
        profileNameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        profileNameLabel.textAlignment = .left
        profileNameLabel.textColor = .black
       
        profileStateLabel.font = .systemFont(ofSize: 11)
        profileStateLabel.textAlignment = .left
        profileStateLabel.textColor = .darkGray
        
        bottomLine.backgroundColor = .gray
    }

}
