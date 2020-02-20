//
//  SessionsCollectionViewController.swift
//  Study Buddy
//
//  Created by Ammad on 20/02/2020.
//  Copyright © 2020 Scrubs. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Session Cell"

class SessionsViewController: UICollectionViewController {
    var sessions: [Session] = [Session(emoji: "🐶", subject: "Dog"),
    Session(emoji: "🐱", subject: "Cat"),
    Session(emoji: "🐭", subject: "Mouse"),
    Session(emoji: "🐹", subject: "Hamster"),
    Session(emoji: "🐰", subject: "Rabbit"),
    Session(emoji: "🦊", subject: "Fox"),
    Session(emoji: "🐻", subject: "Bear"),
    Session(emoji: "🐼", subject: "Panda")]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        navigationItem.searchController = UISearchController()
        navigationItem.searchController?.searchBar.placeholder = "Search for sessions!"
        sessions.shuffle()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "Join A Session", let index = collectionView.indexPathsForSelectedItems?.first {
            let navigationController = segue.destination as! UINavigationController
            let topViewController = navigationController.topViewController as! JoinSessionViewController
            topViewController.session = sessions[index.row]
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if section == 0 {
            return 1
        } else {
            return sessions.count
        }
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SessionCollectionViewCell

        // Configure the cell
        if indexPath.section == 0 {
            cell.layer.backgroundColor = #colorLiteral(red: 0.9879950881, green: 0.6832683086, blue: 0.5366683006, alpha: 1)
        } else {
            cell.layer.backgroundColor = #colorLiteral(red: 0.4421711564, green: 0.7092648149, blue: 0.6706987023, alpha: 1)
        }
        
        cell.layer.cornerRadius = 10
        cell.emojiLabel.text = sessions[indexPath.item].emoji
        cell.subjectLabel.text = sessions[indexPath.item].subject
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

extension SessionsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width - 40
        let height = CGFloat(75)

        return CGSize(width: width, height: height)
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 50
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 50
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 200
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 200
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
    }
}
