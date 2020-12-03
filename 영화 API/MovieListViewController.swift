//
//  MovieListViewController.swift
//  MyApps
//
//  Created by TORI on 2020/08/27.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class MovieListViewController: UITableViewController {
    var date: Int!
    lazy var list: [MovieListData] = {
        var datalist = [MovieListData]()
        return datalist
    }()
    
    @IBOutlet var more: UIButton!
    @IBAction func moreBtn(_ sender: UIButton) {
        self.date -= 1
        self.callMovieAPI()
        self.tableView.reloadData()
        print(self.date!)
    }
    
    @objc func callMovieAPI() {
        // API 호출
        let url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=3e605b629d9ba0ae95d81d3a4da9e692&targetDt=\(date!)"
        let apiURI: URL! = URL(string: url)
        let apidata = try! Data(contentsOf: apiURI)
        let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? ""
        NSLog("API Result = \(log)")
        
        do {
            // API 객체 캐스팅
            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            let boxOfficeResult = apiDictionary["boxOfficeResult"] as! NSDictionary
            let dailyBoxOfficeList = boxOfficeResult["dailyBoxOfficeList"] as! NSArray
            
            for row in dailyBoxOfficeList {
                // 캐스팅한 데이터 할당
                let r = row as! NSDictionary
                let mvo = MovieListData()
                
                // mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.title = r["movieNm"] as? String
                mvo.description = r["rankOldAndNew"] as? String
                mvo.opendata = r["openDt"] as? String
                mvo.rating = ((r["rank"] as! NSString).doubleValue)
                mvo.detail = r["linkUrl"] as? String // 영화 주소 경로가 없음, 다른 사이트에서 받아와야 할듯
                
                self.list.append(mvo)
            }
        } catch {
            // 캐스팅 실패시 구문
            NSLog("Parse Error")
        }
    }
    
    @objc func getThumbnailImage(_ index: Int) -> UIImage {
        let mvo = self.list[index]
        
        if let savedImage = mvo.thumbnailImage {
            return savedImage
        } else {
            let url: URL! = URL(string: mvo.thumbnail!)
            let imageData = try! Data(contentsOf: url)
            mvo.thumbnailImage = UIImage(data: imageData)
            
            return mvo.thumbnailImage!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        #warning("calendar 사용해서 구현해야함 dateFormatter 아님")
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let yesterday = formatter.string(from: Date().dayBefore)
        self.date = Int(yesterday)
        callMovieAPI()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieListCell
        
        DispatchQueue.main.async(execute: {
            // 썸네일 로딩 백그라운드로 실행
            // cell.thumbnail.image = self.getThumbnailImage(indexPath.row)
        })
        cell.title.text = row.title
        cell.desc.text = row.description
        cell.opendata.text = row.opendata
        cell.rating.text = "\(Int(row.rating!))위"
        
        NSLog("제목: \(row.title!), 호출된 행번호: \(indexPath.row)")
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 세그 작동시 실행
        if segue.identifier == "MovieListDetailSegue" {
            let path = self.tableView.indexPath(for: sender as! MovieListCell)
            let detailVC = segue.destination as? MovieListDetailViewController
            detailVC?.listdata = self.list[path!.row]
        }
    }
}

extension Date {
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }
}
