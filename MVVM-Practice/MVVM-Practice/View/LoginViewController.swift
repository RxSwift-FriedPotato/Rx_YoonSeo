//
//  ViewController.swift
//  MVVM-Practice
//
//  Created by 김윤서 on 2021/05/28.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift


class LoginViewController: UIViewController {

//MARK:- Outlet
    private let titleLabel           = UILabel()
    private let subTitleLabel        = UILabel()
    private let idTextField          = UITextField()
    private let passwordTextField    = UITextField()
    private let signInButton         = UIButton()
    private let signUpButton         = UIButton()
    
    private let mainStackView        = UIStackView()
    
    private let disposeBag = DisposeBag()
    var viewModel: LoginViewModel = LoginViewModel()
    
//MARK:- View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        setLayout()
        setAttribute()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        [idTextField,passwordTextField].forEach { $0?.text = ""}
    }
    

//MARK:- Function
    func bind(){

        // Input
        idTextField.rx.text
            .bind(to: viewModel.input.idText)
            .disposed(by: disposeBag)

        passwordTextField.rx.text
            .bind(to: viewModel.input.passwordText)
            .disposed(by: disposeBag)

        // Output
        viewModel.output.signInEnabled
            .drive(onNext: { [weak self] valid  in
                self?.signInButton.setBackgroundColor(valid ? .KakaoYellow : .KakaoLightGray, for: .normal)
                self?.signInButton.isEnabled = valid
            })
            .disposed(by: disposeBag)
        
        viewModel.output.signUpEnabled
            .drive(onNext: { [weak self] valid in
                self?.signUpButton.setBackgroundColor(valid ? .KakaoYellow : .KakaoLightGray, for: .normal)
                self?.signUpButton.isEnabled = valid
            })
          .disposed(by: disposeBag)
        
        
        signInButton.rx.tap
            .bind{
                print("tap signInButton")
                let signInVC = SignInViewController()
                
                if let id = self.idTextField.text{
                    signInVC.message = "\(id)님 \n가입이 완료되었습니다."
                }
                
                signInVC.modalPresentationStyle = .fullScreen
                self.present(signInVC, animated: true, completion: nil)
            }
            .disposed(by: disposeBag)
        
        signUpButton.rx.tap
            .bind{
                print("tap signUpButton")
                let vc = SignUpViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            .disposed(by: disposeBag)
    }

    
    func setLayout(){
        mainStackView.addArrangedSubviews(idTextField,passwordTextField,signUpButton,signInButton)
        
        view.addSubviews(titleLabel,subTitleLabel,mainStackView)
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(70)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        mainStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(70)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        [idTextField,passwordTextField,signInButton,signUpButton].forEach {
            $0.snp.makeConstraints {
                $0.height.equalTo(50)
            }
        }
        
    }
    
    func setAttribute(){
        
        mainStackView.then{
            $0.spacing = 30
            $0.axis = .vertical
            $0.distribution = .fillEqually
        }
        
        titleLabel.then{
            $0.text         = "카카오톡을 시작합니다"
            $0.font         = .systemFont(ofSize: 22)
            $0.textColor    = .black
        }
        
        subTitleLabel.then{
            $0.text         = "사용하던 카카오톡 계정이 있다면\n 이메일 또는 전화번호로 로그인해주세요."
            $0.font         = .systemFont(ofSize: 17)
            $0.textColor    = .KakaoDarkGray
            $0.textAlignment = .center
            $0.numberOfLines = 2
        }
       
        
        signInButton.then{
            $0.setTitle("카카오계정 로그인", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 15)
            $0.setRoundCorner(5.0)
            $0.setBackgroundColor(.KakaoLightGray, for: .normal)
        }
        
        signUpButton.then{
            $0.setTitle("새로운 카카오계정 만들기", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 15)
            $0.setRoundCorner(5.0)
            $0.setBackgroundColor(.KakaoYellow, for: .normal)
        }
        
        idTextField.then{
            $0.font = .systemFont(ofSize: 18)
            $0.setBottomBorder()
            $0.setPlaceHolder("이메일 또는 전화번호",.KakaoGray,.systemFont(ofSize: 18))
            $0.clearButtonMode = .whileEditing
            
        }
        
        passwordTextField.then{
            $0.font = .systemFont(ofSize: 18)
            $0.setBottomBorder()
            $0.setPlaceHolder("비밀번호",.KakaoGray,.systemFont(ofSize: 18))
            $0.isSecureTextEntry = true
            $0.clearButtonMode = .whileEditing
        }
    }

}

