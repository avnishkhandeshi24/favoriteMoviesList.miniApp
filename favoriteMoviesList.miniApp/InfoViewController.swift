//
//  InfoViewController.swift
//  favoriteMoviesList.miniApp
//
//  Created by Avnish Khandeshi on 11/5/21.
//

import UIKit

class InfoViewController: UIViewController {
    
    
    @IBOutlet weak var infoTextView: UITextView!
    
    var info : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        infoTextView.text = info
        infoTextView.font = UIFont(name: "Callout", size: 20)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        infoTextView.text = info
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
