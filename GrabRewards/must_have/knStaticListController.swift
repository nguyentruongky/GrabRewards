//
//  ListView.swift
//  Ogenii
//
//  Created by Ky Nguyen Coinhako on 7/20/18.
//  Copyright © 2018 Ogenii. All rights reserved.
//

import UIKit

class knStaticListController: knController, UITableViewDelegate, UITableViewDataSource {
    var datasource = [UITableViewCell]() { didSet { tableView.reloadData() }}
    var rowHeight = UITableView.automaticDimension
    var contentInset: UIEdgeInsets?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    
    func fillList(space: UIEdgeInsets = .zero) {
        view.addSubviews(views: tableView)
        tableView.fill(toView: view, space: space)
    }
    
    override func setupView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        if let inset = contentInset {
            tableView.contentInset = inset
        }
    }
    
    lazy var tableView: UITableView = { [weak self] in
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.separatorStyle = .none
        tb.showsVerticalScrollIndicator = false
        tb.dataSource = self
        tb.delegate = self
        return tb
        }()
    
    deinit {
        print("Deinit \(NSStringFromClass(type(of: self)))")
    }
    func wrapToCell(view: UIView) -> knTableCell {
        let cell = knTableCell()
        cell.addSubview(view)
        view.fill(toView: cell)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return datasource[indexPath.row] }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRow(at: indexPath)
    }
    func didSelectRow(at indexPath: IndexPath) { }
}
