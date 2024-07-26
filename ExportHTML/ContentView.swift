//
//  ContentView.swift
//  ExportHTML
//
//  Created by Angelos Staboulis on 26/7/24.
//

import SwiftUI
import AlertToast
struct ContentView: View {
    @State var urlDownload:String
    @State var savingFile:String
    @State var isDownload:Bool
    @State var isShowings:Bool
    var helper:Helper
    var body: some View {
        VStack {
            Text("Enter your url for Download").frame(width:650,alignment: .leading)
            TextField("Enter your url for Download",text: $urlDownload).frame(width:650,height:45,alignment: .leading)
            Text("Enter your path for Saving File").frame(width:650,alignment: .leading)
            TextField("Enter your path for Saving File",text: $savingFile).frame(width:650,height:45,alignment: .leading)
            if isShowings {
                MediaView(urlFile: urlDownload)
                    .frame(width: 650, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }else{
                StopMediaView(urlFile: "https://www.google.com")
                    .frame(width: 650, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            Button {
                isShowings.toggle()
            } label: {
                Text("Show File").frame(width:650,height:45,alignment: .center)
            }
            Button(action: {
                Task{
                    isDownload.toggle()
                    helper.downloadfile(urlDownload: urlDownload, save:savingFile)
                }
            }, label: {
                Text("Download file").frame(width:650,height:45,alignment: .center)
            }).toast(isPresenting: $isDownload) {
                AlertToast(type: .complete(.red), title: "Download is fnished!")
            }
        }.frame(width:650,height:350)
            .onAppear(perform: {
                savingFile = helper.getDownloadsDirectory()
            })
        
    }
}

#Preview {
    ContentView(urlDownload: "", savingFile: "",  isDownload: false, isShowings: false, helper: .init())
}
