//
//  ViewController.swift
//  MVVM-Practice
//
//  Created by 김윤서 on 2021/05/30.
//

import UIKit
import SnapKit

class FriendViewController: UIViewController {
    
    private let friendLabel     = UILabel()
    private let topBarView      = UIView()
    private let settingButton   = UIButton()
    private let friendTableView = UITableView()
    
    private let viewModel : TableViewModel = TableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setLayout()
        setAttributes()
    }

    private func setTableView(){
        friendTableView.dataSource = self
        friendTableView.delegate = self
        friendTableView.register(MyProfileTableViewCell.self,
                                      forCellReuseIdentifier: MyProfileTableViewCell.identifier)
        
        friendTableView.separatorStyle = .none
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

extension FriendViewController : UITableViewDelegate{
    func tableView(_: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 73
    }
}

extension FriendViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = friendTableView.dequeueReusableCell(withIdentifier: MyProfileTableViewCell.identifier,for: indexPath) as? MyProfileTableViewCell {
            
            let friendVM = self.viewModel.articleAtIndex(indexPath.row)
            cell.setData(profile: FriendDataModel(image: friendVM.img, name: friendVM.name, state: friendVM.state))
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    
}
