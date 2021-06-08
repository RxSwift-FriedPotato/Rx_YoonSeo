//
//  ViewController.swift
//  MVVM-Practice
//
//  Created by 김윤서 on 2021/05/30.
//

import UIKit
import SnapKit
import RxSwift

class FriendViewController: UIViewController {
    
    private let friendLabel     = UILabel()
    private let topBarView      = UIView()
    private let settingButton   = UIButton()
    private let friendTableView = UITableView()
    
    private let viewModel : TableViewModel = TableViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setLayout()
        setAttributes()
        
        bindTabelView()
    }

    private func setTableView(){
        view.backgroundColor = .white
        friendTableView.register(MyProfileTableViewCell.self,
                                      forCellReuseIdentifier: MyProfileTableViewCell.identifier)
        
        friendTableView.separatorStyle = .none
    }
    
    
    private func bindTabelView(){
        
        friendTableView
            .rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        viewModel.output.tableData
            .bind(to: friendTableView.rx.items){( tv, row, item) -> UITableViewCell in
                if let cell = self.friendTableView.dequeueReusableCell(withIdentifier: MyProfileTableViewCell.identifier, for: IndexPath.init(row: row, section: 0)) as? MyProfileTableViewCell {
                    cell.setData(profile: item)
                    cell.selectionStyle = .none
                    return cell
                }
                return UITableViewCell()
            }
            .disposed(by: disposeBag)
        
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
