//
//  ViewController.m
//  json
//
//  Created by Afry on 15/12/18.
//  Copyright © 2015年 Afry. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)NSMutableString *mulStr;


@property (weak) IBOutlet NSButton *btn;

@property (weak) IBOutlet NSScrollView *label;





@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}
-(void)viewWillTransitionToSize:(NSSize)newSize{
    self.label.frame = CGRectMake(0, 0, newSize.width, newSize.height-100);

}
- (IBAction)btnClick:(id)sender {
    NSTextView *tv= (NSTextView *)self.label.contentView.documentView;

    self.mulStr = [NSMutableString string];
    NSString *str = tv.string;
    
    NSInteger tab = 0;
    for (int i=0; i<str.length; i++) {
        NSString *temp = [str substringWithRange:NSMakeRange(i, 1)];
        //
        if([temp isEqualToString:@"{"]){
            
            [self.mulStr appendString:@"{\n"];
            
            tab++;
            [self addSpaceWithTag:tab];
            
        
        }else if ([temp isEqualToString:@"["]){
            [self.mulStr appendString:@"[\n"];

            tab++;
            [self addSpaceWithTag:tab];
        
        }else if ([temp isEqualToString:@","]){

            [self.mulStr appendString:@",\n"];
            [self addSpaceWithTag:tab];
        }else if ([temp isEqualToString:@"}"]){
            [self.mulStr appendString:@"\n"];
            tab--;
            [self addSpaceWithTag:tab];
            [self.mulStr appendString:@"}"];
        }else if ([temp isEqualToString:@"]"]){
            [self.mulStr appendString:@"\n"];
            tab--;
            [self addSpaceWithTag:tab];
            [self.mulStr appendString:@"]"];
            
        }else{
            [self.mulStr appendString:temp];
        
        }

        
        

    }

    
    
    [tv scrollToBeginningOfDocument:nil];

    tv.string=self.mulStr;
    
    
    
}

-(void)addSpaceWithTag:(NSInteger)tab{
    for (NSInteger i=0; i<tab; i++) {
        [self.mulStr appendString:@"  "];
    }
}


- (void)setRepresentedObject:(id)representedObject {

    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
