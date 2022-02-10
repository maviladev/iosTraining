//
//  HomeInteractor.swift
//  Airplane
//
//  Created by Marcos Avila Rodriguez on 09/02/22.
//

import Foundation
import Alamofire

enum ServiceResult {
    case success(data: Any?)
    case failed(error: String?)
}

typealias ServiceCompletion = (_ result: ServiceResult) -> ()

protocol HomeUseCase {
    func fetchRequest(count: Int, callback: @escaping ServiceCompletion)
    
}

class HomeInteractor {
    let url = "https://randomuser.me/api/"
}

extension HomeInteractor: HomeUseCase {
    //    https://randomuser.me/api/?results=5000
    func fetchRequest(count: Int, callback: @escaping ServiceCompletion) {
        Alamofire.request(url, method: .get, parameters: ["results": count], encoding: URLEncoding.queryString).responseDecodable {
            (response: DataResponse<Users>) in
            
            print("request: \(String(describing: response.request))")
            print("response: \(String(describing: response.response))")
            print("result: \(response.result)")
            
            if let users = response.value {
                callback(ServiceResult.success(data: users))
            } else {
                callback(ServiceResult.failed(error: "Ha fallado el json"))
            }
        }
    }
}

// MARK: - Alamofire response handlers

extension DataRequest {
    
    // MARK: - Helper functions for creating encoders and decoders

    func newJSONDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
            decoder.dateDecodingStrategy = .iso8601
        }
        return decoder
    }

    func newJSONEncoder() -> JSONEncoder {
        let encoder = JSONEncoder()
        if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
            encoder.dateEncodingStrategy = .iso8601
        }
        return encoder
    }
    
    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
        return DataResponseSerializer { _, response, data, error in
            guard error == nil else { return .failure(error!) }

            guard let data = data else {
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
            }

            return Result { try self.newJSONDecoder().decode(T.self, from: data) }
        }
    }

    @discardableResult
    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
    }

    @discardableResult
    func responseUsers(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Users>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
