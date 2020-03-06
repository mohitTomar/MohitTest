//
//  AppConstants.swift
//  XebiaTest
//
//  Created by MohitTomar-iOS on 05/03/2020.
//  Copyright © 2020 Engineer.AI All rights reserved.
//

import Foundation
import UIKit

//Constant Networks
struct AppConstants {
    
    static let http    : String = "https://"
    static let apiVersion   : String = "v2/viewed/"
    static let domain       : String = "api.nytimes.com/svc/mostpopular/"
    static let apiKey       : String = "o0NI7KTwnAjIdO6EVwqs9HxDUIGRH7GP"
    static let keyPath      : String = "api-key="
    static let baseUrl      : String = AppConstants.http + AppConstants.domain + AppConstants.apiVersion
    
    static let dummyImage   : String = "https://www.team8.vc/wp-content/uploads/2017/07/img_avatar.jpg"
    
    struct NewsTableView {
        static let heightForRow = 100.0
    }
     
}
