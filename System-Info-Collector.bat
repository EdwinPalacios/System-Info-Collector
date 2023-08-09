@echo off
setlocal enabledelayedexpansion

echo -------------------------------------------------------------------------------------------------------
echo "                   .--.--.                  ,---,              ,----..                               "
echo "                  /  /    '.             ,`--.' |             /   /   \                              "
echo "                 |  :  /`. /      ,---,. |   :  :     ,---,. |   :     :                             "
echo "                 ;  |  |--`     ,'  .' | :   |  '   ,'  .' | .   |  ;. /                             "
echo "                 |  :  ;_     ,---.'   , |   :  | ,---.'   , .   ; /--`                              "
echo "                  \  \    `.  |   |    | '   '  ; |   |    | ;   | ;                                 "
echo "                   `----.   \ :   :  .'  |   |  | :   :  .'  |   : |                                 "
echo "                   __ \  \  | :   |.'    '   :  ; :   |.'    .   | '___                              "
echo "                  /  /`--'  / `---'      |   |  ' `---'      '   ; : .'|                             "
echo "                 '--'.     /             '   :  |            '   | '/  :                             "
echo "                   `--'---'              ;   |.'             |   :    /                              "
echo "                                         '---'                \   \ .'                               "
echo "                                                               `---`                                 "
echo -------------------------------------------------------------------------------------------------------

echo -------------------------------------------------------------------------------------------------------
echo Autor: EdwinPalacios
echo Versión: 1.1
echo Repositorio: https://github.com/EdwinPalacios/System-Info-Collector
echo Propósito: Recopilar información del sistema para tareas de diagnóstico
echo -------------------------------------------------------------------------------------------------------

echo Descargo de responsabilidad: Este script está destinado únicamente a fines educativos y diagnósticos.
echo No debe ser utilizado para ninguna actividad ilegal o no autorizada.
echo El usuario es el único responsable de su uso.

echo -------------------------------------------------------------------------------------------------------

:menu_principal
echo Seleccione la opción deseada:
echo 1. Recopilar toda la información
echo 2. Recopilar información selectiva
echo 3. Ayuda
echo 4. Salir
set /p opcion=Ingrese una opción:

if "%opcion%"=="4" goto fin
if "%opcion%"=="3" goto ayuda
if "%opcion%"=="1" goto opcion_toda
if "%opcion%"=="2" goto opcion_selectiva
echo Opción inválida. Por favor, intente nuevamente.
goto menu_principal

:ayuda
echo Aquí puedes encontrar información detallada sobre cada opción:
echo 1. Recopilar toda la información: recopila y guarda toda la información disponible del sistema.
echo 2. Recopilar información selectiva: permite elegir y recopilar información específica del sistema.
echo 3. Ayuda: muestra este menú de ayuda.
echo 4. Salir: cierra el script.
pause
goto menu_principal

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
if "%seleccion%" geq "1" if "%seleccion%" leq "19" (
    call :recopilar_info %seleccion%
    goto opcion_selectiva
)
echo Opción inválida. Por favor, intente nuevamente.
goto opcion_selectiva

:recopilar_info
if "%1"=="1" call :informacion_general
if "%1"=="2" call :informacion_so
if "%1"=="3" call :informacion_ip
if "%1"=="4" call :informacion_programas
if "%1"=="5" call :informacion_disco
if "%1"=="6" call :informacion_cpu
if "%1"=="7" call :informacion_ram
if "%1"=="8" call :informacion_tarjeta_grafica
if "%1"=="9" call :informacion_bios
if "%1"=="10" call :informacion_procesos
if "%1"=="11" call :informacion_firewall
if "%1"=="12" call :informacion_actualizaciones
if "%1"=="13" call :informacion_servicios
if "%1"=="14" call :informacion_red
if "%1"=="15" call :informacion_usuarios
if "%1"=="16" call :informacion_grupos
if "%1"=="17" call :informacion_unidades
if "%1"=="18" call :informacion_dispositivos
if "%1"=="19" call :informacion_mac
goto :eof

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

:end
echo Error: algo salió mal. Consulte el archivo log.txt para obtener más detalles.
echo Logfile >> log.txt
date /T >> log.txt
time /T >> log.txt
echo ---------------------------- >> log.txt