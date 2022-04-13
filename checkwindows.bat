@echo on
sfc /scannow && dism /online /cleanup-image /scanhealth && dism /online /cleanup-image /checkhealth && dism /online /cleanup-image /restorehealth


timeout /t 50