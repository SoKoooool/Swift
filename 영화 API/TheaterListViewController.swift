//
//  TheaterListViewController.swift
//  MyApps
//
//  Created by TORI on 2020/08/27.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class TheaterListViewController: UITableViewController {
    var list = [NSDictionary]() // API의 데이터를 저장할 배열
    var startpoint = 0
    
    @IBAction func moreBtn(_ sender: UIButton) {
        self.startpoint += 10
        self.callTheaterAPI()
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callTheaterAPI()
    }
    
    func callTheaterAPI() {
        let requestURI = "http://swiftapi.rubypaper.co.kr:2029/theater/list"
        let sList = 10
        let type = "json"
        
        let urlObj = URL(string: "\(requestURI)?s_page=\(self.startpoint)&s_list=\(sList)&type=\(type)")
        
        do {
            let stringdata = try NSString(contentsOf: urlObj!, encoding: 0x80_000_422)
            let encdata = stringdata.data(using: String.Encoding.utf8.rawValue)
            do {
                let apiArray = try JSONSerialization.jsonObject(with: encdata!, options: []) as? NSArray
                
                for obj in apiArray! {
                    self.list.append(obj as! NSDictionary)
                }
            } catch {
                let alert = UIAlertController(title: "실패", message: "데이터 분석이 실패하였습니다", preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default)
                alert.addAction(ok)
                self.present(alert, animated: true)
            }
            self.startpoint += sList
        } catch {
            let alert = UIAlertController(title: "실패", message: "데이터를 불러오는데 실패하였습니다", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default)
            alert.addAction(ok)
            self.present(alert, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let obj = self.list[indexPath.row]
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ListCell") as! TheaterListCell
        
        cell.name.text = obj["상영관명"] as? String
        cell.addr.text = obj["소재지도로명주소"] as? String
        cell.tel.text = obj["연락처"] as? String
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TheaterListDetailSegue" {
            let path = self.tableView.indexPath(for: sender as! UITableViewCell)
            let data = self.list[path!.row]
            (segue.destination as? TheaterListDetailViewController)?.param = data
        }
    }
}
