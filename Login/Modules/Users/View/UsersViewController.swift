//
//  UsersViewController.swift
//  Login
//
//  Created by David Acevedo on 17/03/24.
//

import UIKit

class UsersViewController: UIViewController {
    
    let users: [UserModel] = [
        
        UserModel(name: "Emily Johnson", email: "emily@example.com"),
        UserModel(name: "Michael Brown", email: "michael@example.com"),
        UserModel(name: "Emma Wilson", email: "emma@example.com"),
        UserModel(name: "Matthew Martinez", email: "matthew@example.com"),
        UserModel(name: "Olivia Anderson", email: "olivia@example.com"),
        UserModel(name: "Daniel Taylor", email: "daniel@example.com"),
        UserModel(name: "Ava Thomas", email: "ava@example.com"),
        UserModel(name: "William Clark", email: "william@example.com"),
        UserModel(name: "Sophia Lewis", email: "sophia@example.com"),
        UserModel(name: "Alexander Walker", email: "alexander@example.com"),
        UserModel(name: "Madison Hall", email: "madison@example.com"),
        UserModel(name: "James White", email: "james@example.com"),
        UserModel(name: "Charlotte Harris", email: "charlotte@example.com"),
        UserModel(name: "Benjamin King", email: "benjamin@example.com"),
        UserModel(name: "Amelia Green", email: "amelia@example.com"),
        UserModel(name: "Mason Baker", email: "mason@example.com"),
        UserModel(name: "Harper Evans", email: "harper@example.com"),
        UserModel(name: "Ethan Adams", email: "ethan@example.com"),
        UserModel(name: "Abigail Turner", email: "abigail@example.com"),
        UserModel(name: "Elijah Hill", email: "elijah@example.com")
    ]
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}


extension UsersViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        return cell
    }
    
    
}


extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Aquí se ejecuta el código cuando el usuario selecciona una celda
        let user = users[indexPath.row]
        print(user.name)
    }
}

