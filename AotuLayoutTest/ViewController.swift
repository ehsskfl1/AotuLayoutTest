//
//  ViewController.swift
//  AotuLayoutTest
//
//  Created by kim hyunsoo on 24/01/2019.
//  Copyright © 2019 kim hyunsoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - UIView var -
    let workMainView:UIView = UIView.init();
    let workSubView:UIView  = UIView.init();
    let mainView:UIView     = UIView.init();
    
    // MARK: - UIViewController -
    // 뷰 호출 시작
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad");
    }
    
    // 뷰가 완성되기 직전
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        print("view will appear");
    }
    
    // 레이아웃의 변동이 있을 경우 호출
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews();
        print("view will layout subviews");
        
        self.uiViewCreate();
    }
    
    // MARK: - UIView Frame set -
    // 작업 뷰 등록
    func uiViewCreate() {
        // safe padding
        var topSafePadding = 20.0 as CGFloat;
        var bottomSafePadding = 0.0 as CGFloat;
        var leftSafePadding = 0.0 as CGFloat;
        var rightSafePadding = 0.0 as CGFloat;
        
        let guideWidth  = UIScreen.main.bounds.width;
        let guideHeight = UIScreen.main.bounds.height;
        
        // iOS 11이후 safe area 생김
        if #available(iOS 11.0, *) {
            let viewFrame = UIApplication.shared.keyWindow;
            
            topSafePadding    = viewFrame?.safeAreaInsets.top ?? 0.0;
            bottomSafePadding = viewFrame?.safeAreaInsets.bottom ?? 0.0;
            leftSafePadding   = viewFrame?.safeAreaInsets.left ?? 0.0;
            rightSafePadding  = viewFrame?.safeAreaInsets.right ?? 0.0;
        }
        
        // 작업 추가할 뷰
        mainView.frame = CGRect(x: leftSafePadding, y: topSafePadding, width: guideWidth - (leftSafePadding + rightSafePadding), height: guideHeight - (topSafePadding + bottomSafePadding));
        mainView.backgroundColor = UIColor.yellow;
        self.view.addSubview(mainView);
        
        // auto layout 사용여부. false로 자동설정 종료
        workMainView.translatesAutoresizingMaskIntoConstraints = false;
        
        // 뷰의 배경색 선언
        workMainView.backgroundColor = UIColor.red;
        workSubView.backgroundColor  = UIColor.gray;
        
        mainView.addSubview(workMainView);
        
        self.viewFrameSet();
    }
    
    // 뷰 오토레이아웃
    func viewFrameSet() {
        //        self.view.setNeedsLayout();
        self.view.layoutIfNeeded();
        
        // 최상단뷰를 표준 마진의 기준으로 사용
        let margins = view.layoutMarginsGuide;
        print("\(margins)");
        
        // 메인 설정
        workMainView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 5).isActive = true;
        workMainView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true;
        workMainView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -5).isActive = true;
        workMainView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true;
        
        // 서브 설정
        //        subView.translatesAutoresizingMaskIntoConstraints  = false;
        //        mainView.addSubview(subView);
        
        //        subView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10).isActive = true;
        //        subView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10).isActive = true;
        //        subView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 10).isActive = true;
        //        subView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 10).isActive = true;
    }
    
    // MARK: - Function -
    
    
    
    // @end
}
