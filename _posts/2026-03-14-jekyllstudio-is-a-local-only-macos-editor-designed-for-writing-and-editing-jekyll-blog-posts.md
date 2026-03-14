---
layout: post
published: false
title: JekyllStudio is a local-only macOS editor designed for writing and editing Jekyll blog posts
---

I've been using [Jekyll](https://jekyllrb.com) since 2009 (17 years at time of writing!) and it remains my favourite way to publish on the web. 

Jekyll’s appeal lies in its [philosophy](https://jekyllrb.com/philosophy/). Your content lives on disk as plain files, they get generated into a static site, and the generated site can be pushed to any web server. No databases, no admin panel, and blog posts still get pretty permalinks. The elegance of Jekyll's build system proves you don't have to give up polished detail to have a static site. 

However, the same can't be said for Jekyll's blogging experience. Writing with Jekyll means opening a text editor, manually handling files, manually placing images, and running the preview server from the command line. None of these steps are difficult, but they interrupt the flow of writing. This makes Jekyll's blogging experience feel less refined than something like Substack of WordPress.

Using [OpenCode](https://opencode.ai) and GPT 5.3 I wanted to see if Jekyll's build system could be paired with macOS's human interface to create a polished writing experience. The result is a new, local-only, [Mac-arsed](https://daringfireball.net/linked/2020/03/20/mac-assed-mac-apps) editor designed for Jekyll called [JekyllStudio](https://github.com/tatey/JekyllStudio). Simply open it and start writing.

# Create and edit posts without thinking

Jekyll uses a filename convention where the date and slug are part of the filename. This filename becomes the permalink so if you change your post’s title or date you’ll need to edit the filename to match.

In JekyllStudio, press the “New Post” button and start writing. A correctly formatted filename is automatically created with “Untitled” as the title. JekyllStudio will then rename the file on disk if you change the title or date.

# Drag and drop images from anywhere

Jekyll has no conventions for handling images in posts. You need to decide where to place them, whether to optimise them, and how to reference them in Markdown.

In JekyllStudio you simply drag an image into the post. The image is automatically optimised for web and the Markdown reference is inserted at your cursor.

# Integrated live preview

Jekyll already offers a preview server that automatically rebuilds the site as you write.  This usually involves starting the server from the terminal and switching between your editor and browser.

JekyllStudio simplifies this process by integrating it directly. On launch it automatically spawns the preview server and renders the current post. This allows you to see your writing in your sites styling without leaving the app.

# Other features

- Automatic saving ensures your writing is never lost
- Hide the sidebar to maximise focus on your writing
- Edit front matter directly from your post, changing properties like `layout` or `published`
- A green status icon indicates your preview server is running normally
- Access preview server logs for troubleshooting or debugging
- Keyboard shortcuts
- A beautiful app icon to sit in your dock

JekyllStudio is for people who love the Jekyll philosophy, but yearn for the polished writing experience of platforms such as Substack or Wordpress. It is open source and [available for download on GitHub](https://github.com/tatey/JekyllStudio). If you like it, I'd love to hear from you.
