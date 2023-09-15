@echo off
color 2
title YLCHEN Count System
set XPATH=%1
set Local=%2
set FSA=%3
set FSB=%4
set cores=%5
set SEEDA="%~dp0SEEDA.R"
set SEEDB="%~dp0SEEDB.R"
set MAP="%~dp0MAP.R"
set SUM="%~dp0SUM.R"
set /a ints=%cores%
for /l %%i in (1 1 %ints%) do (
start "MAP" %XPATH% %MAP% %Local% %%i.seq
)