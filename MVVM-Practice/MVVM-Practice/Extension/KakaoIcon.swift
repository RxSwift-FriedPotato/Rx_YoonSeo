//
//  KakaoIcon.swift
//  MVVM-Practice
//
//  Created by 김윤서 on 2021/05/30.
//

import UIKit

public extension UIImage{
    class var profileTalkImg  : UIImage{fetchKakaoIcon(#function)}
    class var profileCloseBtn : UIImage{fetchKakaoIcon(#function)}
    class var profileEditImg  : UIImage{fetchKakaoIcon(#function)}
    class var profileStoryImg : UIImage{fetchKakaoIcon(#function)}
    class var profileUserImg  : UIImage{fetchKakaoIcon(#function)}
    class var detailTabIcon   : UIImage{fetchKakaoIcon(#function)}
    class var friendTabIcon   : UIImage{fetchKakaoIcon(#function)}
    class var messageTabIcon  : UIImage{fetchKakaoIcon(#function)}
    class var searchTabIcon   : UIImage{fetchKakaoIcon(#function)}
    class var shopTabIcon     : UIImage{fetchKakaoIcon(#function)}
    class var settingIcon     : UIImage{fetchKakaoIcon(#function)}
    class var profileImage1   : UIImage{fetchKakaoIcon(#function)}
    class var profileImage2   : UIImage{fetchKakaoIcon(#function)}
    class var profileImage3   : UIImage{fetchKakaoIcon(#function)}
    class var profileImage4   : UIImage{fetchKakaoIcon(#function)}
    class var profileImage5   : UIImage{fetchKakaoIcon(#function)}
    class var profileImage6   : UIImage{fetchKakaoIcon(#function)}
    class var profileImage7   : UIImage{fetchKakaoIcon(#function)}
    class var profileImage8   : UIImage{fetchKakaoIcon(#function)}
    class var profileImage9   : UIImage{fetchKakaoIcon(#function)}
    class var profileImage10  : UIImage{fetchKakaoIcon(#function)}
    class var zzangIcon       : UIImage{fetchKakaoIcon(#function)}
   
    private static func fetchKakaoIcon(_ name : String) -> UIImage{
        guard let icon = UIImage(named: name) else {
            return .detailTabIcon
        }
        return icon
    }
}
