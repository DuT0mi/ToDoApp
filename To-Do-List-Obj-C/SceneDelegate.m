#import "SceneDelegate.h"
#import "ItemsViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Configure our app to be embedded in a navigation controller
    // 1. setup window
        // CGRect because of initWithFrame <- the window will have bounds
    CGRect bounds = [UIScreen mainScreen].bounds;
    
    _window = [[UIWindow alloc]initWithFrame:bounds];
    _window.windowScene = (UIWindowScene *)scene;
    
    // 2. Get an instance of the "Main" storyboard
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    // 3. Get an instance of the "ItemsViewController" from storyboard
    ItemsViewController * itemsVC = [storyboard instantiateViewControllerWithIdentifier:@"ItemsViewController"];
    
    // 4. Declare a nav controller
    UINavigationController * navController = [[UINavigationController alloc]initWithRootViewController:itemsVC];
    // 5. Set the window's root view controller
    [_window setRootViewController:navController];
    [_window makeKeyAndVisible];
    
    
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
  
}


- (void)sceneWillResignActive:(UIScene *)scene {

}


- (void)sceneWillEnterForeground:(UIScene *)scene {
   
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
   
}


@end
