//
//  HomeModel.swift
//  task
//
//  Created by Boo Doo on 8/28/21.
//

import Foundation
import Alamofire
enum  ItemDataResponse {
    case success(result: newsModel)
    case failure
}
class NewsDataModel {
    func getNewsData(completion: @escaping (ItemDataResponse)->Void){
    let url = "https://newsapi.org/v2/top-headlines?country=eg&apiKey=cec8b6244f0f466088f45a017a66f1a5"
    AF.request(url,method: .get,encoding: JSONEncoding.default, headers: nil).responseDecodable(of: newsModel.self) { (response) in
        switch response.result{
        case .failure(let error):
            print("errorr",error.localizedDescription)
            completion(.failure)
        case .success(let jsonObj):
            completion(.success(result: jsonObj))
        }
    }
    }
}
