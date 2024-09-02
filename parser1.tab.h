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
     GLOBAL = 258,
     STR = 259,
     EQ = 260,
     ENDD = 261,
     IDENTIFIER = 262,
     F_IDENTIFIER = 263,
     NUMBER = 264,
     TEMPORARY = 265,
     LABEL = 266,
     GOTO = 267,
     GOTO_LABEL = 268,
     IF = 269,
     RETURN = 270,
     PARAM = 271,
     CALL = 272,
     H = 273,
     OP = 274,
     CP = 275
   };
#endif
/* Tokens.  */
#define GLOBAL 258
#define STR 259
#define EQ 260
#define ENDD 261
#define IDENTIFIER 262
#define F_IDENTIFIER 263
#define NUMBER 264
#define TEMPORARY 265
#define LABEL 266
#define GOTO 267
#define GOTO_LABEL 268
#define IF 269
#define RETURN 270
#define PARAM 271
#define CALL 272
#define H 273
#define OP 274
#define CP 275




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 15 "parser1.y"
{
    char *str;
}
/* Line 1529 of yacc.c.  */
#line 93 "parser1.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

