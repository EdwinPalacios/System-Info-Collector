@echo off
setlocal enabledelayedexpansion

echo Descargo de responsabilidad: Este script está destinado únicamente a fines educativos y diagnósticos.
echo No debe ser utilizado para ninguna actividad ilegal o no autorizada.
echo El usuario es el único responsable de su uso.

echo Autor: EdwinPalacios
echo Versión: 1.0
echo Propósito: Recopilar información del sistema para tareas de diagnóstico

echo Seleccione la opción deseada:
echo 1. Recopilar toda la información
echo 2. Recopilar información selectiva
echo 3. Salir
set /p opcion=Ingrese una opción:

if "%opcion%"=="3" goto fin
if "%opcion%"=="1" goto opcion_toda
if "%opcion%"=="2" goto opcion_selectiva

:opcion_toda
call :informacion_general
call :informacion_so
call :informacion_ip
call :informacion_programas
call :informacion_disco
call :informacion_cpu
call :informacion_ram
call :informacion_tarjeta_grafica
call :informacion_bios
call :informacion_procesos
call :informacion_firewall
call :informacion_actualizaciones
call :informacion_servicios
call :informacion_red
call :informacion_usuarios
call :informacion_grupos
call :informacion_unidades
call :informacion_dispositivos
call :informacion_mac
goto fin

:opcion_selectiva
echo Elija la información que desea recopilar:
echo 1. Información general y usuario actual
echo 2. Sistema operativo
echo 3. Configuración de IP
echo 4. Programas instalados
echo 5. Información de disco
echo 6. Información de la CPU
echo 7. Información de la memoria RAM
echo 8. Información de la tarjeta gráfica
echo 9. Información de la BIOS
echo 10. Procesos en ejecución
echo 11. Estado del firewall de Windows
echo 12. Información de actualizaciones de Windows
echo 13. Servicios en ejecución
echo 14. Conexiones de red activas
echo 15. Información de usuarios
echo 16. Grupos en el sistema
echo 17. Unidades de red mapeadas
echo 18. Dispositivos de hardware
echo 19. Dirección MAC
echo 20. Salir
set /p seleccion=Ingrese una opción:

if "%seleccion%"=="20" goto fin
if "%seleccion%"=="1" call :informacion_general
if "%seleccion%"=="2" call :informacion_so
if "%seleccion%"=="3" call :informacion_ip
if "%seleccion%"=="4" call :informacion_programas
if "%seleccion%"=="5" call :informacion_disco
if "%seleccion%"=="6" call :informacion_cpu
if "%seleccion%"=="7" call :informacion_ram
if "%seleccion%"=="8" call :informacion_tarjeta_grafica
if "%seleccion%"=="9" call :informacion_bios
if "%seleccion%"=="10" call :informacion_procesos
if "%seleccion%"=="11" call :informacion_firewall
if "%seleccion%"=="12" call :informacion_actualizaciones
if "%seleccion%"=="13" call :informacion_servicios
if "%seleccion%"=="14" call :informacion_red
if "%seleccion%"=="15" call :informacion_usuarios
if "%seleccion%"=="16" call :informacion_grupos
if "%seleccion%"=="17" call :informacion_unidades
if "%seleccion%"=="18" call :informacion_dispositivos
if "%seleccion%"=="19" call :informacion_mac
goto opcion_selectiva

:informacion_general
echo INFORMACION GENERAL > info.txt
echo ---------------------------- >> info.txt
echo Usuario actual: %USERNAME% >> info.txt
echo Computadora: %COMPUTERNAME% >> info.txt
goto :eof

:informacion_so
echo SISTEMA OPERATIVO >> info.txt
echo ---------------------------- >> info.txt
systeminfo >> info.txt
goto :eof

:informacion_ip
echo CONFIGURACION DE IP >> info.txt
echo ---------------------------- >> info.txt
ipconfig /all >> info.txt
goto :eof

:informacion_programas
echo PROGRAMAS INSTALADOS >> info.txt
echo ---------------------------- >> info.txt
wmic product get name,version >> info.txt
goto :eof

:informacion_disco
echo INFORMACION DE DISCO >> info.txt
echo ---------------------------- >> info.txt
wmic logicaldisk get size,freespace,caption >> info.txt
goto :eof

:informacion_cpu
echo INFORMACION DE LA CPU >> info.txt
echo ---------------------------- >> info.txt
wmic cpu get name,CurrentClockSpeed,MaxClockSpeed >> info.txt
goto :eof

:informacion_ram
echo INFORMACION DE LA MEMORIA RAM >> info.txt
echo ---------------------------- >> info.txt
wmic MEMORYCHIP get BankLabel, Capacity, Speed >> info.txt
goto :eof

:informacion_tarjeta_grafica
echo INFORMACION DE LA TARJETA GRAFICA >> info.txt
echo ---------------------------- >> info.txt
wmic path win32_videocontroller get name >> info.txt
goto :eof

:informacion_bios
echo INFORMACION DE LA BIOS >> info.txt
echo ---------------------------- >> info.txt
wmic bios get manufacturer,version >> info.txt
goto :eof

:informacion_procesos
echo PROCESOS EN EJECUCION >> info.txt
echo ---------------------------- >> info.txt
tasklist >> info.txt
goto :eof

:informacion_firewall
echo ESTADO DEL FIREWALL DE WINDOWS >> info.txt
echo ---------------------------- >> info.txt
netsh advfirewall show allprofiles >> info.txt
goto :eof

:informacion_actualizaciones
echo INFORMACION DE ACTUALIZACIONES DE WINDOWS >> info.txt
echo ---------------------------- >> info.txt
wmic qfe list brief /format:list >> info.txt
goto :eof

:informacion_servicios
echo SERVICIOS EN EJECUCION >> info.txt
echo ---------------------------- >> info.txt
net start >> info.txt
goto :eof

:informacion_red
echo CONEXIONES DE RED ACTIVAS >> info.txt
echo ---------------------------- >> info.txt
netstat -an >> info.txt
goto :eof

:informacion_usuarios
echo INFORMACION DE USUARIOS >> info.txt
echo ---------------------------- >> info.txt
net users >> info.txt
goto :eof

:informacion_grupos
echo GRUPOS EN EL SISTEMA >> info.txt
echo ---------------------------- >> info.txt
net localgroup >> info.txt
goto :eof

:informacion_unidades
echo UNIDADES DE RED MAPEADAS >> info.txt
echo ---------------------------- >> info.txt
net use >> info.txt
goto :eof

:informacion_dispositivos
echo DISPOSITIVOS DE HARDWARE >> info.txt
echo ---------------------------- >> info.txt
wmic path win32_physicalmedia get Tag, SerialNumber >> info.txt
goto :eof

:informacion_mac
echo DIRECCION MAC >> info.txt
echo ---------------------------- >> info.txt
getmac >> info.txt
goto :eof

:fin
echo Tarea completada. La información ha sido guardada en info.txt.
pause
