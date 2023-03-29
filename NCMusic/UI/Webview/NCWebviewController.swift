//
//  NCWebviewController.swift
//  NCMusic
//
//  Created by nazimai on 2023/3/29.
//

import Foundation
import WebKit

class NCWebviewController: NCBaseViewController {
    var webview: WKWebView!
    var urlStr: String?
    
    override func viewDidLoad() {
        let config = WKWebViewConfiguration()
        webview = WKWebView(frame: .init(x: 0, y: 0, width: NCScreenW, height: NCScreenH), configuration: config)
        webview.navigationDelegate = self
        view.addSubview(webview)

        if let url = URL(string: urlStr ?? "") {
            let request = URLRequest(url: url)
            webview.load(request)
        }
    }
}

extension NCWebviewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("document.title") { title, error in
            self.title = (title as! String)
        }
    }
}
