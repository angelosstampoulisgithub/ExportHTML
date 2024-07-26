//
//  Helper.swift
//  ExportHTML
//
//  Created by Angelos Staboulis on 26/7/24.
//

import Foundation
import WebKit
struct Helper{
    func getDownloadsDirectory()->String{
        guard let directory = FileManager.default.urls(for: .downloadsDirectory, in: .allDomainsMask).first else{
            return ""
        }
        return directory.path()
    }
    func downloadfile(urlDownload:String,save:String){
        guard let urlmain = URL(string: urlDownload) else{
            return
        }
        let request = URLRequest(url: urlmain)
        URLSession.shared.downloadTask(with: request) { url, response, error in
            do{
                guard let fileURL = url else{
                    return
                }
                guard let saveURL = URL(string:save) else{
                    return
                }
                try FileManager.default.moveItem(at: fileURL, to: saveURL)
            }catch{
                debugPrint("something went wrong!!!!!")
            }
        }.resume()
        URLSession.shared.dataTask(with: request) { data, response, error in
                 FileManager.default.createFile(atPath: save, contents: data)
        }.resume()
        
    }
    func removeWebViewCache(completion: @escaping () -> ()) {
        let dataStore = WKWebsiteDataStore.default()
        dataStore.fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
            dataStore.removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), for: records, completionHandler: completion)
        }
    }
}
