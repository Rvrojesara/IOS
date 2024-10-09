//
//  DetailVC.swift
//  jokeapp2
//
//  Created by admin on 01/10/24.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var setupLbl: UILabel!
    @IBOutlet weak var punchLinLbl: UILabel!
    
    var currentJoke: JokeModel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        // Do any additional setup after loading the view.
    }
    
    func setData() {
        setupLbl.text =  currentJoke.setup
        punchLinLbl.text =  currentJoke.punchline
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
