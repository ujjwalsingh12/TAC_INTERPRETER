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
     NEWLINE = 258,
     RETVAL = 259,
     GLOBAL = 260,
     STR = 261,
     EQ = 262,
     ENDD = 263,
     IDENTIFIER = 264,
     F_IDENTIFIER = 265,
     NUMBER = 266,
     TEMPORARY = 267,
     LABEL = 268,
     GOTO = 269,
     GOTO_LABEL = 270,
     IF = 271,
     RETURN = 272,
     PARAM = 273,
     CALL = 274,
     H = 275,
     OP = 276,
     CP = 277
   };
#endif
/* Tokens.  */
#define NEWLINE 258
#define RETVAL 259
#define GLOBAL 260
#define STR 261
#define EQ 262
#define ENDD 263
#define IDENTIFIER 264
#define F_IDENTIFIER 265
#define NUMBER 266
#define TEMPORARY 267
#define LABEL 268
#define GOTO 269
#define GOTO_LABEL 270
#define IF 271
#define RETURN 272
#define PARAM 273
#define CALL 274
#define H 275
#define OP 276
#define CP 277




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 16 "parser6.y"
{
    char *str;
}
/* Line 1529 of yacc.c.  */
#line 97 "parser6.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

