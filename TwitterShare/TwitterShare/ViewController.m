//
//  ViewController.m
//  TwitterShare
//
//  Created by Sheeraz on 8/17/24.
//

#import "ViewController.h"
#import "Social/Social.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;

- (void)configureTweetTextView;

- (void) showAlertMessage:(NSString *) myMessage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureTweetTextView];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.

}

- (IBAction)showShareAction:(id)sender {
 
    if ([self.tweetTextView isFirstResponder]) {
        [self.tweetTextView resignFirstResponder];
    
//        if ([SLComposeViewController isAvailableForServiceType: SLServiceTypeFacebook]) {
//            
//            // [self showAlertMessage:@"Facebook is available"];
//            
//            SLComposeViewController *facebookSLComposeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
//            
//            [facebookSLComposeViewController setInitialText: self.tweetTextView.text];
//            [self presentViewController:facebookSLComposeViewController animated:YES completion:nil];
//            
//            
//        } else {
//            
//            [self showAlertMessage:@"Please sign in to Facebook"];
//        }

        
  
//        UIActivityViewController *moreUIActivityViewController =
//        [[UIActivityViewController alloc] initWithActivityItems:@[self.tweetTextView.text] applicationActivities:nil];
//
//     [moreUIActivityViewController initWithActivityItems:@[self.tweetTextView.text]        applicationActivities:nil];
//        
//        [self presentViewController:moreUIActivityViewController animated:YES completion:nil];
        
        // yeh galat hai sune koi aur sunao kisi aur ko
        // dunia khatam hojayegi par tum herogiri nahi dikha sakte
        // because dog is abandoned wife
        
        UIAlertController *uiAlertActionController = [UIAlertController alertControllerWithTitle:@"Test Title" message:@"Tweet your note" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelUIAlertAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
        
        UIAlertAction *tweetUIAlertAction = [UIAlertAction actionWithTitle:@"Tweet" style:UIAlertActionStyleDefault handler: ^(UIAlertAction *uiAlertAction) {
        
//            if ([SLComposeViewController isAvailableForServiceType: SLServiceTypeFacebook]) {
//
//                // [self showAlertMessage:@"Facebook is available"];
//                
//                SLComposeViewController *facebookSLComposeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
//                
//                [facebookSLComposeViewController setInitialText: self.tweetTextView.text];
//                [self presentViewController:facebookSLComposeViewController animated:YES completion:nil];
//                
//                
//            } else {
//                
//                [self showAlertMessage:@"Please sign in to Facebook"];
//            }
            
            if ([SLComposeViewController isAvailableForServiceType: SLServiceTypeTwitter]) {
                
                // Tweet Out the tweet
                SLComposeViewController *twitterSLComposeViewController = 
                        [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];

                // Tweet Out the tweet
                if ([self.tweetTextView.text length] < 140) {
                    [twitterSLComposeViewController setInitialText: self.tweetTextView.text];
                    
                } else {
                    
                    // don't do it such type of things
                    // currupt doggi mamas will die
                    NSString *shortTextNSString = [self.tweetTextView.text substringToIndex: 140];
                    [twitterSLComposeViewController setInitialText:shortTextNSString];
                }
                
                [self presentViewController:twitterSLComposeViewController animated:YES completion:nil];
                
            } else {
                // Raise some kind of objection
                // [self showAlertMessage:@"Please sign in to twitter before you tweet"];
                [self showAlertMessage:@"You are not signed into twitter"];
                
            }
        }];
        
        UIAlertAction *facebookUIAlertAction = [UIAlertAction actionWithTitle:@"Post to Facebbok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *uiAlertAction) {
            
            if ([SLComposeViewController isAvailableForServiceType: SLServiceTypeFacebook]) {
                
                // [self showAlertMessage:@"Facebook is available"];
                
                SLComposeViewController *facebookSLComposeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
                
                [facebookSLComposeViewController setInitialText: self.tweetTextView.text];
                [self presentViewController:facebookSLComposeViewController animated:YES completion:nil];
                
                
            } else {
                
                [self showAlertMessage:@"Please sign in to Facebook"];
            }
            
            // [self showAlertMessage:@"You clicked on Facebook"];
        }];
        
        UIAlertAction *moreUIAlertAction = [UIAlertAction actionWithTitle:@"More" style:UIAlertActionStyleDefault handler:^(UIAlertAction *uiAlertAction) {
    
            UIActivityViewController *moreUIActivityViewController =
            [[UIActivityViewController alloc] initWithActivityItems:@[self.tweetTextView.text] applicationActivities:nil];

//            [moreUIActivityViewController initWithActivityItems:@[self.tweetTextView.text] applicationActivities:nil];
            
            [self presentViewController:moreUIActivityViewController animated:YES completion:nil];
        }
    ];
        
        
        [uiAlertActionController addAction:tweetUIAlertAction];
        [uiAlertActionController addAction:facebookUIAlertAction];
        [uiAlertActionController addAction:moreUIAlertAction];
        [uiAlertActionController addAction:cancelUIAlertAction];
        
        [self presentViewController:uiAlertActionController animated:YES completion:nil];
        
        
    }
}

- (void) showAlertMessage:(NSString *) myMessage {
    
    UIAlertController *uiAlertController;
    
    uiAlertController = [UIAlertController alertControllerWithTitle:@"Social Share" message: myMessage preferredStyle:UIAlertControllerStyleAlert];
    
    [uiAlertController addAction: [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController: uiAlertController animated: YES completion: nil];
}

- (void)configureTweetTextView {
    
    self.tweetTextView.layer.backgroundColor = [UIColor colorWithRed:1.0
            green:1.0 blue:0.9 alpha:1.0].CGColor;
    
    self.tweetTextView.layer.cornerRadius = 10.0;
    self.tweetTextView.layer.borderColor = [UIColor colorWithWhite:0 alpha:0.5].CGColor;
    
    self.tweetTextView.layer.borderWidth = 2.0;
}


@end
