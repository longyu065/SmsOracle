create or replace function f_sendNew(urlS         varchar2,
                                     contentKey   varchar2,
                                     contentValue varchar2,
                                     mobileKey    varchar2,
                                     mobileValue  varchar2,
                                     otherString  varchar2,
                                     methodType  varchar2) return varchar2 as
  language java name 'Msg_run.mainConn(java.lang.String,java.lang.String,java.lang.String,java.lang.String,java.lang.String,java.lang.String,java.lang.String) return java.lang.String';
--language java name 'test.run.mainsend() return java.lang.String';
/
