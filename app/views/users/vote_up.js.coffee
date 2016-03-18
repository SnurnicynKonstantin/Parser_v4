$('.vote_info').html(<%= @user.vote_count(:all) %>)
$('.vote_link a').attr('href', "<%= vote_down_user_path(@user) %>")
$('.vote_link a').text('Снять голос за этого пользователя')