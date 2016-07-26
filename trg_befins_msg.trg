create or replace trigger trg_befins_msg
  before insert on A_TEXT_MSG
  for each row
declare
  -- local variables here

  v_resu varchar2(100);
  --PRAGMA AUTONOMOUS_TRANSACTION;
 v_key a_text_msg_key%rowtype;
begin

  v_resu := 'mobile.length!=11';
  if length(:new.user_mobile) = 11 then
    select * into v_key from a_text_msg_key where Kid=(select max(kid) from a_text_msg_key );
    select f_sendNew(v_key.url,
                    v_key.contentkey,
                     :new.msg_content,
                       v_key.mobilekey,
                     :new.user_mobile,
                       v_key.other,v_key.methodtype)
      into v_resu
      from dual;
    -- dbms_output.put_line(:new.msg_id);
  end if;
  :new.update_time := sysdate;
  :new.result      := v_resu;
  --   dbms_output.put_line(v_sql);
end trg_befins_msg;
/
