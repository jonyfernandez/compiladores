c:\GnuWin32\bin\flex Lexico.l
pause
c:\MinGW\bin\gcc.exe lex.yy.c -o TPFinal.exe
pause
pause
TPFinal.exe Prueba.txt
del lex.yy.c
del TPFinal.exe
pause