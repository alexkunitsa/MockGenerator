//
//  TestVC.swift
//  MockGeneratorSample
//
//  Created by Alex Kunitsa on 10/1/15.
//  Copyright © 2015 Alex Kunitsa. All rights reserved.
//

import UIKit

class TestVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let kCellReuseIdentifier = "randomCell"
    
    let testVM = TestVM()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        testVM.delegate = self
        automaticallyAdjustsScrollViewInsets = false
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        testVM.generateUsersList()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - User actions

    @IBAction func randomAction(sender: UIBarButtonItem) {
        testVM.generateUsersList()
    }
}

// MARK: - UITableViewDataSource

extension TestVC: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testVM.users.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kCellReuseIdentifier) ?? UITableViewCell(style: .Subtitle, reuseIdentifier: kCellReuseIdentifier)
        
        let user = testVM.users[indexPath.row]
        
        cell.detailTextLabel?.text = user.email
        cell.textLabel?.text = user.name
        
        return cell
    }
}

// MARK: - TestVMDelegate

extension TestVC: TestVMDelegate {

    func dataUpdated() {
        tableView.reloadData()
    }
}
