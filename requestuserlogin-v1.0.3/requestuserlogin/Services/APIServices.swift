import Alamofire
import Foundation

struct APIServices {
    public static let shared = APIServices()

    func callCreateLogin(queryItems: [URLQueryItem]? = nil, parameters: Parameters? = nil, success: @escaping (_ result: CreateLoginResponse?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        var headers = HTTPHeaders()
        headers["content-type"] = "application/json"

        APIManager.shared.callAPI(strURL: AppConstants.URL.apiLogin, queryItems: queryItems, method: .post, headers: headers, parameters: parameters, success: { response in
            do {
                if let data = response.data {
                    let createLoginResponse = try JSONDecoder().decode(CreateLoginResponse.self, from: data)
                    success(createLoginResponse)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }

        }, failure: { error in
            failure(FailureMessage(error))
        })
    }
}
