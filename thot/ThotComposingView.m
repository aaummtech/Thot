//
//  ThotComposingView.m
//  thot
//
//  Created by Vishnu Vardhan Balakrishnan on 08/03/14.
//  Copyright (c) 2014 aaummtech. All rights reserved.
//

#import "ThotComposingView.h"

@implementation ThotComposingView
@synthesize thotComposerTextView;
@synthesize submitButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //A view to compose your Thot - UITextView allows us to enter multiple lines of text.
        
        thotComposerTextView = [[UITextView alloc] init];
        
        
        thotComposerTextView.frame = CGRectMake(10,10,300,self.frame.size.height-50);
        
        //thotComposerTextView.center = self.center;
        
        thotComposerTextView.text = @"Share Your Thots!!!";
        
        thotComposerTextView.textColor = [UIColor lightGrayColor];
        
        thotComposerTextView.delegate = self;
        
        
        submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [submitButton setFrame:CGRectMake(self.frame.size.width - 80, 120, 70, 20)];
        
        [submitButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
 
        
        [submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        
        [submitButton setTitle:@"Think it!" forState:UIControlStateNormal];
        [self addSubview:submitButton];
        	
        
        [self addSubview:thotComposerTextView];
        
        
        
    }
    return self;
}


-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{

    thotComposerTextView.text = @"";
    thotComposerTextView.textColor = [UIColor blackColor];
    return YES;

}


-(void)textViewDidChange:(UITextView *)textView{

        if([thotComposerTextView.text length] == 0)
        {
            thotComposerTextView.text = @"Share your Thots!!!";
            thotComposerTextView.textColor = [UIColor lightGrayColor];
            [thotComposerTextView resignFirstResponder];
            
        }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    [thotComposerTextView resignFirstResponder];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
