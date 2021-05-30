//
//  TableViewModel.swift
//  MVVM-Practice
//
//  Created by 김윤서 on 2021/05/30.
//

import Foundation
import RxSwift

class TableViewModel{
    var friendList      : [FriendDataModel] = []
    
    init(){
        setFriendList()
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
}

extension TableViewModel{
    var numberOfSections: Int {
       return 1
    }

    func numberOfRowsInSection(_ section: Int) -> Int {
       return self.friendList.count
    }

    func articleAtIndex(_ index: Int) -> FriendViewModel {
       let article = self.friendList[index]
       return FriendViewModel(article)
    }
}

class FriendViewModel{
    private let friendDataModel : FriendDataModel
    
    init(_ friend: FriendDataModel){
        self.friendDataModel = friend
    }
    
    var name: String{
        return self.friendDataModel.name
    }
    
    var state: String{
        return self.friendDataModel.state
    }
    
    var img : UIImage{
        return self.friendDataModel.image
    }
}
 
