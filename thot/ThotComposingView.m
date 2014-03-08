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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //A view to compose your Thot - UITextView allows us to enter multiple lines of text.
        //This
        thotComposerTextView = [[UITextView alloc] init];
        
        thotComposerTextView.frame = CGRectMake(self.bounds.origin.x +10, self.bounds.origin.y+
                                                10, self.bounds.size.width - 60, self.bounds.size.height - 60);
        
        thotComposerTextView.center = self.center;
        
        thotComposerTextView.text = @"Share Your Thots!!!";
        
        thotComposerTextView.textColor = [UIColor lightGrayColor];
        
        thotComposerTextView.delegate = self;
        
        
        
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
