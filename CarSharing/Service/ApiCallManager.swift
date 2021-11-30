//
//  ApiCallManager.swift
//  CarSharing
//
//  Created by Bouabid Wassim on 30/11/2021.
//

//

import Foundation
import Alamofire
import SwiftyJSON




    /// Base URL
    let baseURL = "https://91f0-196-179-246-130.ngrok.io/"


        /// Different errors that can be occured when retrieve data
        enum CarSharingError: Error {
            // when json data has no raw string
            case unexpectedRawString
        
            // cannot get data from raw string
            case unexpectedJsonData
        
            // unable to decode data into codable object
            case unableToDecode
            
            // no such user
            case noUser
            
            // mal formed url
            case malformedUrl
            }


        /// Endpoints
        enum Endpoints: String {
            case login = "login"
            case loginRegister = "user/login"
        }

        enum Headers: String {
            case authorization = "Authorization"
        }


/** Add a preliminary check, so if the response contains unexpected behavior, an error will be raised */
    func preliminaryCheck(
        jsonResponse: JSON,
        failureCallback: ((_ error: Error) -> Void)?
    ) -> Data? {
        guard let jsonString = jsonResponse.rawString() else {
            failureCallback?(CarSharingError.unexpectedRawString)
            return nil
        }
    
        guard let jsonData = jsonString.data(using: .utf8) else {
            failureCallback?(CarSharingError.unexpectedJsonData)
            return nil
        }
    
        return jsonData
    }


    // MARK: - Request Handler
    /** Centralize all the `Alamofire` calls */
     func createRequest (
        _ url: String,
        method: HTTPMethod,
        headers: HTTPHeaders?,
        parameters: [String: Any],
        onSuccess successCallback: ((JSON) -> Void)?,
        onFailure failureCallback: ((Error) -> Void)?
        ) {
        AF.request(
            url,
            method: method,
            parameters: parameters,
            headers: headers
        )
        .validate()
        .responseJSON { response in
            switch response.result {
        
            case .success(let value):
                let json = JSON(value)
                successCallback?(json)
                
            case .failure(let error):
                failureCallback?(error)
            }
        }
}



