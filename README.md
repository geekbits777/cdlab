### For Lex
Open Cmd (Ctrl 6)
1. flex hello.l
2. gcc lex.yy.c
3. a.exe

### For YACC
Open Cmd
1. flex hello.l
2. bison -dy hello.y
3. gcc lex.yy.c
4. a.exe
