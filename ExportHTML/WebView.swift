//
//  WebView.swift
//  ExportHTML
//
//  Created by Angelos Staboulis on 26/7/24.
//

import Foundation
import WebKit
import Cocoa
import SwiftUI
struct WebView:NSViewRepresentable{
    typealias NSViewType = WKWebView
    var urlFile = String()
    func makeNSView(context: Context) -> WKWebView {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsAirPlayForMediaPlayback = true
        webConfiguration.mediaTypesRequiringUserActionForPlayback = []
        let webView = WKWebView(frame: .zero,configuration: webConfiguration)
        if let urlMain = URL(string:urlFile) {
            webView.load(URLRequest(url: urlMain))
        }
        return webView
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
    }
    

    
}
