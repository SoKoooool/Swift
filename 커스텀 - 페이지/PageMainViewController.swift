//
//  PageMainViewController.swift
//  MyApps
//
//  Created by TORI on 2020/11/27.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class PageMainViewController: UIViewController {
    var pageVC: UIPageViewController!
    var pageImages = [UIImage(named: "Page 1"), UIImage(named: "Page 2"), UIImage(named: "Page 3"), UIImage(named: "Page 4")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setup()
    }
    
    func setup() {
        // UIPageViewController
        let sb = UIStoryboard(name: "Page", bundle: .main)
        self.pageVC = sb.instantiateViewController(identifier: "PageVC") as? UIPageViewController
        self.pageVC.delegate = self
        self.pageVC.dataSource = self
        
        let startContentVC = self.getContentVC(atIndex: 0)!
        self.pageVC.setViewControllers([startContentVC], direction: .forward, animated: true)
        self.addChild(self.pageVC) // pageVC를 자식뷰로 추가
        self.view.addSubview(self.pageVC.view) // pageVC.view를 서브뷰로 추가
        self.pageVC.didMove(toParent: self) // pageVC를 부모뷰의 앞으로 이동 ??
        
        self.pageVC.view.translatesAutoresizingMaskIntoConstraints = false
        self.pageVC.view.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor).isActive = true
        self.pageVC.view.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor).isActive = true
        self.pageVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.pageVC.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        // 인디케이터 설정
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = .systemGray
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.backgroundColor = .none
    }
}

// MARK: - 페이지뷰 델리게이트

extension PageMainViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func getContentVC(atIndex idx: Int) -> UIViewController? {
        // 페이지 인덱싱해서 컨텐츠 로드
        let sb = UIStoryboard(name: "Page", bundle: .main)
        guard let cvc = sb.instantiateViewController(identifier: "ContentVC") as? PageContentViewController else { // 스토리보드에서 ContentVC 뷰컨 찾아서 다운캐스팅, 실패하면 nil 반환
            return nil
        }

        // 컨텐츠뷰에 인덱싱한 번호 대입
        cvc.imgStr = self.pageImages[idx] // 호출한 인덱스 이미지를 전송
        cvc.pageIndex = idx // 호출한 인덱스 번호를 부여
        return cvc
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        // 페이지를 불러온 후
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // 현재 표시된 컨텐츠뷰의 이전 컨텐츠 로드
        guard var index = (viewController as! PageContentViewController).pageIndex else { // 컨텐츠 뷰컨의 pageIndex 가져오기
            return nil
        }
        
        guard index > 0 else { // 에러 방지 구문 - 가져온 인덱스가 0보다 작으면 nil
            return nil
        }
        
        index -= 1 // 가져온 인덱스에 -1
        return self.getContentVC(atIndex: index) // 페이지 인덱싱해서 컨텐츠 로드
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // 현재 표시된 컨텐츠뷰의 다음 컨텐츠 로드
        guard var index = (viewController as! PageContentViewController).pageIndex else { // 컨텐츠 뷰컨의 pageIndex 가져오기
            return nil
        }
        
        index += 1 // 가져온 인덱스에 +1
        
        guard index < self.pageImages.count else { // 에러 방지 구문 - 가져온 인덱스가 컨텐츠 개수보다 크면 nil
            return nil
        }
        
        return self.getContentVC(atIndex: index) // 페이지 인덱싱해서 컨텐츠 로드
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        // 인디케이터 개수
        return self.pageImages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        // 인디케이터 초기 선택 번호
        return 0
    }
}
