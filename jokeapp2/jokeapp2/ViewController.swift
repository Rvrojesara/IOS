//
//  ViewController.swift
//  jokeapp2
//
//  Created by admin on 09/09/24.
//

import UIKit

class ViewController: UIViewController {
     var jokeArr: [JokeModel] = []
    
    var sectionTitleArr = ["one","two"]
    
    @IBOutlet weak var Tableview: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var selectedJoke: JokeModel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        callJokeApi()
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setuptable()
        saveToUsrDefalut(usrName: "riya")
        printUsrDefalut()
        

        
//        let api=ApiManager()
//        api.fetchJokes()
        
//       ApiManager.fetchJokes()

       
       
    }
    
    func callJokeApi(){
        
        loadingIndicator.startAnimating()
        ApiManager().fetchJokes{ result in
            switch result {
                
            case.success(let data):
                self.jokeArr.append(contentsOf: data)
                print(self.jokeArr)
                self.Tableview.reloadData()
                self.loadingIndicator.stopAnimating()
                self.loadingIndicator.isHidden = true
                
            case.failure(let failure):
                debugPrint("something went wrong in calling API")
                self.loadingIndicator.stopAnimating()
                self.loadingIndicator.isHidden = true
            }
        }
    }
}
    
    extension ViewController:UITableViewDelegate, UITableViewDataSource {
        
        
        func setuptable()
        {
            Tableview.register(UINib(nibName: "JokeCell", bundle: nil),forCellReuseIdentifier: "Jokecell")
            Tableview.delegate=self
            Tableview.dataSource=self
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return jokeArr.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell=tableView.dequeueReusableCell(withIdentifier: "Jokecell", for: indexPath) as! JokeCell
           
//            cell.idlable.text="\(indexPath.row)"
            cell.idlable.text = jokeArr[indexPath.row].type
            cell.setuplable.text = jokeArr[indexPath.row].setup
            cell.puchlinelable.text=jokeArr[indexPath.row].punchline
            return cell
            
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 120
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 2
        }
        
        
        
        
        //swipe delete
        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let delete = UIContextualAction(style: .destructive, title:"delete"){ action, source, completion in
                self.jokeArr.remove(at: indexPath.row)
                self.Tableview.reloadData()
                
            }
            let swipeconfigure = UISwipeActionsConfiguration(actions: [delete])
            swipeconfigure.performsFirstActionWithFullSwipe = false
            return swipeconfigure
            
        }
        
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            selectedJoke = jokeArr[indexPath.row]
            performSegue(withIdentifier: "GoToDetail", sender: self)
        }
        //
        
        func saveToUsrDefalut(usrName :String){
            UserDefaults.standard.set(usrName,forKey: "Usr")
        }
        
        func printUsrDefalut(){
            var name = UserDefaults.standard.value(forKey: "Usr")
            print("Hello \(name)")
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "GoToDetail" {
                if let detail = segue.destination as? DetailVC {
                    detail.currentJoke = selectedJoke
                }
            }
        }
//        func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//        }
//        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//            print(section)
//            return sectionTitleArr[section]
//        }
        
    }
    
    




