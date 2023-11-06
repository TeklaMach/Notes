//
//  NoteDetailsViewController.swift
//  Notes
//
//  Created by Tekla Matcharashvili on 05.11.23.
//

import UIKit

class NoteDetailsViewController: UIViewController {
    var note: String = ""
    
    private let noteTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Note Details"
        setupViews()
        setupSaveButton()
        displayNote()
    }
    
    func setupViews() {
        view.addSubview(noteTextView)
        
        NSLayoutConstraint.activate([
            noteTextView.topAnchor.constraint(equalTo: view.topAnchor),
            noteTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            noteTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            noteTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func setupSaveButton() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNote))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    func displayNote() {
        noteTextView.text = note
    }
    
    @objc func saveNote() {
        guard noteTextView.text != nil else {
            return
        }
        
        navigationController?.popViewController(animated: true)
    }
}

