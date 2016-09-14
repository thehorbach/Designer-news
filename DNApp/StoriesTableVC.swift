//
//  StoriesTableVC.swift
//  DNApp
//
//  Created by Vyacheslav Horbach on 28/08/16.
//  Copyright © 2016 Vyacheslav Horbach. All rights reserved.
//

import UIKit

class StoriesTableVC: UITableViewController, StoryTableViewCellDelegate {
    
    let transitionManager = TransitionManager()
    
    override func viewDidLoad() {
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension 
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("WebSegue", sender: indexPath)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("StoryCell") as! StoryTableViewCell
        
        let story = data[indexPath.row]
        cell.configureWithStory(story)
        
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    @IBAction func loginButtonPressed (sender: AnyObject) {
        performSegueWithIdentifier("LoginSegue", sender: self)
    }
    
    
    @IBAction func menuButtonPressed (sender: AnyObject) {
        performSegueWithIdentifier("MenuSegue", sender: self)
    }
    
    // MARK: StoryTableViewCellDelegate
    
    func storyTableViewCellDidTouchUpvote(cell: StoryTableViewCell, sender: AnyObject) {
        //To-do: Implement Upvote
    }
    
    func storyTableViewCellDidTouchComment(cell: StoryTableViewCell, sender: AnyObject) {
        performSegueWithIdentifier("CommentsSegue", sender: cell )
    }
    
    // MARK: Misc
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "CommentsSegue" {
            let toView = segue.destinationViewController as! CommentsTableVC
            let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
            toView.story = data[indexPath.row]
        }
        
        if segue.identifier == "WebSegue" {
            let toView = segue.destinationViewController as! WebVC
            let indexPath = sender as! NSIndexPath
            let url = data[indexPath.row]["url"].string
            toView.url = url
            
            UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: .Fade)
            
            toView.transitioningDelegate = transitionManager
        }
    }
    
}
