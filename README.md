# FlexibleLabel
You can use the badge.

##Usage
Can use like a UILabel.
~~~
badge = [[FlexibleLabel alloc]init];
badge.font = [UIFont fontWithName:@"AvenirNext-Medium" size:10.0];
badge.center = CGPointMake(20,30);
badge.textColor = RGBA(255,255,255,1.0);
badge.backgroundColor = RGBA(524,2,45,0.8);
badge.textAlignment = NSTextAlignmentCenter;
badge.radius = 0.5;
badge.trigger = @"0";
badge.padding = 1; //Clearance between the character and the frame.
[badge setValue:@"0"];

[view addSubview:badge];
~~~
Change of badge of character.
~~~
[badge setValue:@"1"];
~~~
If you specify the specific character when setting up the badge, badge will disappear when the character is set.
~~~
badge.trigger = @"0"; //"0" when it is set the badge will disappear.
~~~
