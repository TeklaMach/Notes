//
//  NoteListViewController.swift
//  Notes
//
//  Created by Tekla Matcharashvili on 05.11.23.
//

import UIKit

class NoteListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let tableView = UITableView()
    var notes: [String] = ["Note 1", "Note 2", "Note 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notes"
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let noteDetailsVC = NoteDetailsViewController()
        noteDetailsVC.note = notes[indexPath.row]
        navigationController?.pushViewController(noteDetailsVC, animated: true)
    }
}
