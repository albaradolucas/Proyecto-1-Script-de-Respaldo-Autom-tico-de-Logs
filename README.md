# Proyecto 1 – Respaldo Automático de Logs

## 🎯 Objetivo
Crear un script que realice un respaldo automático de los archivos `.log` ubicados en `/var/log/`, generando un directorio con la fecha del día, comprimiendo los logs y registrando el resultado en un archivo de control.

## 📌 Requisitos mínimos
- Crear un directorio `/backup/log/AAAAMMDD/` donde se copien los archivos `.log`.
- Comprimir ese directorio en un archivo `.tar.gz`.
- Registrar en `/backup/backup.log` la fecha de ejecución y si el proceso fue exitoso.
- Eliminar la carpeta temporal una vez generado el `.tar.gz`.
- Código de salida:
  - `0` → respaldo exitoso.
  - `1` → no hay archivos para copiar o error en el proceso.

## ✨ Extra (opcional)
- Verificar permisos de escritura en `/backup` antes de ejecutar.
- Guardar también un archivo `/backup/backup.err` con los intentos fallidos.
- Implementar rotación de backups, manteniendo solo los últimos *N* días.

## 🚀 Entregables
- Script funcional: `respaldo_atm_bkp_logs.sh`.
- Carpeta `/backup` con subdirectorios comprimidos por fecha.
- Archivo de control: `/backup/backup.log`.
