public protocol MainScreenViewModelProtocol: class {
    func presentCountryCodeScene()
    func presentConfirmNumberScene(with phone: String)
    func postUserData(_ userData: PostingUserData)
}
