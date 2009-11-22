$(document).ready(function() {
  $.getJSON('http://twitter.com/statuses/user_timeline/tatejohnson.json?count=5&callback=?', function(response) {
    var div = $('<div></div>').attr('id', 'twitter');
    var h2 = $('<h2>Doing</h2>');
    var ul = $('<ul></ul>');
    $.each(response, function() {
      var date = new Date(this.created_at);
      var createdAt = $.timeago(date);
      $('<li>' +
          this.text +
          '<span><a href="http://twitter.com/tatejohnson/status/' + this.id + '">' + createdAt + '</a></span>' +
        '</li>').appendTo(ul);
    });
    h2.appendTo(div);
    ul.appendTo(div);
    div.appendTo('#sociable');
  });
  
  $.getJSON('http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=tatey&api_key=0d8ba8a4875bc28a914e753ee108d425&format=json&limit=5&callback=?', function(response) {
    var div = $('<div></div>').attr('id', 'lastfm');
    var h2 = $('<h2>Listening</h2>');
    var ul = $('<ul></ul>');
    $.each(response.recenttracks.track, function() {
      if (this.date) {
        var date = new Date();
        date.setTime(parseInt(this.date.uts) * 1000);
        var createdAt = $.timeago(date);
      }
      $('<li>' +
          '<div class="left">' +
            '<a href="' + this.url + '"><img width="64" height="64" src="' + (this.image[1]['#text'] || '/images/about/lastfm_default.png') + '" alt="" /></a>' +
          '</div>' +
          '<div class="right">' +
            '<span><a href="' + this.url + '">' + this.name + '</a></span>' +
            '<span>' + (this.artist['#text'] || 'Unknown') + '</span>' +
            '<span>' + (createdAt || 'Listening now') + '</span>' +
          '</div>' +
          '<div class="clear_both"></div>' +
        '</li>').appendTo(ul);
    });
    h2.appendTo(div);
    ul.appendTo(div);
    div.appendTo('#sociable');
    $('<div></div>').attr('class', 'clear_both').appendTo('#sociable');
  });
  
  $.getJSON('http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=3ac1cf9414d294b2a508059b00a5ad3f&format=json&jsoncallback=?&per_page=21&page=1&extras=url_sq&user_id=23054854@N06', function(response) {
    var div = $('<div></div>').attr('id', 'flickr');
    var h2 = $('<h2>Photographing</h2>');
    var clearBoth = $('<div></div>').attr('class', 'clear_both');
    var ul = $('<ul></ul>');
    $.each(response.photos.photo, function() {
      $('<li>' +
          '<a href="http://flickr.com/photos/23054854@N06/' + this.id + '"><img src="' + this.url_sq + '" alt="" /></a>' +
        '</li>').appendTo(ul);
    });
    h2.appendTo('#sociable');
    ul.appendTo(div);
    clearBoth.appendTo(div);
    div.appendTo('#sociable');
  });  
});
