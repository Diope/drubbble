$('comment[<%= @post.id %>]').append("<%=j render 'comment/comments', post: @post, comment: @comment %>");
$('#comment_content<%= @post.id %>').val('')
