
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.makeKeyAndVisible()
        let tabBarController = UITabBarController()
        let loginVC = LoginViewController()
        loginVC.tabBarItem = UITabBarItem(title: "Profile", image: .init(imageLiteralResourceName: "profile") , tag: 0)
        loginVC.view.backgroundColor = .white
        let profileVC = ProfileViewController()
        profileVC.view.backgroundColor = .lightGray
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: .init(imageLiteralResourceName: "profile") , tag: 0)
        let feedVC = FeedViewController()
        feedVC.view.backgroundColor = .blue
        feedVC.tabBarItem = UITabBarItem(title: "Feed", image: .init(imageLiteralResourceName: "connect") , tag: 1)
        let feedNavVC = UINavigationController(rootViewController: feedVC)
        let profileNavVC = UINavigationController(rootViewController: profileVC)
        profileNavVC.navigationBar.isHidden = true

        tabBarController.viewControllers = [feedNavVC , profileNavVC]
        window?.rootViewController = tabBarController
    }
}

