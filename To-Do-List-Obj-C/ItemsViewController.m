#import "ItemsViewController.h"
#import "Item.h"
// conform to UITableViewDataSource
@interface ItemsViewController ()<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray * items;
@end

@implementation ItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureNavBar];
    // table view's data
    self.items = [[NSMutableArray alloc]initWithArray:[Item fetchItems]];
    
    self.tableView.dataSource = self;
}
- (void)configureNavBar{
    // 1. Create an image for the bar button item
        // from sf symbols go for one and write the name here
        UIImage * image = [UIImage systemImageNamed:@"plus"];
    // 2. Create bar button item
    UIBarButtonItem * plusButton = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(addItem)];
    // 3. Set the "plusButton" as the right bar button
    self.navigationItem.rightBarButtonItem = plusButton;
    self.navigationItem.title = @"To do list";
    
}
- (void)addItem{
    // 1. Initialize an aler controller
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"Add a new to do list item" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    // 2. Add two tect fields
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
       // code here
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        // code here
    }];
    // 3. Add placeholder text to the text fields
    alertController.textFields[0].placeholder = @"Enter the name of the item";
    alertController.textFields[1].placeholder = @"Enter the topic ";
    
    // 4. Define action items: Cancel and Save
    // Cancel
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        // TODO code
    }];
    // Save
    UIAlertAction * saveAction = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // Handler code here
        // 1. Insert the new item
        NSString * name = alertController.textFields[0].text;
        NSString * topic = alertController.textFields[1].text;
        Item * newItem = [[Item alloc]iniWithName:name andTopic:topic];
        
        [self.items addObject:newItem];
        // 2. Create an indexPath a the end of item array
        NSIndexPath * newIndexPath = [NSIndexPath indexPathForRow:self.items.count - 1  inSection:0];
        // we have one section so the index is zero
        
        // 3. Insert indexPath into table view
        [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
    // Add actions to them
    [alertController addAction:cancelAction];
    [alertController addAction:saveAction];
    
    //
    [self presentViewController:alertController animated:true completion:nil];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell" forIndexPath:indexPath];
    Item * item = self.items[indexPath.row];
        cell.textLabel.text = item.name;
        cell.detailTextLabel.text = item.topic;
    
    return cell;
}
@end
