$(document).ready(function() {
  $.getJSON('http://twitter.com/statuses/user_timeline/tatejohnson.json?count=5&callback=?', function(response) {
    var ul = $('<ul></ul>');
    $.each(response, function() {
      $('<li>' +
          this.text +
          '<a href="http://twitter.com/tatejohnson/status/' + this.id + '">' + $.timeago(this.created_at) + '</a>' +
        '</li>').appendTo(ul);
    });
    ul.appendTo('#twitter');
  });

  $.getJSON('http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=tatey&api_key=0d8ba8a4875bc28a914e753ee108d425&format=json&limit=5&callback=?', function(response) {
    var ul = $('<ul></ul>');
    $.each(response.recenttracks.track, function() {
      $('<li>' +
          '<div class="left">' +
            '<a href="' + this.url + '"><img width="64" height="64" src="' + (this.image[1]['#text'] || 'default.png') + '" alt="" /></a>' +
          '</div>' +
          '<div class="right">' +
            '<a href="' + this.url + '">' + this.name + '</a>' +
            '<span>' + (this.artist['#text'] || 'Unknown') + '</span>' +
            '<span>' + (this.date ? $.timeago(this.date['#text']) : 'Listening now') + '</span>' +
          '</div>' +
          '<div class="clear_both"></div>' +
        '</li>').appendTo(ul);
    });
    ul.appendTo('#lastfm');
  });

  $.getJSON('http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=3ac1cf9414d294b2a508059b00a5ad3f&format=json&jsoncallback=?&per_page=10&page=1&extras=url_sq&user_id=23054854@N06', function(response) {
    var ul = $('<ul></ul>');
    $.each(response.photos.photo, function() {
      $('<li>' +
          '<a href="http://flickr.com/photos/23054854@N06/' + this.id + '"><img src="' + this.url_sq + '" alt="" /></a>' +
        '</li>').appendTo(ul);
    });
    ul.appendTo('#flickr');
  });  
});
