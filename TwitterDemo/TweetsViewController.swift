//
//  TweetsViewController.swift
//  TwitterDemo
//
//  Created by Kevin Alfonso on 2/26/17.
//  Copyright © 2017 Kevin Alfonso. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController//, UITableViewDataSource, UITableViewDelegate,
{


    @IBOutlet weak var tableView: UITableView!
    
    
    var tweets: [Tweet]!
    override func viewDidLoad() {
        super.viewDidLoad()

        TwitterClient.sharedInstance.homeTimeline(success: { (tweets: [Tweet]) in
            self.tweets = tweets
            for tweet in tweets {
                print(tweet.text!)
            }
        }) { (error) in
            print(error.localizedDescription)
        }
        
//        tableView.dataSource = self
//        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogoutButton(_ sender: UIBarButtonItem) {
        TwitterClient.sharedInstance.logout()
    }
    
//    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return tweets.count
//        
//    }
//    
//    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell") as! TweetCell
//        cell.tweet = tweets[indexPath.row]
//        
//        return cell
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
