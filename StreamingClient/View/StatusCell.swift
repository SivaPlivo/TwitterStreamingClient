//
//  StatusCell.swift
//  StreamingClient
//
//  Created by Siva  on 21/01/18.
//  Copyright © 2018 Siva . All rights reserved.
//

import UIKit
import Kingfisher

class StatusCell: UICollectionViewCell {
    
    fileprivate static let padding: CGFloat = 10.0
    fileprivate static let nameLabelHeight: CGFloat = 20.0
    fileprivate static let imageWidth: CGFloat = 48.0
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageView.layer.masksToBounds = true
        self.imageView.layer.cornerRadius = 5
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }
    
    // MARK: - Public methods
    
    func configure(withStatus status: Status) {
        self.nameLabel.text = status.user?.screenName
        self.dateLabel.text = DateFormatter.news_statusDataFormatter.string(from: status.insertDate ?? Date())
        self.textLabel.attributedText = StatusCell.attributedTextString(withStatus: status, highlightWords: true)
        if let urlString = status.user?.profileImageURL, let url = URL(string: urlString) {
            self.imageView.kf.setImage(with: url)
        }
    }
    
    static func height(withStatus status: Status, width: CGFloat) -> CGFloat {
        let realWidth = width - (StatusCell.padding * 3) - StatusCell.imageWidth
        let attributedText = StatusCell.attributedTextString(withStatus: status, highlightWords: false)
        let textSize = attributedText.boundingRect(
            with: CGSize(width: realWidth, height:  CGFloat.greatestFiniteMagnitude),
            options: [.usesFontLeading, .usesLineFragmentOrigin],
            context: nil
        )
        
        let height = (StatusCell.padding * 3) + textSize.height + StatusCell.nameLabelHeight
        return height
    }
    
    static func nib() -> UINib {
        let name = NSStringFromClass(StatusCell.self).components(separatedBy: ".").last ?? ""
        return UINib(nibName: name, bundle: nil)
    }
    
}

/**
 Attributed string helpers
 */
extension StatusCell {
    
    fileprivate static func attributedTextString(withStatus status: Status, highlightWords: Bool) -> NSAttributedString {
        let attributes = [
            NSAttributedStringKey.font: UIFont.news_secondaryFont(withSize: 15),
            NSAttributedStringKey.foregroundColor: UIColor.news_lightText()
        ]
        
        let attributedString = NSMutableAttributedString(string: status.text ?? "", attributes: attributes)
        
        if highlightWords == false {
            return attributedString
        }
        
        // Attribute hashtags
        status.hashtags?.forEach { hashtag in
            if let hashtag = hashtag as? Hashtag, let text = hashtag.text {
                attributedString.hightlight(string: "#\(text)")
            }
        }
        
        // Attribute urls
        status.urls?.forEach { url in
            if let url = url as? Url, let text = url.url {
                attributedString.hightlight(string: text)
            }
        }
        
        // Attribtue mentions
        status.mentions?.forEach { mention in
            if let mention = mention as? Mention, let text = mention.screenName {
                attributedString.hightlight(string: "@\(text)")
            }
        }
        
        return attributedString
    }
    
}

extension NSMutableAttributedString {
    
    func hightlight(string: String) {
        let attributes = [
            NSAttributedStringKey.foregroundColor: UIColor.news_highlightText()
        ]
        let range = (self.string as NSString).range(of: string)
        self.addAttributes(attributes, range: range)
    }
    
}

