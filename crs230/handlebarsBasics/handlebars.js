// practice exercises from: https://launchschool.com/lessons/9aae660f/assignments/c19a333f

$(document).ready(function() {
  var postTemplate = $('#post').html();
  var postTemplateScript = Handlebars.compile(postTemplate);
  Handlebars.registerPartial('tag', $('#tag').html());

  var context = {};
  var postA = {
    title: 'Lorem ipsum dolor sit amet',
    published: 'April 1, 2015',
    body: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.'
  };

  postA.body = postA.body.concat('<p>Sed enough!</p>');
  postA.tags = ['Latin', 'text', 'self-indulgence'];

  var postB = {
    title: 'Amet Lorem dolor',
    published: 'April 4, 2015',
    body: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.'
  };

  var posts = [postA, postB];
  context.posts = posts;

  $('body').append(postTemplateScript(context));
});
