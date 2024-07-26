//
//  ExportHTMLApp.swift
//  ExportHTML
//
//  Created by Angelos Staboulis on 26/7/24.
//

import SwiftUI

@main
struct ExportHTMLApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(urlDownload: "", savingFile: "", isDownload: false,isShowings: false, helper: .init())
                .frame(width:650,height:600,alignment: .center)
        }.windowResizability(.contentSize)
    }
}
