//  
//  HomeViewController.swift
//  Subscriptions
//
//  Created by Parth Patel on 24/06/21.
//  Copyright © 2021 Parth Patel. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    let modelObjects = [
        
        HeaderItem(title: "Communication", image: UIImage(systemName: "mic")!, symbols: [
            SFSymbolItem(name: "mic"),
            SFSymbolItem(name: "mic.fill"),
            SFSymbolItem(name: "message"),
            SFSymbolItem(name: "message.fill"),
        ]),
        
        HeaderItem(title: "Weather", image: UIImage(systemName: "mic")!, symbols: [
            SFSymbolItem(name: "sun.min"),
            SFSymbolItem(name: "sun.min.fill"),
            SFSymbolItem(name: "sunset"),
            SFSymbolItem(name: "sunset.fill"),
        ]),
        
        HeaderItem(title: "Objects & Tools", image: UIImage(systemName: "mic")!, symbols: [
            SFSymbolItem(name: "pencil"),
            SFSymbolItem(name: "pencil.circle"),
            SFSymbolItem(name: "highlighter"),
            SFSymbolItem(name: "pencil.and.outline"),
        ]),
        
    ]
    
    
    // OUTLETS HERE

    @IBOutlet weak var moreButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    @IBOutlet weak var segment: UISegmentedControl!
    // VARIABLES HERE
    var viewModel = HomeViewControllerViewModel()
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, ListItem>!
    var headerCellRegistration: UICollectionView.CellRegistration<UICollectionViewListCell, HeaderItem>!
    var symbolCellRegistration: UICollectionView.CellRegistration<UICollectionViewListCell, SFSymbolItem>!
    
    // MARK: - View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
        self.configureUI()
        self.configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Configure UI
    
    private func configureUI() {
        self.title = Localize(.subscriptionText)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension HomeViewController {
    // MARK: - Configure CollectionView
    
    private func configureCollectionView() {
        //set layout to collection view
        let layoutConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let listLayout = UICollectionViewCompositionalLayout.list(using: layoutConfig)
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: listLayout)
        view.addSubview(collectionView)
        
        // Make collection view take up the entire view
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0.0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0),
        ])
        
        configureHeaderCell()
        configureSymbolCell()
        configureDataSource()
    }

    private func configureHeaderCell() {
        headerCellRegistration = UICollectionView.CellRegistration {
            (cell, indexPath, headerItem) in
            
            //set header item's data to cell
            var content = cell.defaultContentConfiguration()
            
            content.text = headerItem.title
            content.secondaryText = "LLL"
            content.image = headerItem.image
            cell.contentConfiguration = content
            
            // Add outline disclosure accessory
            // With this accessory, the header cell's children will expand / collapse when the header cell is tapped.

            let headerDisclosureOption = UICellAccessory.OutlineDisclosureOptions(style: .header)
            
            
            let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
            titleLabel.text = "Hi\n9089"
            titleLabel.textColor = .gray
            titleLabel.numberOfLines = 0
//            titleLabel.textAlignment = .right
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
            view.backgroundColor = .red
            view.addSubview(titleLabel)
            
            let customView = UICellAccessory.customView(configuration: UICellAccessory.CustomViewConfiguration(customView: view, placement: .trailing()))
            
            let label = UICellAccessory.label(text: "Hi\n980", displayed: .always, options: UICellAccessory.LabelOptions(tintColor: .red, font: .subtitle))
            
            
            cell.accessories = [.outlineDisclosure(options:headerDisclosureOption), label]

            
        }
    }
    
    private func configureSymbolCell() {
        symbolCellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, SFSymbolItem> {
            (cell, indexPath, symbolItem) in
            
            // Set symbolItem's data to cell
            var content = cell.defaultContentConfiguration()
            content.image = symbolItem.image
            content.text = symbolItem.name
            cell.contentConfiguration = content
        }

    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) { [weak self]
            (collectionView, indexPath, listItem) -> UICollectionViewCell? in
            guard let self = self else { return nil }
            
            switch listItem {
            case .header(let headerItem):
                //Dequeue header cell
                let cell = collectionView.dequeueConfiguredReusableCell(using: self.headerCellRegistration, for: indexPath, item: headerItem)
                return cell
            case .symbol(let symbolItem):
                //Dequeue symbol cell
                let cell = collectionView.dequeueConfiguredReusableCell(using: self.symbolCellRegistration, for: indexPath, item: symbolItem)
                return cell
            }
        }
        
        // MARK: Setup snapshots
        var dataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, ListItem>()

        // Create a section in the data source snapshot
        dataSourceSnapshot.appendSections([.main])
        dataSource.apply(dataSourceSnapshot)

        
        // Create a section snapshot for main section
        var sectionSnapshot = NSDiffableDataSourceSectionSnapshot<ListItem>()

        for headerItem in modelObjects {
           
            // Create a header ListItem & append as parent
            let headerListItem = ListItem.header(headerItem)
            sectionSnapshot.append([headerListItem])
            
            // Create an array of symbol ListItem & append as children of headerListItem
            let symbolListItemArray = headerItem.symbols.map { ListItem.symbol($0) }
            sectionSnapshot.append(symbolListItemArray, to: headerListItem)
            
            // Expand this section by default
            sectionSnapshot.expand([headerListItem])
        }

        // Apply section snapshot to main section
        dataSource.apply(sectionSnapshot, to: .main, animatingDifferences: false)

    }
    
}

extension HomeViewController {
    // MARK: - UIAction Methods
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
    }
}

extension HomeViewController {
    
    // MARK: - Setup View Model
    fileprivate func setupViewModel() {

        self.viewModel.showAlertClosure = {
            let alert = self.viewModel.alertMessage ?? ""
            print(alert)
        }
        
        self.viewModel.updateLoadingStatus = {
            if self.viewModel.isLoading {
                print("LOADING...")
            } else {
                 print("DATA READY")
            }
        }

        self.viewModel.internetConnectionStatus = {
            print("Internet disconnected")
            // show UI Internet is disconnected
        }

        self.viewModel.serverErrorStatus = {
            print("Server Error / Unknown Error")
            // show UI Server is Error
        }

        self.viewModel.didGetData = {
            // update UI after get data
        }

    }
}


