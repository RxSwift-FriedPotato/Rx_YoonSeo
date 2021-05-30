//
//  ViewController.swift
//  MVVM-Practice
//
//  Created by 김윤서 on 2021/05/30.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let friendLabel     = UILabel()
    private let topBarView      = UIView()
    private let settingButton   = UIButton()
    
    private let friendTableView = UITableView()
    private let yoonseoProfile = FriendDataModel(image: .profileUserImg, name: "기뮨서", state: "우헤헤")
    
    private var friendList      : [FriendDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setLayout()
        setAttributes()
        
        
    }

    private func setTableView(){
        setFriendList()
        friendTableView.dataSource = self
        friendTableView.delegate = self
        friendTableView.register(MyProfileTableViewCell.self,
                                      forCellReuseIdentifier: MyProfileTableViewCell.identifier)
        
        friendTableView.separatorStyle = .none
    }
    
    private func setFriendList()
        {
            friendList.append(contentsOf: [
                FriendDataModel(image: .profileImage1,
                                name: "이택조",
                                state: "- 李택조배상 -"),
                
                FriendDataModel(image: .profileImage2,
                                name: "카페사장 최준",
                                state: "어? 예쁘다"),
                
                FriendDataModel(image: .zzangIcon,
                                name: "사과농장주",
                                state: "kill smile"),
                
                FriendDataModel(image: .profileImage4,
                                name: "쿨제이",
                                state: "필굿이야??!! 필!!!!!굿!!!!"),
                
                FriendDataModel(image: .profileImage5,
                                name: "광용쌤",
                                state: "그,,,,주식은,,,말이다,,,"),
                
                FriendDataModel(image: .profileImage6,
                                name: "영남회장",
                                state: "아 열쩡있게!"),
                
                FriendDataModel(image: .profileImage7,
                                name: "이호창",
                                state: "김갑생할머니김"),
                
                FriendDataModel(image: .profileImage8,
                                name: "예지언니🐙",
                                state: "사진 맛집 포토부스><"),
                
                FriendDataModel(image: .profileImage9,
                                name: "정재혁",
                                state: "어 민수ㅇㅑ 왔니 ..?"),
                
                FriendDataModel(image: .profileImage3,
                                name: "임플란티드 키드💕",
                                state: "누나 눼가 솨랑하뉘까아")
                
            ])
        }
    
    private func setAttributes(){
        
        friendLabel.text = "친구"
        friendLabel.font = .boldSystemFont(ofSize: 22)
        
        settingButton.setBackgroundImage(.settingIcon, for: .normal)
    }
    
    private func setLayout(){
        view.addSubview(topBarView)
        view.addSubview(friendLabel)
        view.addSubview(settingButton)
        view.addSubview(friendTableView)
        
       
        topBarView.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.leading.trailing.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        friendLabel.snp.makeConstraints {
            $0.centerY.equalTo(topBarView)
            $0.leading.equalTo(topBarView.snp.leading).offset(14)
        }
        
        settingButton.snp.makeConstraints {
            $0.centerY.equalTo(topBarView)
            $0.trailing.equalTo(topBarView.snp.trailing).inset(15)
        }
        
        friendTableView.snp.makeConstraints {
            $0.top.equalTo(topBarView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
        

}

extension ViewController : UITableViewDelegate{
    func tableView(_: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 73
    }
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = friendTableView.dequeueReusableCell(withIdentifier: MyProfileTableViewCell.identifier,for: indexPath) as? MyProfileTableViewCell {
            cell.setData(profile: friendList[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    
}
