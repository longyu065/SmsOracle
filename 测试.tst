PL/SQL Developer Test script 3.0
18
-- Created on 2016.7.11,星期一 by K 
declare
  -- Local variables here
  i integer;
  d varchar2(3000);
begin
  -- Test statements here
  
  select f_sendNew('http://umessage.yyuap.com/remote/****',
                   'content',
                   'contentttt',
                   'mobile',
                   11位手机号,
                   'corpId=****,secretKey=****','Post')
    into d
    from dual;
  dbms_output.put_line(d);
end;
0
0
