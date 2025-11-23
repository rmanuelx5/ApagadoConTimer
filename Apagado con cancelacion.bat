:start
@echo off
echo.
echo Desea apagar (1) o cancelar apagado (2)? 
choice /C:12 /N
set funcion=%errorlevel%
cls
IF %funcion%==1 (goto apagar)
IF %funcion%==2 (goto cancelar)
echo.
cls
echo Funcion desconocida "%unidad%" no reconocida.
echo Pulsa una tecla para reintentar o salga con la cruz.
pause>nul
cls
goto start

:apagar
echo.
echo Elegir unidad de tiempo: segundo(1), minuto(2), hora(3)? 
choice /C:123 /N
set unidad= %errorlevel%
cls
echo Presione "Enter" para elegir
IF %unidad%==1 (goto segundos)
IF %unidad%==2 (goto minutos)
IF %unidad%==3 (goto horas)
echo.
cls
echo Unidad "%unidad%" no reconocida.
echo Pulsa una tecla para reintentar o salga con la cruz.
pause>nul
cls
goto apagar

:segundos
	echo.
	set /p timer= En cuantos segundos quiere apagar la PC? 
	cls
	shutdown -s -t %timer%
	echo Apagado automatico configurado dentro de %timer% segundos.
	echo Presiones 1 para salir o 2 para cancelar apagado. 
	choice /C:12 /N
	set otro= %errorlevel%
	cls
	IF %otro%==2 (goto cancelar)
	exit

:minutos
	echo.
	set /p timer= En cuantos minutos quiere apagar la PC? 
	cls
	set /a timer = %timer% * 60
	shutdown -s -t %timer%
	set /a timer = %timer% / 60
	echo Apagado automatico configurado dentro de %timer% minutos.
	echo Presiones 1 para salir o 2 para cancelar apagado. 
	choice /C:12 /N
	set otro= %errorlevel%
	cls
	IF %otro%==2 (goto cancelar)
	exit

:horas
	echo.
	set /p timer= En cuantas horas quiere apagar la PC? 
	cls
	set /a timer = %timer% * 60 * 60
	shutdown -s -t %timer%
	set /a timer = %timer% / 60 / 60
	echo Apagado automatico configurado dentro de %timer% horas.
	echo Presiones 1 para salir o 2 para cancelar apagado. 
	choice /C:12 /N
	set otro= %errorlevel%
	cls
	IF %otro%==2 (goto cancelar)
	exit

:cancelar
shutdown -a
echo Apagado automatico cancelado
echo Desea programar otro apagado? 1 si o 2 no. 
choice /C:12 /N
set otro= %errorlevel%
cls
IF %otro%==1 (goto apagar)
exit