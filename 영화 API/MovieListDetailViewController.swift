//
//  MovieListDetailViewController.swift
//  MyApps
//
//  Created by TORI on 2020/08/27.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit
import WebKit

class MovieListDetailViewController: UIViewController {
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet var wv: WKWebView!
    
    var listdata: MovieListData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.wv.navigationDelegate = self
        
        // NSLog("linkurl = \(self.listdata.detail!), title = \(self.listdata.title!)")
        self.title = self.listdata.title
        
        if let url = self.listdata.detail {
            // url 값이 전달되었을때
            if let urlobj = URL(string: url) {
                // url 주소가 정확할때
                let req = URLRequest(url: urlobj)
                self.wv.load(req)
            } else {
                // url 주소가 잘못되었을때
                let alert = UIAlertController(title: "오류", message: "잘못된 URL입니다", preferredStyle: .alert)
                let cancel = UIAlertAction(title: "확인", style: .cancel) { (_) in
                    _ = self.navigationController?.popViewController(animated: true)
                }
                alert.addAction(cancel)
                self.present(alert, animated: true)
            }
        } else {
            // url 값이 전달되지 않았을때
            let alert = UIAlertController(title: "오류", message: "필수 파라미터가 누락되었습니다", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "확인", style: .cancel) { (_) in
                _ = self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(cancel)
            self.present(alert, animated: false, completion: nil)
        }
    }
    
    @objc func alert(_ message: String, onClick: (() -> Void)? = nil) {
        // 웹뷰 로딩 실패 경고창
        let controller = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: .cancel) { (_) in onClick?()
        })
        DispatchQueue.main.sync {
            self.present(controller, animated: false)
        }
    }
}

// MARK: - WKNavigationDelegate 프로토콜 구현

extension MovieListDetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        // 웹뷰가 컨텐츠를 다운로드하기 시작할때
        self.spinner.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // 웹뷰가 컨텐츠를 다운로드 완료하였을때
        self.spinner.stopAnimating()
    }
    
    func webView(_ webview: WKWebView, didFailLoadWithError error: Error) {
        // 웹뷰가 컨텐츠를 다운로드 도중에 실패하였을때
        self.spinner.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        // 웹뷰가 컨텐츠를 다운로드 도중에 실패하였을때
        self.spinner.stopAnimating()
        self.alert("상세페이지를 읽어오지 못했습니다") {
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        // 웹뷰가 처음부터 컨텐츠를 다운로드 실패하였을때
        self.spinner.stopAnimating()
        self.alert("상세페이지를 읽어오지 못했습니다") {
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
}
