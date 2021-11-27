//
//  LectureViewController.swift
//  NetworkPerformanceEvaluation
//
//  Created by Ji-hoon Ahn on 2021/11/28.
//

import UIKit
import SnapKit
import Then
import AVKit
class LectureViewController : BaseVc{
    
    private let lectureTb = UITableView().then{
        $0.register(LectureTableViewTitleCell.self, forCellReuseIdentifier: LectureTableViewTitleCell.identifier)
        $0.register(LectureTableViewMovieCell.self, forCellReuseIdentifier: LectureTableViewMovieCell.identifier)
        $0.register(LectureTableViewContentCell.self, forCellReuseIdentifier: LectureTableViewContentCell.identifier)
        $0.showsVerticalScrollIndicator = false
        $0.backgroundColor = .white
        $0.separatorColor = .clear
    }
    
    override func configure() {
        super.configure()
        addView()
        location()
        [lectureTb].forEach{ $0.delegate = self; $0.dataSource = self}
    }
    private func addView(){
        view.addSubview(lectureTb)
    }
    private func location(){
        lectureTb.snp.makeConstraints{
            $0.top.right.left.bottom.equalToSuperview()
        }
    }
    private func playVideo(url: NSURL){
        //AVPLAYERController의 인스턴스 생성
        let playerController = AVPlayerViewController()
        let player = AVPlayer(url: url as URL)
        playerController.player = player
        self.present(playerController, animated: true) {
            player.play()
        }
    }
    
}
extension LectureViewController : UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LectureTableViewTitleCell.identifier, for: indexPath) as? LectureTableViewTitleCell else{return UITableViewCell()}
            cell.backgroundColor = .clear
            return cell
        }else if indexPath.item == 1{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LectureTableViewMovieCell.identifier, for: indexPath) as? LectureTableViewMovieCell else{return UITableViewCell()}
            cell.backgroundColor = .clear

            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LectureTableViewContentCell.identifier, for: indexPath) as? LectureTableViewContentCell else{return UITableViewCell()}
            cell.backgroundColor = .clear

            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.item == 1{
            let url = NSURL(string: "https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fileworks.mp4")!
            playVideo(url: url)
        }
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 0{
            return 51
        }else if indexPath.item == 1{
            return 226
        }else {
            return UITableView.automaticDimension
        }
    }
}
