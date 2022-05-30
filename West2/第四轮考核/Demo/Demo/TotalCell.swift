//
//  TotalCell.swift
//  Demo
//
//  Created by 林宏宇 on 2022/3/1.
//

import UIKit

class TotalCell: UITableViewCell {

    private var HeadTitle:UILabel!
    private var subTitle:UILabel!
    private var block1:UILabel!
    private var inLabel:UILabel!
    private var inText:UILabel!
    private var block2:UILabel!
    private var outLabel:UILabel!
    private var outText:UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let vStack = UIStackView()
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.axis = .vertical
        vStack.spacing = 8
        vStack.alignment = .center
        vStack.layer.cornerRadius = 6
        vStack.layer.masksToBounds = true
        vStack.layer.borderColor = UIColor.systemGray5.cgColor
        contentView.addSubview(vStack)
        NSLayoutConstraint.activate([
            vStack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            vStack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            vStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5)
        ])
        
        let titleHStack = UIStackView()
        titleHStack.translatesAutoresizingMaskIntoConstraints = false
        titleHStack.axis = .horizontal
        titleHStack.spacing = 8
        HeadTitle = UILabel()
        HeadTitle.font = .systemFont(ofSize: 25)
        HeadTitle.textColor = .systemBlue
        titleHStack.addArrangedSubview(HeadTitle)
        subTitle = UILabel()
        subTitle.font = .systemFont(ofSize: 15)
        subTitle.textColor = .white
        subTitle.backgroundColor = .systemGreen
        titleHStack.addArrangedSubview(subTitle)
        block1 = UILabel()
        block1.text = "——————————————————————————"
        titleHStack.addArrangedSubview(block1)
        vStack.addArrangedSubview(titleHStack)
        
        let inHStack = UIStackView()
        inHStack.translatesAutoresizingMaskIntoConstraints = false
        inHStack.axis = .horizontal
        inHStack.spacing = 8
        inLabel = UILabel()
        inLabel.text = "入"
        inLabel.textColor = .white
        inLabel.backgroundColor = .blue
        inLabel.layer.cornerRadius = 6
        inLabel.layer.masksToBounds = true
        inHStack.addArrangedSubview(inLabel)
        inText = UILabel()
        inText.textColor = .black
        inText.font = .systemFont(ofSize: 15)
        inText.numberOfLines = 0
        inHStack.addArrangedSubview(inText)
        block2 = UILabel()
        block2.text = "---------------------------"
        inHStack.addArrangedSubview(block2)
        vStack.addArrangedSubview(inHStack)
        
        let outHStack = UIStackView()
        outHStack.translatesAutoresizingMaskIntoConstraints = false
        outHStack.axis = .horizontal
        outHStack.spacing = 8
        outLabel = UILabel()
        outLabel.text = "入"
        outLabel.textColor = .white
        outLabel.backgroundColor = .blue
        outLabel.layer.cornerRadius = 6
        outLabel.layer.masksToBounds = true
        outHStack.addArrangedSubview(inLabel)
        outText = UILabel()
        outText.textColor = .black
        outText.font = .systemFont(ofSize: 15)
        outText.numberOfLines = 0
        outHStack.addArrangedSubview(outText)
        vStack.addArrangedSubview(outHStack)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setMainTitle(_ maintitle:String){
        HeadTitle.text = maintitle
    }
    
    func setSubTitle(_ subtitle:String){
        subTitle.text = subtitle
    }
    
    func setInText(_ intext:String){
        inText.text = intext
    }
    
    func setOutText(_ outtext:String){
        outText.text = outtext
    }
    
    func setSubTitle(_ color:UIColor){
        subTitle.backgroundColor = color
    }
    
}
