//
//  DataManager.swift
//  SPHTechTest
//
//  Created by yuanchun tang on 18/8/2019.
//

import Foundation


class DataManager {
    func getModesl(_ completionHandler: @escaping ([MobileDataModel]?, Error?) -> Void) {
        if let modes = MobileDataModel.mr_findAll() as? [MobileDataModel], modes.count > 0 {
            completionHandler(modes, nil)
            return
        }
        
        apiManagerInstance.datastoreSearch("a807b7ab-6cad-4aa6-87d0-e283a7353a0f", 20) { (data, error) in
            guard let records = data?.result.records else {
                completionHandler(nil, ErrorsToThrow.getDataFail)
                return
            }
            let models = records.map({ (item) -> MobileDataModel in
                let mobileDataModel = MobileDataModel.mr_createEntity()
                mobileDataModel?.quarter = item.quarter
                mobileDataModel?.volumeOfMobileData = item.volumeOfMobileData
                return mobileDataModel ?? MobileDataModel()
            })
            completionHandler(models, nil)
        }
    }
}

let dataManagerInstance = DataManager()
