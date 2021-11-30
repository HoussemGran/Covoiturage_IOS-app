//
//  Login.swift
//  CarSharing
//
//  Created by Bouabid Wassim on 30/11/2021.
//

import Foundation
import Alamofire
import SwiftyJSON








    // MARK: -LoginRegisterAPI
    func loginRegister(
        parameters: [String: Any],
        onSuccess successCallback: ((_ exist: User) -> Void)?,
        onFailure failureCallback: ((_ error: Error) -> Void)?
    ) {

    let url = baseURL + Endpoints.loginRegister.rawValue
    createRequest(
        url,
        method: .post,
        headers: nil,
        parameters: parameters,
        onSuccess: { jsonResponse in
            guard let callback = successCallback else {
                return
            }

            print(jsonResponse)
            // if someting unexpected happened, raise an exception and call the failure callback
            guard let jsonData = preliminaryCheck(
                    jsonResponse: jsonResponse[],
                    failureCallback: failureCallback
            ) else {
                    print("[AuthService] LoginRegister, an error has occured")
                    return
            }

            do {
                // user object
                let loginRegister = try JSONDecoder().decode(User.self, from: jsonData)
                callback(loginRegister)
            } catch {
                failureCallback?(CarSharingError.unableToDecode)
                print("[AuthService] LoginRegister, unable to decode existLogin")
            }

        }) { error in
            guard let callback = failureCallback else {
                return
            }
            callback(error)
    }
}

