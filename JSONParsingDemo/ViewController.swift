//
//  ViewController.swift
//  JSONParsingDemo
//
//  Created by user on 27/11/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var avatarImg: UIImageView!
    @IBOutlet weak var labelView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func fetchDataTapped(_ sender: UIButton) {
        fetchData()
    }
    
    private func fetchData(){
        let urlString = "https://reqres.in/api/users?page=1"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
    
            // Decode resutl in object models
            do {
                let decoder = JSONDecoder()
                let result =  try decoder.decode(ResponseResult.self, from: data!)
                let userIndex = 0
                
                DispatchQueue.global().async { [weak self] in
                    if let data = try? Data(contentsOf: URL(string: result.data[userIndex].avatar)!){
                        if let image = UIImage(data: data){
                            DispatchQueue.main.async {
                                self?.labelView.text = result.data[userIndex].email
                                self?.avatarImg.image = image
                            }
                        }
                    }
                }
                
                
            } catch{
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
}

