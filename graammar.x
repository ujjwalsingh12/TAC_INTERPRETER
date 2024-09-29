--------------------------
start 	-> program | 
--------------------------
program 	-> globals functions program | $ENDD | 
--------------------------
globals 	-> globaldecl globals $RETURN | e | 
--------------------------
functions 	-> $F_IDENTIFIER tokens $RETURN | e | 
--------------------------
globaldecl 	-> $GLOBAL $IDENTIFIER | $TEMPORARY $EQ $NUMBER | $TEMPORARY $EQ $TEMPORARY | $IDENTIFIER $EQ $TEMPORARY | ENDS
--------------------------
tokens 	-> token tokens | $OP decls $CP tokens | e | 
--------------------------
token 	-> 
--------------------------
decls 	-> paramdecls fundecls retvaldecl | e | 
--------------------------
paramdecls 	-> paramdecl paramdecls | e | 
--------------------------
fundecls 	-> fundecl fundecls | e | 
--------------------------
retvaldecl 	-> $RETVAL $EQ $TEMPORARY | $RETVAL $EQ $IDENTIFIER | ENDS
--------------------------
paramdecl 	-> $IDENTIFIER $EQ $PARAM | ENDS
--------------------------
fundecl 	-> assignmt | func_call | conditional | $GOTO $GOTO_LABEL | $LABEL | 
--------------------------
assignmt 	-> direct | indirect | 
--------------------------
func_call 	-> func_parm $CALL $LABEL | 
--------------------------
conditional 	-> $IF $OP $TEMPORARY $CP $GOTO $GOTO_LABEL | ENDS
--------------------------
direct 	-> $IDENTIFIER $EQ $TEMPORARY | $TEMPORARY $EQ $NUMBER | $TEMPORARY	 $EQ $TEMPORARY | $TEMPORARY $EQ $IDENTIFIER | $TEMPORARY $EQ $STR | $PARAM $EQ $TEMPORARY | ENDS
--------------------------
indirect 	-> $TEMPORARY $EQ condition | 
--------------------------
func_parm 	-> $PARAM $EQ $TEMPORARY | $PARAM $EQ $IDENTIFIER | e | 
--------------------------
condition 	-> $IDENTIFIER | $H | $CP | $OP | ENDS