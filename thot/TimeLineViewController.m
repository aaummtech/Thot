//
//  TimeLineViewController.m
//  thot
//
//  Created by AAUMMTECH on 08/03/14.
//  Copyright (c) 2014 aaummtech. All rights reserved.
//

#import "TimeLineViewController.h"

@interface TimeLineViewController ()

@end

@implementation TimeLineViewController
UIView *pullerView;
float firstX;
float firstY;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        pullerView = [[UIView alloc] initWithFrame:CGRectMake(0, -800, self.view.frame.size.width, 1000)];
      
        
        [pullerView setBackgroundColor:[UIColor clearColor]];
        pullerView.alpha = 0.7;

        UIView *actualPullerView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 75, 800,75, 175)];
        [actualPullerView setBackgroundColor:[UIColor blackColor]];
        actualPullerView.layer.cornerRadius = 25.0f;
        actualPullerView.layer.shadowColor = [UIColor blackColor].CGColor;
        actualPullerView.layer.shadowRadius = 5.0f;
        actualPullerView.layer.shadowOpacity = 1.0f;
        actualPullerView.layer.shadowOffset = CGSizeMake(0, 5);
        
        
        
        
        ThotComposingView *thotComposingView = [[ThotComposingView alloc] initWithFrame:CGRectMake(0,800, self.view.frame.size.width, 150)];

        
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] init];
        [panGestureRecognizer addTarget:self action:@selector(panGestureRecognizerAction:)];
        [pullerView addGestureRecognizer:panGestureRecognizer];
        
        [thotComposingView setBackgroundColor:[UIColor redColor]];

        

        [pullerView addSubview:actualPullerView];
        [pullerView addSubview:thotComposingView];
        [self.view addSubview:pullerView];
        
        
        
        
    }
    return self;
}

-(void)panGestureRecognizerAction:(UIPanGestureRecognizer*)sender
{
    
    
    [[[(UITapGestureRecognizer*)sender view] layer] removeAllAnimations];
    
	[self.view bringSubviewToFront:[(UIPanGestureRecognizer*)sender view]];
	CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:self.view];
    
	if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        
		//firstX = [[sender view] center].x;
		firstY = [[sender view] center].y;
	}
    
	translatedPoint = CGPointMake([sender view].center.x, firstY+translatedPoint.y);
    
	[[sender view] setCenter:translatedPoint];
    
	if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded) {
        
		//CGFloat finalX = translatedPoint.x + (.35*[(UIPanGestureRecognizer*)sender velocityInView:self.view].x);
		CGFloat finalY = translatedPoint.y + (.35*[(UIPanGestureRecognizer*)sender velocityInView:self.view].y);
        
		
        
		
        
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:.10];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        if(translatedPoint.y - finalY < 0){
        
//            [[sender view] setCenter:CGPointMake([sender view].center.x, -300)];
            [[sender view] setCenter:CGPointMake([sender view].center.x, -300)];
        }else{
    
            [[sender view] setCenter:CGPointMake([sender view].center.x, -450)];
        }
		
		[UIView commitAnimations];
    
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
