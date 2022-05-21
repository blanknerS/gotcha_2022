//
//  GifImageView.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/21/22.
//

import SwiftUI
import WebKit

struct GifImageView: UIViewRepresentable {
    
    private let name: String
    
    init( name: String){
        self.name = name
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let url = Bundle.main.url(forResource: name , withExtension: "gif")!
        let data = try! Data(contentsOf: url)
        
        webView.load(
            data,
            mimeType: "image/gif",
            characterEncodingName: "UTF-8",
            baseURL: url.deletingLastPathComponent()
        )
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }
}

struct GifImageView_Previews: PreviewProvider {
    static var previews: some View {
        GifImageView(name: "anonymous-glitch")
    }
}
