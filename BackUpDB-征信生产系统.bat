@echo off

echo ��ȡϵͳʱ��
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
set FilePath=e:/�������ݱ���/

title ���ݿⱸ�� ����ʱ�䣺%CurDate%

e:

echo ɾ���ļ���:%CurDate%
rd /s /q BackUp--DB--%CurDate%

echo �����ļ���:%CurDate%
md BackUp--DB--%CurDate%

cd BackUp--DB--%CurDate%

set backpath=%FilePath%BackUp--DB--%CurDate%


echo ��ʼ�������ݿ�
expdp rs2/rs2@rs owner=rs2 file=%backpath%/rs_%curdate%.dmp log=%backpath%/rs_%curdate%.log
echo �����������ݿ�
