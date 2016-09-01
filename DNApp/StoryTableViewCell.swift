//
//  StoryTableViewCell.swift
//  DNApp
//
//  Created by Vyacheslav Horbach on 31/08/16.
//  Copyright © 2016 Vyacheslav Horbach. All rights reserved.
//

import UIKit

protocol StoryTableViewCellDelegate: class  {
    func storyTableViewCellDidTouchUpvote(cell: StoryTableViewCell, sender: AnyObject)
    func storyTableViewCellDidTouchComment(cell: StoryTableViewCell, sender: AnyObject)
}

class StoryTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var badgeImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var commentTextView: AutoTextView!
    
    weak var delegate: StoryTableViewCellDelegate?
    
    
    @IBOutlet weak var upvoteButton: SpringButton!
    @IBOutlet weak var commentButton: SpringButton!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func upvoteButtonTouch (sender: UIButton) {
        upvoteButton.animation = "pop"
        upvoteButton.force = 3
        upvoteButton.animate()
        
        delegate?.storyTableViewCellDidTouchUpvote(self, sender: sender)
    }
    
    @IBAction func commentButtonTouch (sender: UIButton) {
        commentButton.animation = "pop"
        commentButton.force = 3
        commentButton.animate()
        
        delegate?.storyTableViewCellDidTouchComment(self, sender: sender)
    }
    
    func configureWithStory(story: AnyObject) {
        
        let title = story["title"] as! String
        let badge = story["badge"] as! String
        let userPortraitUrl = story["user_portrait_url"] as! String
        let userDisplayName = story["user_display_name"] as! String
        let userJob = story["user_job"] as! String
        let createdAt = story["created_at"] as! String
        let voteCount = story["vote_count"] as! Int
        let commentCount = story["comment_count"] as! Int
        let comment = story["comment"] as! String
        
        titleLabel.text = title
        badgeImage.image = UIImage(named: "badge-" + badge)
        avatarImage.image = UIImage(named: "content-avatar-default")
        authorLabel.text = userDisplayName + ", " + userJob
        timeLabel.text = timeAgoSinceDate(dateFromString(createdAt, format: "yyyy-MM-dd'T'HH:mm:ssZ"), numericDates: true)
        upvoteButton.setTitle("\(voteCount)", forState: .Normal)
        commentButton.setTitle("\(commentCount)", forState: .Normal)
        
        if let commentTextView = commentTextView {
            commentTextView.text = comment
        }
    }

}
