//
//  SignUpViewController.swift
//  MVVM-Practice
//
//  Created by 김윤서 on 2021/04/03.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class SignUpViewController: UIViewController {

    
//MARK:- Outlet
    private let titleLabel           = UILabel()
    
    private let idTextField          = UITextField()
    private let passwordTextField    = UITextField()
    private let checkTextField       = UITextField()
    private let signInButton         = UIButton()
    
    private let mainStackView        = UIStackView()
    
    
    private let disposeBag = DisposeBag()
    private let viewModel: SignUpViewModel = SignUpViewModel()
//MARK:- Action


//MARK:- View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        bind()
        setLayout()
        setAttribute()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        [idTextField,passwordTextField,checkTextField].forEach { $0?.text = .none}
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
        
        checkTextField.rx.text
            .bind(to: viewModel.input.checkText)
            .disposed(by: disposeBag)

        // Output
        viewModel.output.signUpEnabled
            .drive(onNext: { [weak self] valid in
                self?.signInButton.setBackgroundColor(valid ? .KakaoYellow : .KakaoLightGray, for: .normal)
                self?.signInButton.isEnabled = valid
            })
          .disposed(by: disposeBag)
        
        signInButton.rx.tap
            .bind{
                let signInVC = SignInViewController()
                
                if let id = self.idTextField.text{
                    signInVC.message = "\(id)님 \n가입이 완료되었습니다."
                }
                
                signInVC.modalPresentationStyle = .fullScreen
                self.present(signInVC, animated: true, completion: nil)
            }
            .disposed(by: disposeBag)
        
    }
    
    func setLayout(){
        mainStackView.addArrangedSubviews(idTextField,passwordTextField,checkTextField,signInButton)
        view.addSubviews(titleLabel,mainStackView)
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(70)
        }
        
        mainStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(150)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        [idTextField,passwordTextField,checkTextField,signInButton].forEach {
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
            $0.text = "카카오톡을 시작합니다"
            $0.font = .systemFont(ofSize: 22)
            $0.textColor = .black
        }
        
        signInButton.then{
            $0.setTitle("새로운 카카오계정 만들기", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 15)
            $0.setRoundCorner(5.0)
            $0.setBackgroundColor(.KakaoLightGray, for: .normal)
        }
        
        idTextField.then {
            $0.font = .systemFont(ofSize: 18)
            $0.setBottomBorder()
            $0.setPlaceHolder("이메일 또는 전화번호",.KakaoGray,.systemFont(ofSize: 18))
            $0.clearButtonMode = .whileEditing
        }
        
        passwordTextField.then {
            $0.font = .systemFont(ofSize: 18)
            $0.setBottomBorder()
            $0.setPlaceHolder("비밀번호",.KakaoGray,.systemFont(ofSize: 18))
            $0.isSecureTextEntry = true
            $0.clearButtonMode = .whileEditing
        }
        
        checkTextField.then {
            $0.font = .systemFont(ofSize: 18)
            $0.setBottomBorder()
            $0.setPlaceHolder("비밀번호 확인", .KakaoGray,.systemFont(ofSize: 18))
            $0.isSecureTextEntry = true
            $0.clearButtonMode = .whileEditing
        }
        
    }

}

