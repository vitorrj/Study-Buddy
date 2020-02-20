//
//  JoinSessionViewController.swift
//  Study Buddy
//
//  Created by Ammad on 20/02/2020.
//  Copyright © 2020 Scrubs. All rights reserved.
//

import UIKit

class JoinSessionViewController: UIViewController {
    var session: Session?
    
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emojiLabel.text = session?.emoji
        subjectLabel.text = session?.subject
    }
    @IBAction func cancelJoinSessionButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
