/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     RETVAL = 258,
     GLOBAL = 259,
     STR = 260,
     EQ = 261,
     ENDD = 262,
     IDENTIFIER = 263,
     F_IDENTIFIER = 264,
     NUMBER = 265,
     TEMPORARY = 266,
     LABEL = 267,
     GOTO = 268,
     GOTO_LABEL = 269,
     IF = 270,
     RETURN = 271,
     PARAM = 272,
     CALL = 273,
     H = 274,
     OP = 275,
     CP = 276
   };
#endif
/* Tokens.  */
#define RETVAL 258
#define GLOBAL 259
#define STR 260
#define EQ 261
#define ENDD 262
#define IDENTIFIER 263
#define F_IDENTIFIER 264
#define NUMBER 265
#define TEMPORARY 266
#define LABEL 267
#define GOTO 268
#define GOTO_LABEL 269
#define IF 270
#define RETURN 271
#define PARAM 272
#define CALL 273
#define H 274
#define OP 275
#define CP 276




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 18 "parser3.y"
{
    char *str;
}
/* Line 1529 of yacc.c.  */
#line 95 "parser3.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

