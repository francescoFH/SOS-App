//
//  TypesTableViewController.swift
//  SOS-App
//
//  Created by Francesco Facca on 21/01/2021.
//

import UIKit

protocol TypesTableViewControllerDelegate: class {
  func typesController(_ controller: TypesTableViewController, didSelectTypes types: [String])
}

class TypesTableViewController: UITableViewController {
    private let possibleTypesDictionary = ["hospital": "Hospital", "pharmacy": "Pharmacy", "police": "Police"]
  
  private var sortedKeys: [String] {
    return possibleTypesDictionary.keys.sorted()
  }
  
  weak var delegate: TypesTableViewControllerDelegate?
  var selectedTypes: [String] = []
}

// MARK - Actions
extension TypesTableViewController {
  @IBAction func donePressed(_ sender: AnyObject) {
    delegate?.typesController(self, didSelectTypes: selectedTypes)
  }
}

// MARK - UITableView Delegate & Datasource
extension TypesTableViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return possibleTypesDictionary.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TypeCell", for: indexPath)
    let key = sortedKeys[indexPath.row]
    let type = possibleTypesDictionary[key]
    cell.textLabel?.text = type
    cell.imageView?.image = UIImage(named: key)
    cell.accessoryType = selectedTypes.contains(key) ? .checkmark : .none
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let key = sortedKeys[indexPath.row]
    if selectedTypes.contains(key) {
      selectedTypes = selectedTypes.filter({$0 != key})
    } else {
      selectedTypes.append(key)
    }
    
    tableView.reloadData()
  }
}
