@echo off

echo 获取系统时间
set CurYear=%Date:~0,4%

set CurMonth=%Date:~5,2%
if %CurMonth% LSS 10 set CurMonth=0%Date:~6,1%

set CurDay=%Date:~8,2%
if %CurDay% LSS 10 set CurDay=0%Date:~9,1%

set Curhore=%time:~0,2%
if %Curhore% LSS 10 set Curhore=0%time:~1,1%

set Curminute=%time:~3,2%
if %Curminute% LSS 10 set Curminute=0%time:~4,1%

set Cursecond=%time:~6,2%
if %Cursecond% LSS 10 set Cursecond=0%time:~7,1%

set CurDate=%CurYear%%CurMonth%%CurDay%_%Curhore%%Curminute%%Cursecond%
set FilePath=e:/征信数据备份/

title 数据库备份 备份时间：%CurDate%

e:

echo 删除文件夹:%CurDate%
rd /s /q BackUp--DB--%CurDate%

echo 创建文件夹:%CurDate%
md BackUp--DB--%CurDate%

cd BackUp--DB--%CurDate%

set backpath=%FilePath%BackUp--DB--%CurDate%


echo 开始备份数据库
expdp rs2/rs2@rs owner=rs2 file=%backpath%/rs_%curdate%.dmp log=%backpath%/rs_%curdate%.log
echo 结束备份数据库
