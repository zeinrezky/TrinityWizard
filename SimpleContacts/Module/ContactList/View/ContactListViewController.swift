//
//  ContactListViewController.swift
//  SimpleContact
//
//  Created by Zein Rezky Chandra on 18/05/23.
//

import UIKit

class ContactListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var refreshControl = UIRefreshControl()
    
    var presenter: ContactListPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Contacts"
        
        setupCollectionView()
        setNavigationBarItem()
    }

    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "ContactCellCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ContactCellCollectionViewCell")
        
        // Configure the refreshControl
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        collectionView.refreshControl = refreshControl
    }
    
    private func setNavigationBarItem() {
        let searchIcon = UIImage(systemName: "magnifyingglass")!
        let searchButton = UIBarButtonItem(image: searchIcon, style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = searchButton
        
        let plusIcon = UIImage(systemName: "plus")!
        let plusButton = UIBarButtonItem(image: plusIcon, style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = plusButton
    }
    
    @objc func handleRefresh() {
        presenter?.pullToRefresh()
        refreshControl.endRefreshing()
    }
}

extension ContactListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getListContact().count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContactCellCollectionViewCell", for: indexPath) as? ContactCellCollectionViewCell, let contact = presenter?.getListContact()[indexPath.row] else { return UICollectionViewCell() }
        
        cell.name = "\(contact.firstName) \(contact.lastName)"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width - 8
        let itemWidth = (collectionViewWidth - 10) / 2
        let itemHeight = itemWidth
        return CGSize(width: itemWidth, height: itemHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let contact = presenter?.getListContact()[indexPath.row] else { return }
        presenter?.navigateToDetail(contact: contact)
    }
}

extension ContactListViewController: ContactListViewProtocol {
    func refreshCollection() {
        collectionView.reloadData()
    }
}
