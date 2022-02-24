//
//  AccountSummaryViewController.swift
//  Bankey
//
//  Created by Marcos Avila Rodriguez on 16/02/22.
//

import UIKit

class AccountSummaryViewController: UIViewController {
    
    //    Request Models
    var profile: Profile?
    var accounts: [Account] = []
    
    //    View Model
    var headerViewModel = AccountSummaryHeaderView.ViewModel(welcomeMessage: "Welcome", name: "", date: Date())
    var accountCellViewModels: [AccountSummaryCell.ViewModel] = []
    
    //  Components
    var tableView = UITableView()
    var headerView = AccountSummaryHeaderView(frame: .zero)
    let refreshControl = UIRefreshControl()
    
    //    Networking
    var profileManager: ProfileManageable = ProfileManager()
    
    lazy var errorAlert: UIAlertController = {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
    }()
    
    var isLoaded = false
    
    lazy var logoutBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
        barButtonItem.tintColor = .label
        return barButtonItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

}

extension AccountSummaryViewController {
    private func setup() {
        setupNavigationBar()
        setupTableView()
        setupTableHeaderView()
        setupSkeletons()
        setupRefreshControl()
        fetchData()
    }
    
    private func setupTableView() {
        
        tableView.backgroundColor = appColor
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(AccountSummaryCell.self, forCellReuseIdentifier: AccountSummaryCell.reuseID)
//        Register Skeleton Cell
        tableView.register(SkeletonCell.self, forCellReuseIdentifier: SkeletonCell.reuseID)
        
        tableView.rowHeight = AccountSummaryCell.rowHeight
        tableView.tableFooterView = UIView() // Blank footer
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupTableHeaderView() {
        
        var size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        headerView.frame.size = size
        
        tableView.tableHeaderView = headerView
        
    }
    
    func setupNavigationBar(){
        navigationItem.rightBarButtonItem = logoutBarButtonItem
    }
    
    func setupRefreshControl(){
        refreshControl.tintColor = .systemYellow
        refreshControl.addTarget(self, action: #selector(refreshContent), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    func setupSkeletons() {
        let row = Account.makeSkeleton()
        accounts = Array(repeating: row, count: 10)
        
        configureTableCells(with: accounts)
    }
}

extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard !accountCellViewModels.isEmpty else { return UITableViewCell()}
        let account = accountCellViewModels[indexPath.row]
        
        if isLoaded {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseID, for: indexPath) as! AccountSummaryCell
            cell.configure(with: account)
            return cell
            
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SkeletonCell.reuseID, for: indexPath) as! SkeletonCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountCellViewModels.count
    }
}

extension AccountSummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

//extension AccountSummaryViewController {
//
//    private func fetchData(){
//        fetchAccounts()
//    }
//
//    private func fetchAccounts() {
//
//        let savings = AccountSummaryCell.ViewModel(accountType: .Banking, accountName: "Basic Savings", balance: 929466.23)
//        let chequing = AccountSummaryCell.ViewModel(accountType: .Banking, accountName: "No-Fee All-In Chequing", balance: 17562.44)
//        let visa = AccountSummaryCell.ViewModel(accountType: .CreditCard, accountName: "Visa Avion Card", balance: 412.83)
//        let masterCard = AccountSummaryCell.ViewModel(accountType: .CreditCard, accountName: "Student MasterCard", balance: 50.83)
//        let investment1 = AccountSummaryCell.ViewModel(accountType: .Investment, accountName: "Tax-Free Saver", balance: 2000)
//        let investment2 = AccountSummaryCell.ViewModel(accountType: .Investment, accountName: "Growth Fund", balance: 15000.00)
//
//        accountCellViewModels.append(savings)
//        accountCellViewModels.append(chequing)
//        accountCellViewModels.append(visa)
//        accountCellViewModels.append(masterCard)
//        accountCellViewModels.append(investment1)
//        accountCellViewModels.append(investment2)
//
//    }
//}

// MARK: - Networking
extension AccountSummaryViewController {
    private func fetchData() {
        let group = DispatchGroup()
        
        // Testing - random number selection
        let userId = String(Int.random(in: 1..<4))
        
        fetchProfile(group: group, userId: userId)
        fetchAccounts(group: group, userId: userId)
        
        group.notify(queue: .main) {
            self.reloadView()
        }
    }
    
    private func fetchProfile(group: DispatchGroup, userId: String) {
    group.enter()
    profileManager.fetchProfile(forUserId: userId) { result in
        switch result {
        case .success(let profile):
            self.profile = profile
        case .failure(let error):
            self.handleError(error:error)
        }
        group.leave()
    }
}
    
private func fetchAccounts(group: DispatchGroup, userId: String) {
    group.enter()
    fetchAccounts(forUserId: userId) { result in
        switch result {
        case .success(let accounts):
            self.accounts = accounts
        case .failure(let error):
            self.handleError(error:error)
        }
        group.leave()
    }
}
    
private func reloadView() {
    self.tableView.refreshControl?.endRefreshing()
    
    guard let profile = self.profile else { return }
    
    self.isLoaded = true
    self.configureTableHeaderView(with: profile)
    self.configureTableCells(with: self.accounts)
    self.tableView.reloadData()
}
    
    private func configureTableHeaderView(with profile: Profile) {
        let vm = AccountSummaryHeaderView.ViewModel(welcomeMessage: "Good morning,",
                                                    name: profile.firstName,
                                                    date: Date())
        headerView.configure(viewModel: vm)
    }
    
    private func configureTableCells(with: [Account]){
        accountCellViewModels = accounts.map {
            AccountSummaryCell.ViewModel(accountType: $0.type, accountName: $0.name, balance: $0.amount)
        }
    }
    
    private func showErrorAlert(title: String, message: String) {
        
//        let alert = UIAlertController(title: "Network Error", message: "Please check your network connectivity and try again.", preferredStyle: .alert)
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        errorAlert.title = title
        errorAlert.message = message
        present(errorAlert, animated: true, completion: nil)
        
    }
    
    private func handleError(error: NetworkError){
        let titleAndMessage = titleAndMessage(for: error)
        self.showErrorAlert(title: titleAndMessage.0, message: titleAndMessage.1)
    }
    
    private func titleAndMessage(for error: NetworkError) -> (String, String) {
        let title: String
        let message: String
        switch error {
        case .serverError:
            title = "Network Error"
            message = "Ensure you are connected to the internet. Please try again."
        case .decodingError:
            title = "Server Error"
            message = "We could not process your request. Please try again."
        }
        
        return (title,message)
    }
}

// MARK: - Actions
extension AccountSummaryViewController {
    @objc func logoutTapped(sender: UIButton) {
        NotificationCenter.default.post(name: .logout, object: nil)
    }
    
    @objc func refreshContent(){
        reset()
        setupSkeletons()
        tableView.reloadData()
        fetchData()
    }
    
    private func reset() {
        profile = nil
        accounts = []
        isLoaded = false
    }
}

//MARK: - Unit testing
extension AccountSummaryViewController {
    func titleAndMessageForTesting(for error: NetworkError) -> (String, String) {
        return titleAndMessage(for: error)
    }
    
    func forceFetchProfile() {
        fetchProfile(group: DispatchGroup(), userId: "1")
    }
}
