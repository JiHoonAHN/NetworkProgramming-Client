//
//  LectureTableViewCell.swift
//  NetworkPerformanceEvaluation
//
//  Created by Ji-hoon Ahn on 2021/11/28.
//

import UIKit
struct LectureTitle {
    let title : String
    let writer : String
}
struct LectureMovie{
    let image : UIImage
}
struct LectureContent {
    let content: String?
}

class LectureTableViewTitleCell: BaseTableViewCell<LectureTitle>{
    static let identifier = "LectureTableViewTitleCell"
    private let divider = UIView().then{
        $0.backgroundColor = .gray
    }
    private let title = UILabel(frame: .zero).then{
        $0.textColor = .black
        $0.font = UIFont(name: "AppleSDGothicNeoB'", size: 20)
        $0.text = "과목"
    }
    private let writerLabel = UILabel(frame: .zero).then{
        $0.textColor = .black
        $0.font = UIFont(name: "'AppleSDGothicNeoEB", size: 10)
        $0.text = "작성자"
    }
    override func configure() {
        super.configure()
        [divider,title,writerLabel].forEach{ contentView.addSubview($0)}
        location()
    }
    
    private func location(){
        divider.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.height.equalTo(0.5)
            $0.right.left.equalToSuperview().inset(20)
        }
        title.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(17)
        }
        writerLabel.snp.makeConstraints{
            
            $0.bottom.equalTo(title.snp.bottom)
            $0.left.equalTo(title.snp.right).offset(6)
        }
    }
    
    override func bind(_ model: LectureTitle) {
        super.bind(model)
        title.text = model.title
        writerLabel.text = model.writer
    }
}
class LectureTableViewMovieCell: BaseTableViewCell<LectureMovie>{
    static let identifier = "LectureTableViewMovieCell"

   private  let iv = UIImageView().then{
        $0.backgroundColor = .gray
       $0.contentMode = .scaleAspectFill
    }
    override func configure() {
        super.configure()
        contentView.addSubview(iv)
        iv.snp.makeConstraints{
            $0.top.right.left.bottom.equalToSuperview()
        }
    }
    override func bind(_ model: LectureMovie) {
        super.bind(model)
        iv.image = model.image
    }
}
class LectureTableViewContentCell: BaseTableViewCell<LectureContent>{
    static let identifier = "LectureTableViewContentCell"

    private let title = UILabel().then{
        $0.textColor = .black
        $0.font = UIFont(name: "'AppleSDGothicNeo-SemiBold", size: 10)
        $0.text = "하고싶은 말"
    }
    private let content = UILabel().then{
        $0.textColor = .black
        $0.font = UIFont(name: "'AppleSDGothicNeo-SemiBold", size: 10)
        $0.text = "wiqniwndiqnwidnqiwndiqniwdniqwidnqwwdiqidni\nqwidnqiwndnqiwdiqidwnqndiqnwdiqdniwq\n"
        $0.numberOfLines = 9
    }
    override func configure() {
        super.configure()
        [title,content].forEach{contentView.addSubview($0)}
        location()
    }
    private func location(){
        title.snp.makeConstraints{
            $0.top.equalToSuperview().offset(11)
            $0.left.equalToSuperview().offset(11)
        }
        content.snp.makeConstraints{
            $0.top.equalTo(title.snp.bottom).offset(6)
            $0.left.right.equalToSuperview().inset(11)
            $0.bottom.equalToSuperview().offset(6)
        }
    }
    
    override func bind(_ model: LectureContent) {
        super.bind(model)
        content.text = model.content
    }
    
}

