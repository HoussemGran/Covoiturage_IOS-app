//
//  PopupData.swift
//  Makan
//
//  Created by Bouabid Wassim on 18/04/2021.
//  Copyright © 2021 Karizma. All rights reserved.
//

import Foundation
import UIKit



enum YesNOPopupTypes: Int {
    case deleteFavoriteEstate = 0
    case verificateLocation
    case verificateEstate
    case confirmAddAdvert
    case imagesCountAlert
    case deleteFavoriteUser
    case missInfo
    case verificationCodeError
    case logout
    case dismissAddEstate
}


/** A  popups  model of diffrent ones */
struct PopupObject {
    let image: UIImage?
    let title: String?
    let description: String?
    let buttonHidden: Bool?
    let closeHidden: Bool?
}


final class PopupObjectsProvider {
    
    /// Shared singleton instance
    static let instance = PopupObjectsProvider()
 
    /** Main initiliazer */
    private init() {
    }


    /** Create fake real estate objects */
    func PopupObjects() -> [PopupObject] {
        return [
            PopupObject(
                image: nil ,
                title: "هل ترغب بازالة هذا الاعلان من الاعلانات المفضلة؟",
                description: "" ,
                buttonHidden: false ,
                closeHidden: true
            ),
            PopupObject(
                image: UIImage(.adress) ,
                title: "هل هذا هو عنوانك الصحيح؟",
                description: "Al Mutamarat, Riyadh 12711,Arabie saoudite" ,
                buttonHidden: false ,
                closeHidden: true
            ),
            PopupObject(
                image: UIImage(.redVerified) ,
                title: "تم التحقق من أن العقار متوفر من خلال فريق مكان بتاريخ 13 سبتمبر 2020",
                description: "" ,
                buttonHidden: true ,
                closeHidden: false
            ),
            PopupObject(
                image: UIImage(.confirm) ,
                title: """
 تم إضافة عقارك برقم #
 وسوف يتم فريق مكان مراجعة اعلانك خلال مدة لا تتجاوز 24 ساعه وفي حال عدم اكتمال المتطلبات سوف يتم فريقنا بالتواصل معكم وخدمتكم بشكل افضل, شكرا لتعاونك
 """,
                description: "" ,
                buttonHidden: true ,
                closeHidden: false
            ),
            PopupObject(
                image: UIImage(.alertInfo) ,
                title: " لقد تم تجاوز العدد المسموح من إضافة الصور وفيديو واحد فقط ينتظر التحميل",
                description: "" ,
                buttonHidden: true ,
                closeHidden: true
            ),
            PopupObject(
                image: nil ,
                title: "هل ترغب فعلا بإلغاء هذه المتابعة؟",
                description: "" ,
                buttonHidden: false ,
                closeHidden: true
            ),
            PopupObject(
                image: UIImage(.addAdvert) ,
                title: "عليك تحديد حالة العقار",
                description: "" ,
                buttonHidden: true ,
                closeHidden: true
            ),
            PopupObject(
                image: UIImage(.noInternet) ,
                title: "حدث خطأ داخلى يرجى المحاوله فى وقت لاحق!",
                description: "" ,
                buttonHidden: true ,
                closeHidden: false
            ),
            PopupObject(
                image: UIImage(.logout) ,
                title: "هل ترغب في تسجيل الخروج من التطبيق",
                description: "" ,
                buttonHidden: false ,
                closeHidden: true
            ),
            PopupObject(
                image: UIImage(.dismissAdd) ,
                title: "هل أنت متأكد من إلغاء إضافة المنشور",
                description: "" ,
                buttonHidden: false  ,
                closeHidden: true
            )
            
        ]
    }
    
    
    /* Load popup data for the choosed type */
    func data(popupType: YesNOPopupTypes) ->  PopupObject {
        return PopupObjects()[popupType.rawValue]
    }

}
