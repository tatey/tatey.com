---
layout: post
title: Replicating view for header section in UITableView
time: '23:13'
---

[![Screenshot](/images/posts/2011-01-06-replicating-view-for-header-section-in-uitableview/customtableview_s.png)](/images/posts/2011-01-06-replicating-view-for-header-section-in-uitableview/customtableview.png)

When building [Antenna Mate](http://antennamate.com), I wanted to use a UITableView with the grouped style that preserved the appearance of labels in the header. While Apple makes it easy to change the background, there's no mechanism for changing label properties for the header view in the same way. You need to create a custom header view and replicate the default label. After much tweaking, here is how to do it.

{% highlight objectivec %}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	UIView *header = [[UIView alloc] initWithFrame:CGRectMake(19.0, 4.25, 320.0, 46.0)];
	UILabel *label = [[UILabel alloc] initWithFrame:header.frame];
	label.backgroundColor= [UIColor clearColor];
	label.textColor = [UIColor redColor];
	label.shadowColor = [UIColor whiteColor];
	label.shadowOffset = CGSizeMake(0, 1);
	label.font = [UIFont boldSystemFontOfSize:17.0];
	label.text = @"Your text here";
	[header addSubview:[label autorelease]];
	return [header autorelease];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 46.0;
}
{% endhighlight %}
