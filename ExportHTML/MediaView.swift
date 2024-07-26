//
//  MediaView.swift
//  ExportHTML
//
//  Created by Angelos Staboulis on 26/7/24.
//

import SwiftUI

struct MediaView: View {
    @State private var amount = 0.0
    @State var urlFile:String
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack(alignment: .center) {
            ProgressView("Loading…", value: amount, total: 50)
                .onReceive(timer) { _ in
                    if amount < 50 {
                        amount += 2
                    }
            }.opacity(amount < 50 ? 1 : 0.0)
            .progressViewStyle(.circular)
            
        }.background {
            WebView(urlFile:urlFile).frame(width:650,height:300)
        }
    }
}

#Preview {
    MediaView(urlFile: "")
}
