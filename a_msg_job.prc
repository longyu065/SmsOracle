create or replace procedure a_msg_job is
  v_data       date;
  v_hh         varchar2(20);
  v_a_text_msg a_text_msg %rowtype;
  v_key        a_text_msg_key%rowtype;
  cursor c_msg is
    select * from a_text_msg t where t.result is null for update;
  v_resu varchar2(1000);
begin
  -- select sysdate into v_data from dual;
  --先判断当前日期 是否是工作日
  select *
    into v_key
    from a_text_msg_key
   where Kid = (select max(kid) from a_text_msg_key);
  select to_char(sysdate, 'HH24') into v_hh from dual;
 -- v_hh := 9;

  if v_hh > 7 and v_hh < 17 then
    execute immediate 'alter trigger trg_befins_msg  enable';
    --  v_result :=0;
    for v_a_text_msg in c_msg loop
      v_resu := 'mobile.length!=11';
      if length(v_a_text_msg.user_mobile) = 11 then
      
        select f_sendNew(v_key.url,
                         v_key.contentkey,
                         v_a_text_msg.msg_content,
                         v_key.mobilekey,
                         v_a_text_msg.user_mobile,
                         v_key.other,
                         v_key.methodtype)
          into v_resu
          from dual;
        -- dbms_output.put_line(:new.msg_id);
      end if;
      update a_text_msg c
         set c.update_time = sysdate, c.result = v_resu
       where current of c_msg;
    end loop;
    commit;
  else
    execute immediate 'alter trigger trg_befins_msg  disable';
  end if;
end a_msg_job;
/
