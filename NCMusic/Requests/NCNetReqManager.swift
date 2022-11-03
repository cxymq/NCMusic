//
//  NCNetManager.swift
//  NCMusic
//
//  Created by nazimai on 2022/9/7.
//

import Moya

let provider = MoyaProvider<NCNetService>(stubClosure: MoyaProvider.immediatelyStub, plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
