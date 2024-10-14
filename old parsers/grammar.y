--------------------------
start 		: program 
--------------------------
program 	: globals functions program 
			| ENDD 
			;
--------------------------
globals 	: globaldecl globals RETURN  
			| ;
--------------------------
globaldecl 	: GLOBAL IDENTIFIER 
			| TEMPORARY  EQ NUMBER 
			| TEMPORARY  EQ TEMPORARY 
			| IDENTIFIER EQ TEMPORARY 
			;
--------------------------
functions 	: F_IDENTIFIER tokens RETURN 
			| ;
--------------------------
tokens 	: token tokens 
			| OP decls CP tokens 
			| ; 
--------------------------
token 	: 
--------------------------
decls 	: paramdecls fundecls retvaldecl 
			| ; 
--------------------------	
paramdecls 	: paramdecl paramdecls 
			| ; 
--------------------------
paramdecl 	: IDENTIFIER EQ PARAM 
--------------------------
fundecls 	: fundecl fundecls 
			| ; 
--------------------------
fundecl 	: assignmt
			| func_call
			| conditional
			| GOTO GOTO_LABEL
			| LABEL
--------------------------
assignmt    : direct
			| indirect
--------------------------
direct      : IDENTIFIER EQ TEMPORARY 
			| TEMPORARY  EQ NUMBER 
			| TEMPORARY	 EQ TEMPORARY 
			| TEMPORARY  EQ IDENTIFIER
			| TEMPORARY  EQ STR
			| PARAM      EQ TEMPORARY
			;
--------------------------
indirect    : TEMPORARY EQ condition
--------------------------
condition   : IDENTIFIER
			| H
			| CP
			| OP
			;
--------------------------
conditional : IF OP TEMPORARY CP GOTO GOTO_LABEL
--------------------------
func_call   : func_parm CALL LABEL
			;
--------------------------
func_parm   : PARAM      EQ TEMPORARY
			| PARAM      EQ IDENTIFIER
			| ;
--------------------------
retvaldecl 	: RETVAL EQ TEMPORARY
			| RETVAL EQ IDENTIFIER
			;