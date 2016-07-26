-- Create table
create table A_TEXT_MSG
(
  msg_id      NUMBER not null,
  user_mobile NUMBER,
  msg_content VARCHAR2(2000),
  update_time DATE,
  result      VARCHAR2(200)
)