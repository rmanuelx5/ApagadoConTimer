:inicio
:abort
@echo off
echo.
set /p unidad= Elegir unidad de tiempo segundo(s), minuto(m), hora(h)? 
cls
IF %unidad%==s (goto segundos)
IF %unidad%==m (goto minutos)
IF %unidad%==h (goto horas)
echo.
cls
echo Unidad "%unidad%" no reconocida.
echo Pulsa una tecla para reintentar o salga con la cruz.
pause>nul
cls
goto inicio

:segundos
	echo.
	set /p timer= En cuantos segundos queres apagar la PC? 
	cls
	shutdown -s -t %timer%
	echo Apagado automatico configurado dentro de %timer% segundos.
	echo Pulsa una tecla para salir.
	pause>nul
	exit

:minutos
	echo.
	set /p timer= En cuantos minutos queres apagar la PC? 
	cls
	set /a timer = %timer% * 60
	shutdown -s -t %timer%
	set /a timer = %timer% / 60
	echo Apagado automatico configurado dentro de %timer% minutos.
	echo Pulsa una tecla para salir.
	pause>nul
	exit

:horas
	echo.
	set /p timer= En cuantos horas queres apagar la PC? 
	cls
	set /a timer = %timer% * 60 * 60
	shutdown -s -t %timer%
	set /a timer = %timer% / 60 / 60
	echo Apagado automatico configurado dentro de %timer% horas.
	echo Pulsa una tecla para salir.
	pause>nul
	exit