@echo off
echo === Verificando Conformidade com PROJECT_LAW ===
echo.

superclaude review . ^
  --context "Laws/PROJECT_LAW.md" ^
  --instructions "Realizar auditoria completa de conformidade com PROJECT_LAW.md. Use o CHECKLIST DE CONFORMIDADE completo e reporte: 1) Itens em conformidade (✅), 2) Itens pendentes (⏳), 3) Violações encontradas (❌). Seja extremamente rigoroso." ^
  --save-conversation "logs/compliance-check-%date:~-4%%date:~3,2%%date:~0,2%.md"

echo.
echo Verificação concluída! Veja o relatório em logs/
pause