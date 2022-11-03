//
//  NCNetService.swift
//  NCMusic
//
//  Created by nazimai on 2022/9/7.
//

import Moya

enum NCNetService {
    /// 首页-发现
    case homepageBlockPage
    /// 推荐音单
    case recommendRes
    /// 推荐歌曲
    case recommendSongs
    /// 收藏
    case albumSub(t: Int)
}

extension NCNetService: TargetType {
    var baseURL: URL {
        return URL(string: "http://localhost:3000")!
    }
    
    var path: String {
        switch self {
        case .homepageBlockPage:
            return "/homepage/block/page"
        case .recommendRes:
            return "/recommend/resource"
        case .recommendSongs:
            return "/recommend/songs"
        case .albumSub(_):
            return "/album/sub"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .homepageBlockPage, .recommendRes, .recommendSongs:
            return .get
        case .albumSub:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .homepageBlockPage, .recommendRes, .recommendSongs:
            return .requestPlain
        default:
            if let params = parameters {
                return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
            }
            return .requestPlain
        }
    }
    
    var parameters: [String: Any]? {
        var params: [String: Any] = [:]
        switch self {
        case .albumSub(let t):
            params["t"] = t
        default: break
        }
        return params
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    var sampleData: Data {
        switch self {
        case .homepageBlockPage:
            return loadJson(filename: "homepageBlockPage")
        case .recommendRes:
            return loadJson(filename: "recommendRes")
        case .recommendSongs:
            return loadJson(filename: "recommendSongs")
        case .albumSub(_):
            return loadJson(filename: "albumSub")
        }
    }
}

