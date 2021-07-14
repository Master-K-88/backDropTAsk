//
//  ViewController.swift
//  practicingBackDrop
//
//  Created by Decagon on 10/07/2021.
//

import UIKit

final class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CatTableViewCellDelegate {
    
    @IBOutlet weak var catTableView: UITableView!
    private let viewModel = CatViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.catTableData()
        completionListeeners()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        completionListeeners()  
    }
    // Do any additional setup after loading the view.
    
    fileprivate func completionListeeners() {
        viewModel.catDataCompletion = { [self] in
            DispatchQueue.main.async { [self] in
                catTableView.reloadData()
            }
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = catTableView.dequeueReusableCell(withIdentifier: "CatTableViewCell", for: indexPath) as! CatTableViewCell
        
        cell.populateCell(isLiked: !viewModel.dummyData[indexPath.row].isLiked)
        cell.catPopulate(with: viewModel.dummyData[indexPath.row])
        cell.delegate = self
        cell.likeButton?.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        catTableView.deselectRow(at: indexPath, animated: false)
    }
    
    func likeBtnTapped(tag index: Int) {
        viewModel.updateCell(at: index)
        DispatchQueue.main.async { [self] in
            catTableView.reloadData()
            print(index)
        }
    }
    
}
