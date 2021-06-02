//
//  SignInViewController.swift
//  MVVM-Practice
//
//  Created by 김윤서 on 2021/04/03.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

class SignInViewController: UIViewController {

    public var message           : String?
    private let titleLabel       = UILabel()
    private let signInButton     = UIButton()
    
    @objc
    func onClickSignInButton(_ sender: Any) {
        let presentingVC = self.presentingViewController!
        let navigationController = presentingVC is UINavigationController ? presentingVC as? UINavigationController : presentingVC.navigationController

        self.dismiss(animated: true){
            navigationController?.interactivePopGestureRecognizer?.isEnabled = false
            navigationController?.pushViewController(FriendViewController(), animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setFunction()
        setLayout()
        setAttribute()
    }

    
    func setFunction(){
        signInButton.addTarget(self, action: #selector(onClickSignInButton(_:)), for: .touchUpInside)
    }
    
    func setLayout(){
        
        view.addSubviews(titleLabel,signInButton)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(170)
            $0.centerX.equalToSuperview()
        }
        
        signInButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(240)
            $0.height.equalTo(50)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().inset(15)
        }
    }
    
    func setAttribute(){
        signInButton.then{
            $0.setTitle("확인", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 15)
            $0.setRoundCorner(5.0)
            $0.setBackgroundColor(.KakaoYellow, for: .normal)
        }
        
        titleLabel.then{
            $0.font = .systemFont(ofSize: 20, weight: .semibold)
            $0.numberOfLines = 2
            $0.textAlignment = .center
            if let msg = message {
                $0.text = msg
            }else{
                $0.text = ""
            }
        }
    }
    

}
