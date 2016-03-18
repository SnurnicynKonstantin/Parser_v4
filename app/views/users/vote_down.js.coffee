$('.vote_info').html(<%= @user.vote_count(:all) %>)
$('.vote_link a').attr("href", "<%= vote_up_user_path(@user) %>")
$('.vote_link a').text('Голосовать за этого пользователя')